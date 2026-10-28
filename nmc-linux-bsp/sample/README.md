# Sample Boot Images

Pre-built images for each build system, with PCIe disabled. Flash the payload and disk image from the **same** build system — the Buildroot and Yocto U-Boots look for the kernel in different places. The eMMC disk images are too large for the repo and are in the [release downloads](https://github.com/nextage-llc/nmc-bsp/releases); SHA-256 checksums are in the [CHANGELOG](../../CHANGELOG.md).

| Build system | Payload (in this folder) — flash over YMODEM | eMMC disk image (release downloads) — flash over TFTP |
| ------------ | --------------------------------------------- | ----------------------------------------------------- |
| Buildroot | `buildroot/payload-buildroot.bin` — [Step 6](../buildroot/README.md#step-6-flash-payload-buildrootbin-to-emmc-ymodem-uart0) | `nmc2v3-buildroot.img` — [Step 7](../buildroot/README.md#step-7-flash-nmc2v3-buildrootimg-to-emmc-tftp-uart1) |
| Yocto | `yocto/payload-yocto.bin` — [Step 7](../yocto/README.md#step-7-flash-payload-yoctobin-to-emmc-ymodem-uart0) | `nmc2v3-yocto.wic.gz` — [Step 8](../yocto/README.md#step-8-flash-nmc2v3-yoctowicgz-to-emmc-tftp-uart1) |

To build your own instead, see Part 1 of the [Buildroot](../buildroot/README.md#part-1-build-the-images) or [Yocto](../yocto/README.md#part-1-build-the-images) guide.
