# MPFS NMC RTEMS BSP (`nmc-rtems-bsp`)

Boot **RTEMS** on the Microchip PolarFire SoC (MPFS) NMC platform: the NMC device tree for RTEMS, a sample application built with it, and the steps to build and boot your own RTEMS application.

The NMC uses RTEMS 6.1's standard PolarFire SoC BSP (`riscv/mpfs64imafdc`) with the NMC device tree built in, so RTEMS sees the NMC's peripherals with the same numbering as Linux (`serial0`–`serial6` = `ttyS0`–`ttyS6`, `can0` = CAN_0, `can1` = CAN_1).

---

## Repository Structure

```text
nmc-rtems-bsp/
├── dts/
│   ├── mpfs-nmc-rtems.dts              # NMC device tree for RTEMS (source)
│   ├── mpfs-nmc-rtems.dtb              # Compiled device tree
│   └── mpfs-nmc-rtems-dtb.c            # Same, as the C array the RTEMS BSP builds in
└── sample/
    ├── ticker                          # Sample RTEMS application (ELF), built with the NMC device tree
    ├── rtems-payload.yaml              # HSS payload configuration
    └── payload-rtems.bin               # Boot image made from ticker (ready to flash)
```

The HSS bootloader and its payload generator live in [`../hart-software-services`](../hart-software-services).

---

## Before You Begin

- **The board must already be programmed** with the NMC FPGA design and the Hart Software Services (HSS) bootloader in eNVM — see the [FPGA README](../fpga/README.md). The HSS provides the UART0 prompt used to flash the payload below.
- **Host tools:** WSL2 with Debian 13 (what this BSP is tested on; Ubuntu 22.04/24.04 should also work, not tested for this release) for building, and Tera Term for the serial terminals.
- **Connections:** USB-to-serial on UART0 and UART1.

## Choose Your Path

