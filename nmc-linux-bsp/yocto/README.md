# NMC Linux via Yocto

Build and boot **Linux** on the NMC2v3 with Yocto (scarthgap) and Microchip's [`meta-mchp`](https://github.com/linux4microchip/meta-mchp) BSP. The NMC changes are a Yocto layer, [`meta-nmc`](./meta-nmc), added through a build template. See the [Linux BSP README](../README.md) for the layout and the Buildroot alternative.

---

## What `meta-nmc` Does

The NMC uses the same MPFS250T chip as the Icicle Kit, so the build keeps `MACHINE=mpfs-icicle-kit` and `meta-nmc` replaces the Icicle Kit device trees and configs with the NMC ones. (Don't create a custom machine — Microchip's recipes look up files by machine name.)

```text
meta-nmc/
├── conf/layer.conf                         # Sets NMC_BSP_DIR = <bsp root>
├── conf/templates/nmc/                     # Build template: Microchip's layers + meta-nmc (Step 3)
├── recipes-mchp/images/
│   └── mchp-base-image.bbappend            # Adds spi-tools (same as Buildroot)
├── recipes-kernel/linux/
│   └── linux-mchp_%.bbappend               # ../linux/mpfs-nmc-linux.dts + nmc_defconfig
└── recipes-bsp/u-boot/
    ├── u-boot-mchp_%.bbappend              # ../uboot/mpfs-nmc-uboot.dts + nmc_defconfig
    └── files/yocto-boot.cfg                # Yocto boot flow (distro boot via boot.scr)
```

