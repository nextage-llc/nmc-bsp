# Upstream

This is Microchip's Hart Software Services (HSS) **v2026.04.1**
(https://github.com/polarfire-soc/hart-software-services, tag `v2026.04.1`)
with the NMC2v3 board added. Everything else is as Microchip ships it.

## NMC changes

| File | Change |
|---|---|
| `boards/NMC2v3/` | NMC2v3 board, made from Microchip's `boards/custom-board-design`: NMC2v3 Libero MSS configuration, `def_config`, and the linker script's high DDR regions sized for the NMC2v3 DDR (1024 MB each) |
| `services/mmc/Kconfig` | New options, off by default: `SERVICE_MMC_BUS_WIDTH_4BIT` (4-bit eMMC bus instead of 8-bit) and `SERVICE_MMC_3V3_DDR` (High Speed DDR instead of SDR at 3.3 V) |
| `services/mmc/mmc_api.c` | eMMC bus width and 3.3 V speed mode follow the two options above (Microchip hardcodes 8-bit / SDR here) |

Both options are enabled only in `boards/NMC2v3/def_config`: the NMC2v3 eMMC has
4 data lines and 3.3 V I/O. Other boards build exactly as upstream.

Not included from upstream: `.github/` (CI) and `boards/custom-board-design/` (replaced by `boards/NMC2v3/`).

## Build

```
make BOARD=NMC2v3
```

`.config` is created from `boards/NMC2v3/def_config` on the first build.
