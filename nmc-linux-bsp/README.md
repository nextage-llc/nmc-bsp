# NMC Linux BSP (`nmc-linux-bsp`)

Linux for the NMC2v3: the NMC device trees and U-Boot/kernel configurations, shared by a **Buildroot** and a **Yocto** build, plus sample boot images. Program the board first ([FPGA README](../fpga/README.md)).

## Start Here

Both build systems produce an HSS-wrapped U-Boot **payload** (flashed over YMODEM) and a **disk image** (flashed over TFTP) from the same NMC files. Pick one — each guide is a complete walkthrough.

| I want to... | Go to |
| ------------ | ----- |
| Build and boot Linux with **Buildroot** | [`buildroot/README.md`](./buildroot/README.md) |
| Build and boot Linux with **Yocto** | [`yocto/README.md`](./yocto/README.md) |
| Just flash a pre-built image | [`sample/README.md`](./sample/README.md) |

| | Buildroot | Yocto |
| - | --------- | ----- |
| Upstream base | Buildroot 2025.02.11 + `buildroot-external-microchip` | `meta-mchp` `linux4microchip-2026.04` (scarthgap) |
| Build | `make nmc_defconfig && make` | `bitbake mchp-base-image` |
| Payload / eMMC disk image | `payload-buildroot.bin` / `nmc2v3-buildroot.img` (`mpfs_icicle.itb` on partition 2) | `payload-yocto.bin` / `nmc2v3-yocto.wic.gz` (`fitImage` + `boot.scr` on partition 1) |
| Login | `root` / `root` | `root` / no password |
| First build | ~1 hour | 1–2 hours, ~100 GB disk |

> Flash the payload and disk image from the same build system — the two U-Boots look for the kernel in different places.

## Repository Structure

```text
nmc-linux-bsp/
├── linux/                      # Shared by Buildroot and Yocto
│   ├── nmc_defconfig           # Kernel configuration
│   └── mpfs-nmc-linux.dts      # Linux device tree
├── uboot/                      # Shared by Buildroot and Yocto
│   ├── nmc_defconfig           # U-Boot configuration
│   └── mpfs-nmc-uboot.dts      # U-Boot device tree
├── buildroot/                  # Buildroot external tree: configs/nmc_defconfig, external.mk, README
├── yocto/                      # meta-nmc layer + README
└── sample/                     # Pre-built payloads (disk images are in the release downloads)
```

**Where to make a change:**

- **Board hardware (pins, PHYs, peripherals):** the DTS in `linux/` or `uboot/` — both builds use it.
- **Kernel or U-Boot options:** `nmc_defconfig` in `linux/` or `uboot/` — both builds use it (to edit interactively, see [Buildroot Step 4](./buildroot/README.md#step-4-rebuild-after-a-change)).
- **Buildroot packages / rootfs:** `buildroot/configs/nmc_defconfig`.
- **Yocto packages / rootfs:** a recipe or bbappend in `yocto/meta-nmc`.