- **Shared with Buildroot:** the bbappends read the DTS and `nmc_defconfig` files from `linux/` and `uboot/`, so keep `meta-nmc` inside the BSP. The kernel builds from `linux/nmc_defconfig` (not Microchip's `mpfs_defconfig` or its Icicle Kit fragments) and U-Boot from `uboot/nmc_defconfig`, so both builds get the same options.
- **The only Yocto-specific setting** is U-Boot's boot method: `yocto-boot.cfg` plus Microchip's `mpfs-icicle-kit.cfg` boot `boot.scr` from partition 1.
- The `%` in the bbappend names matches any recipe version, so they keep working when Microchip updates `linux-mchp` or `u-boot-mchp`.

---

## Before You Begin

- **Program the board first** (FPGA design + HSS) — see the [FPGA README](../../fpga/README.md). The HSS provides the UART0 prompt used to flash the payload.
- **Host:** WSL2 with Debian 13 (tested; Ubuntu 22.04/24.04 should also work, not tested for this release), Tera Term, and a TFTP server such as tftpd64; about 100 GB free disk and 16 GB RAM. The first build (downloads included) took under 2 hours on an 8-core PC.
- **Connections:** USB-to-serial on UART0 and UART1, and an Ethernet cable from the board's J19 (eth0) to the PC.

## Choose Your Path

Two images go on the board: **`nmc-yocto-payload.bin`** (HSS-wrapped U-Boot) and **`nmc-yocto.wic.gz`** (compressed eMMC disk image: boot partition with `fitImage` + `boot.scr`, and the rootfs).

- **Pre-built:** download both from the [release downloads](https://github.com/nextage-llc/nmc-bsp/releases), put them in a Windows folder (e.g. `C:\nmc-images`) and skip to [Part 2](#part-2-hardware-setup--serial-terminals).
- **From source:** start at [Part 1](#part-1-build-the-images).

> Flash the payload and disk image from the same build system: the Yocto U-Boot boots `fitImage` from partition 1 via `boot.scr`, the Buildroot one boots `mpfs_icicle.itb` from partition 2.

---

## Part 1: Build the Images

> Work inside the WSL2 Linux filesystem (e.g. `~/nmc-yocto`), not under `/mnt/c/...` — the Windows-mounted filesystem is much slower and causes path issues.

### Step 1: Install Dependencies

```bash
sudo apt update
sudo apt-get install gawk wget git git-lfs diffstat unzip texinfo gcc \
  build-essential chrpath socat cpio python3 python3-pip \
  python3-pexpect xz-utils debianutils iputils-ping python3-git \
  python3-jinja2 python3-subunit zstd lz4 file locales \
  libacl1 libgl1 bmap-tools
sudo locale-gen en_US.UTF-8
```

Install Google's `repo` tool (Debian does not package it), then open a new terminal so `~/.local/bin` is on your `PATH` (`repo version` should work):

```bash
mkdir -p ~/.local/bin
curl -fsSL https://storage.googleapis.com/git-repo-downloads/repo -o ~/.local/bin/repo
chmod a+rx ~/.local/bin/repo
```

### Step 2: Fetch Microchip's Yocto BSP and This BSP

Set your git identity once (`repo init` asks for it), then fetch the Microchip layers and clone this BSP next to them:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git lfs install

mkdir -p ~/nmc-yocto && cd ~/nmc-yocto
repo init -u https://github.com/linux4microchip/meta-mchp-manifest.git \
  -b refs/tags/linux4microchip-2026.04 -m polarfire-soc/default.xml
repo sync
git clone https://github.com/nextage-llc/nmc-bsp.git
```

> Stay on `linux4microchip-2026.04` — this BSP's kernel (`6.18.17-linux4microchip-2026.04.1`) and U-Boot (`2025.07-linux4microchip-2026.04`) configs and device trees come from that release, and a newer tag may need changes. Don't use the old `meta-polarfire-soc-yocto-bsp` repo (archived April 2026).

### Step 3: Initialize the Build Environment

The NMC build template sets up Microchip's layers, `meta-nmc` and `MACHINE=mpfs-icicle-kit`:

```bash
cd ~/nmc-yocto
TEMPLATECONF=$PWD/nmc-bsp/nmc-linux-bsp/yocto/meta-nmc/conf/templates/nmc \
  source openembedded-core/oe-init-build-env
bitbake-layers show-layers | grep nmc
```

The last command should list `meta-nmc`. The template is applied only when `build/conf` is first created (delete `build/conf` to re-apply it). In every new shell, run `cd ~/nmc-yocto && source openembedded-core/oe-init-build-env` before `bitbake`.

### Step 4: Build the Images

```bash
bitbake mchp-base-image
```

The first build takes one to a few hours; later builds only rebuild what changed. Look for `There were 0 ERROR messages`. The images are in `build/tmp-glibc/deploy/images/mpfs-icicle-kit/`: `payload.bin` and `mchp-base-image-mpfs-icicle-kit.rootfs.wic.gz`. If the build stops with `do_package` errors mentioning `Bad address`, see [Known Issues](#do_package-fails-with-bad-address).

### Step 5: Copy the Images to Windows

The TFTP server and Tera Term run on Windows. Copy the images out (rather than browsing `\\wsl$`, where the deploy names are symlinks):

```bash
mkdir -p /mnt/c/nmc-images
cd ~/nmc-yocto/build/tmp-glibc/deploy/images/mpfs-icicle-kit
cp payload.bin /mnt/c/nmc-images/nmc-yocto-payload.bin
cp mchp-base-image-mpfs-icicle-kit.rootfs.wic.gz /mnt/c/nmc-images/nmc-yocto.wic.gz
```

> These are the release download names, so the flashing steps are the same for your build and the pre-built images. Always flash the compressed `.wic.gz` (about 140 MB), not the `.wic` (see [Known Issues](#tftpboot-fails-with-trying-to-overwrite-reserved-memory)).

---

## Part 2: Hardware Setup & Serial Terminals

### Step 6: Connect the Board and Open the Serial Terminals

The board has two USB serial ports:

- **UART0 (HSS bootloader):** hardware initialization and boot logs.
- **UART1 (U-Boot & Linux console):** DDR training, the OpenSBI banner, U-Boot, and the Linux console once booted.

Connect the board's USB cable to the PC and open two Tera Term windows at **115200 8N1, no flow control**: **Window 1** on the first COM port (HSS), **Window 2** on the second (U-Boot / Linux).

---

## Part 3: Flash and Boot

### Step 7: Flash `nmc-yocto-payload.bin` to eMMC (YMODEM, UART0)

1. Power cycle or press Reset, and immediately press any key in Window 1 to stop auto-boot at the HSS `>>` prompt.
2. Type `YMODEM` and press Enter, then `2` (**MMC Init**) and `3` (**YMODEM Receive**), each followed by Enter.
3. In Window 1, choose **File → Transfer → YMODEM → Send...**, select `C:\nmc-images\nmc-yocto-payload.bin`, click **Open**, and wait for the transfer to finish.
4. Type `5` (**MMC Write**) to write it permanently to eMMC, then `6` to quit.

> **Checkpoint:** a reset should now land at a U-Boot prompt in Window 2. Resolve this before Step 8.

### Step 8: Flash `nmc-yocto.wic.gz` to eMMC (TFTP, UART1)

1. Connect the board's J19 Ethernet port (eth0 end of the cable) to the PC. Start a TFTP server (e.g. **tftpd64**) on that interface, pointed at the folder containing `nmc-yocto.wic.gz` (e.g. `C:\nmc-images`). Note the interface's IP address; set it manually on the host adapter if needed.
2. In Window 2, set `serverip` to that address and `ipaddr` to an unused address on the same subnet:

   ```text
   setenv serverip 169.254.69.98
   setenv ipaddr 169.254.69.99
   ```

3. Load and write the image. `gzwrite` decompresses while writing, so only the compressed image has to fit in RAM (check it exists with `help gzwrite`):

   ```text
   tftpboot 0x84000000 nmc-yocto.wic.gz
   mmc dev 0
   gzwrite mmc 0 0x84000000 ${filesize}
   ```

   `gzwrite` prints the bytes written (721,726,464 for the 2026.10 image) and a CRC.

4. U-Boot still has the old partition table in memory, so re-read the eMMC and check the result:

   ```text
   mmc rescan
   part list mmc 0
   ls mmc 0:1
   ```

   `part list` should show three partitions named `boot`, `primary` and `root`, and `ls` should list `boot.scr`, `fitImage` and `uboot.env`.

### Step 9: Boot Linux from eMMC

Reset the board — it boots Linux by itself (U-Boot runs `boot.scr` from the boot partition, so there is no `bootcmd` to save). If it stops at the U-Boot prompt, boot manually:

```text
fatload mmc 0:1 0x84000000 fitImage
bootm 0x84000000
```

Login: `root`, no password.

---

## Known Issues

### Icicle Kit device tree overlays

Microchip builds device tree overlays for this machine that assume Icicle Kit nodes, so check the boot log for overlay errors.

### `do_package` fails with `Bad address`

If a build stops with `do_package` errors including `got *at() syscall for unknown directory` and `tar: ... Cannot open: Bad address`, the host `tar` is failing under Yocto's fake-root tool (seen after Ubuntu 22.04 updated `tar` to `1.34+dfsg-1ubuntu0.1.22.04.6`). Use the `tar` from Yocto's prebuilt host tools:

```bash
cd ~/nmc-yocto
./openembedded-core/scripts/install-buildtools
source ~/nmc-yocto/openembedded-core/buildtools/environment-setup-x86_64-pokysdk-linux
source openembedded-core/oe-init-build-env
rm -rf ~/nmc-yocto/build/tmp-glibc/hosttools
tar --version | head -1     # should report tar 1.35
```

Deleting `hosttools` is needed because BitBake keeps links to the host programs it found earlier; after rebuilding, `ls -l ~/nmc-yocto/build/tmp-glibc/hosttools/tar` should point into `buildtools`. In every new shell, run both `source` lines (buildtools first) before `bitbake`.

### `tftpboot` fails with `trying to overwrite reserved memory`

The uncompressed `.wic` does not fit in U-Boot's RAM at the load address. Send `nmc-yocto.wic.gz` and write it with `gzwrite` (Step 8).

---

## Additional Resources

- [**Bring-Up Guide**](../../docs/nmc-bring-up-guide.pdf) (PDF) — step-by-step walkthrough with photos: software installation, cabling and connector locations, programming the board, and flashing.
