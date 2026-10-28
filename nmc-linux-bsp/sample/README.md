# Sample Boot Images

Pre-built payloads (PCIe disabled): `buildroot/payload-buildroot.bin` and `yocto/payload-yocto.bin`. The matching eMMC disk images (`nmc2v3-buildroot.img`, `nmc2v3-yocto.wic.gz`) are in the [release downloads](https://github.com/nextage-llc/nmc-bsp/releases).

To flash them, follow the "Pre-built" path in the [Buildroot](../buildroot/README.md#choose-your-path) or [Yocto](../yocto/README.md#choose-your-path) guide. Flash the payload and disk image from the same build system.
