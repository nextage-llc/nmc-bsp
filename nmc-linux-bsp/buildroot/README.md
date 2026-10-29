# NMC Linux via Buildroot

Build and boot **Linux** on the NMC2v3 with Buildroot. This folder is a Buildroot external tree: `configs/nmc_defconfig` builds the NMC image on top of Microchip's `buildroot-external-microchip`, using the shared kernel and U-Boot configs and device trees in `../linux/` and `../uboot/`. See the [Linux BSP README](../README.md) for the layout and the Yocto alternative.

---

## Before You Begin

- **Program the board first** (FPGA design + HSS) — see the [FPGA README](../../fpga/README.md). The HSS provides the UART0 prompt used to flash the payload.
- **Host:** WSL2 with Debian 13 (tested; Ubuntu 22.04/24.04 should also work, not tested for this release), Tera Term, and a TFTP server such as tftpd64.
- **Connections:** USB-to-serial on UART0 and UART1, and an Ethernet cable from the board's J19 (eth0) to the PC.

## Choose Your Path

Two images go on the board: **`nmc-buildroot-payload.bin`** (HSS-wrapped U-Boot) and **`nmc-buildroot.img`** (eMMC disk image: kernel + DTB + rootfs).

- **Pre-built:** download both from the [release downloads](https://github.com/nextage-llc/nmc-bsp/releases), put them in a Windows folder (e.g. `C:\nmc-images`) and skip to [Part 2](#part-2-hardware-setup--serial-terminals).
- **From source:** start at [Part 1](#part-1-build-the-images).

---

## Part 1: Build the Images

### Step 1: Install Dependencies

```bash
sudo apt-get install subversion build-essential bison flex gettext \
  libncurses5-dev texinfo autoconf automake libtool mercurial git-core \
  gperf gawk expat curl cvs libexpat-dev bzr unzip bc python3-dev \
  wget cpio rsync xxd bmap-tools libgnutls28-dev libgl1
```

> Work inside the WSL2 Linux filesystem (e.g. `~/nmc-buildroot`), not under `/mnt/c/...` — the Windows-mounted filesystem is much slower and causes path issues.

### Step 2: Set Up Your Workspace

Clone Buildroot, Microchip's external tree and this BSP side by side, at the versions this BSP is tested with:

```bash
mkdir -p ~/nmc-buildroot && cd ~/nmc-buildroot

git clone https://git.busybox.net/buildroot -b 2025.02.11
git clone https://github.com/linux4microchip/buildroot-external-microchip.git
git -C buildroot-external-microchip checkout ebdcfd7
git clone https://github.com/nextage-llc/nmc-bsp.git
```

> Buildroot rejects environment variables containing spaces, and WSL2 adds the Windows `PATH` (which has spaces) — if `make` complains, run `export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin` first.

### Step 3: Build

```bash
cd ~/nmc-buildroot/buildroot
make BR2_EXTERNAL=../buildroot-external-microchip:../nmc-bsp/nmc-linux-bsp/buildroot nmc_defconfig
make
```

The first build takes about an hour. The images land in `buildroot/output/images/`: `payload.bin` and `sdcard.img` (the eMMC disk image; it contains `mpfs_icicle.itb` and `boot.vfat`, also there). Buildroot remembers both external trees, so later builds are just `make`.

The TFTP server and Tera Term run on Windows, so copy the two images out of WSL under the names the flashing steps use:

```bash
mkdir -p /mnt/c/nmc-images
cp ~/nmc-buildroot/buildroot/output/images/payload.bin /mnt/c/nmc-images/nmc-buildroot-payload.bin
cp ~/nmc-buildroot/buildroot/output/images/sdcard.img /mnt/c/nmc-images/nmc-buildroot.img
```

### Step 4: Rebuild After a Change

After pulling or editing the NMC files, run from `~/nmc-buildroot/buildroot`:

| You changed | Run |
| ----------- | --- |
| A device tree (`../linux/*.dts`, `../uboot/*.dts`) | `make linux-rebuild uboot-rebuild host-hss-payload-generator-rebuild all` |
| The kernel config (`../linux/nmc_defconfig`) | `make linux-reconfigure udmabuf-rebuild all` |
| The U-Boot config (`../uboot/nmc_defconfig`) | `make uboot-reconfigure host-hss-payload-generator-rebuild all` |
| Packages / rootfs (`configs/nmc_defconfig`) | `make nmc_defconfig`, then `make` |

> `udmabuf` is a kernel module built outside the kernel, so it is rebuilt with every kernel change; `host-hss-payload-generator-rebuild` regenerates `payload.bin` from the new U-Boot. To change options interactively, use `make linux-menuconfig` / `uboot-menuconfig` / `menuconfig`, then save back with `make linux-update-defconfig` / `uboot-update-defconfig` / `savedefconfig`.

---

## Part 2: Hardware Setup & Serial Terminals

### Step 5: Connect the Board and Open the Serial Terminals

The board has two USB serial ports:

- **UART0 (HSS bootloader):** hardware initialization and boot logs.
- **UART1 (U-Boot & Linux console):** U-Boot commands and the Linux console once booted.

Connect the board's USB cable to the PC and open two Tera Term windows at **115200 8N1, no flow control**: **Window 1** on the first COM port (HSS), **Window 2** on the second (U-Boot / Linux).

---

## Part 3: Flash and Boot

### Step 6: Flash `nmc-buildroot-payload.bin` to eMMC (YMODEM, UART0)

1. Power cycle or press Reset, and immediately press any key in Window 1 to stop auto-boot at the HSS `>>` prompt.
2. Type `YMODEM` and press Enter, then `2` (**MMC Init**) and `3` (**YMODEM Receive**), each followed by Enter.
3. In Window 1, choose **File → Transfer → YMODEM → Send...**, select `C:\nmc-images\nmc-buildroot-payload.bin`, click **Open**, and wait for the transfer to finish.
4. Type `5` (**MMC Write**) to write it permanently to eMMC, then `6` to quit.

> **Checkpoint:** a reset should now land at a U-Boot prompt in Window 2. Resolve this before Step 7.

### Step 7: Flash `nmc-buildroot.img` to eMMC (TFTP, UART1)

1. Connect the board's J19 Ethernet port (eth0 end of the cable) to the PC. Start a TFTP server (e.g. **tftpd64**) on that interface, pointed at the folder containing `nmc-buildroot.img` (e.g. `C:\nmc-images`). Note the interface's IP address; set it manually on the host adapter if needed.
2. In Window 2, set `serverip` to the PC's Ethernet address and `ipaddr` to an unused address on the same subnet:

   ```text
   setenv ipaddr 169.254.69.99
   setenv serverip 169.254.69.98
   ```

3. Load and write the image:

   ```text
   tftpboot 0x84000000 nmc-buildroot.img
   setexpr blkcnt ${filesize} + 0x1ff
   setexpr blkcnt ${blkcnt} / 0x200
   mmc dev 0
   mmc write 0x84000000 0 ${blkcnt}
   ```

### Step 8: Boot Linux from eMMC

```text
fatload mmc 0:2 0x84000000 mpfs_icicle.itb
bootm 0x84000000
```

Later, `boot` or a power cycle boots it directly (if a reset stops at the U-Boot prompt, see [Known Issues](#reset-lands-at-the-u-boot-prompt-instead-of-booting-linux)). Login: `root` / `root`.

---

## Known Issues

### Reset lands at the U-Boot prompt instead of booting Linux

`bootcmd` hasn't been saved yet. Check it, and if it matches, save it — resets then boot straight into Linux:

```text
printenv bootcmd
# bootcmd=fatload mmc 0:2 0x84000000 mpfs_icicle.itb; bootm 0x84000000
saveenv
```

### `make` reports `Clock skew detected`

The WSL2 clock has drifted from Windows, which can make `make` skip or repeat steps. Run `wsl --shutdown` from Windows, reopen WSL, and run `make` again.

---

## Additional Resources

- [**Bring-Up Guide**](../../docs/nmc-bring-up-guide.pdf) (PDF) — step-by-step walkthrough with photos: software installation, cabling and connector locations, programming the board, and flashing.
