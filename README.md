# NMC2v3 Board Support Package (`nmc-bsp`)

Everything to bring up the Nextage **NMC2v3** (Microchip PolarFire SoC MPFS250T) and build your own software for it: the FPGA reference design, the HSS bootloader, Linux (Buildroot and Yocto) and RTEMS. Use it as-is (our `.job` and pre-built images from the [release downloads](https://github.com/nextage-llc/nmc-bsp/releases)) or customize any part. Releases are named by date (e.g. `2026.10`); versions and changes are in the [CHANGELOG](./CHANGELOG.md).

## Start Here

| Step | What | Go to |
| ---- | ---- | ----- |
| 1 | Program the FPGA design and HSS bootloader (once per board) | [`fpga/README.md`](./fpga/README.md) |
| 2 | Boot **Linux** (Buildroot or Yocto) | [`nmc-linux-bsp/README.md`](./nmc-linux-bsp/README.md) |
| 2 | Boot **RTEMS** | [`nmc-rtems-bsp/README.md`](./nmc-rtems-bsp/README.md) |
| — | Connector pins → Linux devices | [`BOARD_INTERFACES.md`](./BOARD_INTERFACES.md) |

**You need:** a Windows PC with WSL2 (Debian 13 is what this BSP is tested on; Ubuntu 22.04/24.04 should also work, not tested for this release), Libero SoC 2025.2 (for FlashPro Express) and a FlashPro5/6 programmer, Tera Term, USB-to-serial cables for UART0 and UART1, and for Linux a TFTP server (e.g. tftpd64) and an Ethernet cable.

## How the Board Boots

```text
eNVM:  HSS bootloader                  ← programmed with nmc-fpga.job (fpga/)
         │  loads the payload from eMMC
eMMC:  payload
         ├── RTEMS: the RTEMS application                    (nmc-rtems-payload.bin)
         └── Linux: U-Boot ──► kernel + rootfs on the eMMC   (nmc-buildroot-payload.bin + nmc-buildroot.img,
                                                              or nmc-yocto-payload.bin + nmc-yocto.wic.gz)
```

RTEMS or Linux is just a matter of which payload (and, for Linux, which disk image) is on the eMMC.

## Directory Structure

```text
nmc-bsp/
├── README.md, CHANGELOG.md, BOARD_INTERFACES.md
├── fpga/                     # Program the board; MSS configuration; customizing the FPGA design
├── hart-software-services/   # HSS bootloader source (Microchip HSS + NMC2v3 board, see UPSTREAM.md)
├── nmc-linux-bsp/            # Linux: Buildroot and Yocto
├── nmc-rtems-bsp/            # RTEMS: device tree and payload configuration
└── docs/                     # Bring-up guides (PDF)
```

## Rebuild the HSS

Only needed if you change the HSS — the release `.job` already contains it. The HSS is Microchip's [Hart Software Services](https://github.com/polarfire-soc/hart-software-services) v2026.04.1 plus the NMC2v3 board; every NMC change is listed in [`UPSTREAM.md`](./hart-software-services/UPSTREAM.md). It builds on Windows:

1. Install the [xPack GNU RISC-V Embedded GCC](https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases) 15.2.0 (e.g. to `C:\Microchip\xpack-riscv-none-elf-gcc-15.2.0-1`), SoftConsole (for its `build_tools`), and Python 3.
2. Keep this repository at a **short path** such as `C:\nmc-bsp` — the build creates deep paths and fails past Windows' path-length limit.
3. In PowerShell:

   ```powershell
   $env:PATH = "C:\Microchip\xpack-riscv-none-elf-gcc-15.2.0-1\bin;C:\Microchip\SoftConsole-v2022.2-RISC-V-747\build_tools\bin;" + $env:PATH
   cd C:\nmc-bsp\hart-software-services
   make BOARD=NMC2v3
   ```

   The first build creates `.config` from `boards/NMC2v3/def_config`. To change options, run `make BOARD=NMC2v3 menuconfig` (needs Python with `windows-curses`).

4. The eNVM image is `build/bootmode1/hss-envm-wrapper-bm1-p0.hex` — put it into the `.job` as in [`fpga/README.md`](./fpga/README.md#put-a-rebuilt-hss-into-the-job).

The HSS payload generator (`hart-software-services/tools/hss-payload-generator`) is built on Linux: Buildroot and Yocto build their own, and the RTEMS README shows how.

## Additional Resources

- [**Bring-Up Guide**](./docs/nmc-bring-up-guide.pdf) (PDF) — step-by-step walkthrough with photos: software installation, cabling and connector locations, programming the board, and loading Buildroot, Yocto or RTEMS.