- **Use the pre-built sample:** `sample/payload-rtems.bin` is ready to flash. Skip to [Part 3: Hardware Setup](#part-3-hardware-setup--serial-terminals).
- **Make a boot image from your own RTEMS application:** Part 1, then Part 2 Step 6.
- **Build RTEMS for the NMC from source** (toolchain, BSP and the sample): Parts 1 and 2.

---

## Part 1: Build the Payload Generator

The HSS payload generator wraps an RTEMS application into a `payload.bin` the HSS can boot.

### Step 1: Install Dependencies

```bash
sudo apt-get install build-essential device-tree-compiler libyaml-dev libelf-dev libssl-dev \
  git python3 python-is-python3 bison flex texinfo unzip bzip2 xz-utils
```

> **Note:** Do all cloning/building inside the Linux filesystem (e.g. `~/nmc-rtems`), not under `/mnt/c/...`.

### Step 2: Clone the BSP and Build the Generator

```bash
mkdir -p ~/nmc-rtems && cd ~/nmc-rtems
git clone https://github.com/nextage-llc/nmc-bsp.git
make -C nmc-bsp/hart-software-services/tools/hss-payload-generator
```

> `nmc-bsp` is a private repository: clone it with the GitHub account that was given access. The generator is built at `nmc-bsp/hart-software-services/tools/hss-payload-generator/hss-payload-generator`.

---

## Part 2: Build RTEMS for the NMC

### Step 3: Build the RTEMS 6.1 Toolchain

```bash
cd ~/nmc-rtems
git clone --branch 6.1 https://gitlab.rtems.org/rtems/tools/rtems-source-builder.git rsb
cd rsb/rtems
../source-builder/sb-check
../source-builder/sb-set-builder --prefix=$HOME/nmc-rtems/6 6/rtems-riscv
export PATH=$HOME/nmc-rtems/6/bin:$PATH
```

> `sb-check` should report `Environment is ok`. The build takes about 30 minutes and installs GCC 13.3 for RTEMS 6 (`riscv-rtems6-gcc`) into `~/nmc-rtems/6`. In every new shell, run the `export PATH` line again.

### Step 4: Build the RTEMS BSP with the NMC Device Tree

```bash
cd ~/nmc-rtems
git clone --branch 6.1 https://gitlab.rtems.org/rtems/rtos/rtems.git
cd rtems
cat > config.ini << EOF
[riscv/mpfs64imafdc]
RTEMS_POSIX_API = True
RTEMS_SMP = True
BUILD_SAMPLES = True
BSP_DTB_IS_SUPPORTED = True
BSP_DTB_HEADER_PATH = $HOME/nmc-rtems/nmc-bsp/nmc-rtems-bsp/dts/mpfs-nmc-rtems-dtb.c
BSP_START_COPY_FDT_FROM_U_BOOT = False
EOF
./waf configure --prefix=$HOME/nmc-rtems/6
./waf
./waf install
```

> `BSP_DTB_HEADER_PATH` builds the NMC device tree into RTEMS in place of the BSP's default (Microchip Icicle Kit) one. `BSP_START_COPY_FDT_FROM_U_BOOT = False` because the HSS starts RTEMS directly, with no U-Boot handing over a device tree. `./waf install` installs the BSP into `~/nmc-rtems/6` for building your own applications. The sample is built at `build/riscv/mpfs64imafdc/testsuites/samples/ticker.exe`.

### Step 5: Regenerate the Device Tree (only if you changed `dts/mpfs-nmc-rtems.dts`)

```bash
cd ~/nmc-rtems/nmc-bsp/nmc-rtems-bsp/dts
dtc -I dts -O dtb -o mpfs-nmc-rtems.dtb mpfs-nmc-rtems.dts
rtems-bin2c -C -A 8 -N system_dtb mpfs-nmc-rtems.dtb mpfs-nmc-rtems-dtb
```

Then repeat `./waf` (and `./waf install`) in `~/nmc-rtems/rtems`.

### Step 6: Make the Boot Image (`payload-rtems.bin`)

Copy your application ELF next to `rtems-payload.yaml` (for the sample: `cp ~/nmc-rtems/rtems/build/riscv/mpfs64imafdc/testsuites/samples/ticker.exe sample/ticker`). If your ELF has another name, change `ticker` under `payloads:` in `rtems-payload.yaml` to match. Then:

```bash
cd ~/nmc-rtems/nmc-bsp/nmc-rtems-bsp/sample
../../hart-software-services/tools/hss-payload-generator/hss-payload-generator -c rtems-payload.yaml payload-rtems.bin
```

> **Note:** Seeing `NOTICE: ticker: ignoring >>exec-addr=0x1000000000<< as payload is an ELF file` is normal. ELF binaries contain embedded entry points, so the tool automatically uses the embedded execution address. RTEMS runs from the cached high DDR at `0x10_0000_0000`.

---

## Part 3: Hardware Setup & Serial Terminals

### Step 7: Connect the Board and Open the Serial Terminals

The board has two USB serial ports:

- **UART0 (HSS bootloader):** hardware initialization and boot logs.
- **UART1 (RTEMS console):** the RTEMS application's output.

Connect the board's USB cable to the PC and open two Tera Term windows at **115200 8N1, no flow control**: **Window 1** on the first COM port (HSS), **Window 2** on the second (RTEMS).

---

## Part 4: Flash and Boot

### Step 8: Flash `payload-rtems.bin` to eMMC (YMODEM, UART0)

1. Power cycle or press Reset, and immediately press any key in Window 1 to stop auto-boot at the HSS `>>` prompt.
2. Type `YMODEM` and press Enter, then `2` (**MMC Init**) and `3` (**YMODEM Receive**), each followed by Enter.
3. In Window 1, choose **File → Transfer → YMODEM → Send...**, select `sample/payload-rtems.bin` (or your own), click **Open**, and wait for the transfer to finish.
4. Type `5` (**MMC Write**) to write it permanently to eMMC, then `6` to quit.

### Step 9: Boot the Application

Type `boot` (or power cycle the board). The RTEMS application output appears in Window 2.

---

## Additional Resources

- [**Bring-Up Guide**](../docs/nmc2v3-bring-up-guide-buildroot.pdf) (PDF) — photo walkthrough: software installation, cabling and connector locations, and FPGA/eNVM programming. Its flashing steps target Linux, but the YMODEM payload procedure is the same for RTEMS.
