# Changelog

## 2026.10

First release of the NMC2v3 BSP (`nextage-llc/nmc-bsp`): FPGA reference design, HSS, Linux (Buildroot and Yocto) and RTEMS in one repository.

### Versions

| Component | Version |
| --------- | ------- |
| FPGA design | NMC2v3 design version 300 (Libero SoC 2025.2.0.14) |
| HSS | Microchip v2026.04.1 + NMC2v3 board, Build ID: *filled in at release* |
| Linux / U-Boot | 6.18.17-linux4microchip-2026.04.1 / 2025.07-linux4microchip-2026.04 |
| Buildroot | 2025.02.11 + `buildroot-external-microchip` `ebdcfd7` |
| Yocto | scarthgap, `meta-mchp` `linux4microchip-2026.04` |
| RTEMS | 6.1 (RSB 6.1, GCC 13.3.0), BSP `riscv/mpfs64imafdc` |

### Changes

- **FPGA:** three Core16550 UARTs on FIC3 (FPGA_422_1 and FPGA_422_2 RS-422, 3.3 V TTL on J1); CoreGPIO for SW2 and the RGB LED; PCIe root port x2 kept; MSS configuration included (`fpga/mss/`).
- **HSS:** the NMC2v3 eMMC settings (4-bit bus, High Speed DDR at 3.3 V) are opt-in options enabled only for NMC2v3, so other boards build as Microchip ships them; changes listed in `hart-software-services/UPSTREAM.md`.
- **Linux:**
  - Serial `ttyS4`–`ttyS6` (fabric UARTs); MMUART_4 is `serial3` (`ttyS3`); 7 serial ports.
  - CAN_0 enabled: `can0` = CAN_0 (J12 14/15), `can1` = CAN_1 (J12 11/12).
  - `pcie0` disabled; sample images run with PCIe off.
  - eMMC at 3.3 V High Speed DDR (52 MHz) in Linux and U-Boot (Linux previously chose HS200, which needs 1.8 V); QSPI flash at 50 MHz.
  - `/dev/spidev0.0` + `spi-tools`; named GPIO lines for the LEDs and SW2.
  - **Buildroot:** one-command build (`make nmc_defconfig && make`) from an external tree — no copying configs into the build folder.
  - **Yocto:** kernel and U-Boot built from the same NMC configs as Buildroot (previously Microchip's Icicle Kit kernel config, which lacked `ttyS4`–`ttyS6` and the Ethernet PHY driver); build template (no manual layer setup); `spi-tools`; `mmc rescan` in the flashing steps.
- **RTEMS:** device tree corrected to match the board and the Linux device tree (interrupts, clocks, memory, aliases, CAN_0, fabric UARTs, user GPIO, eMMC, QSPI); sample rebuilt on RTEMS 6.1 with the NMC device tree built in (previously RTEMS's Icicle Kit device tree); build steps for the toolchain, BSP and payload; payload generator built from the HSS source.

### Checksums (SHA-256)

*Filled in at release from the final images.*

| File | SHA-256 |
| ---- | ------- |
| `nmc2v3.job` | |
| `nmc2v3-libero.zip` | |
| `nmc2v3-hss.hex` | |
| `nmc2v3-buildroot-payload.bin` (= `sample/buildroot/payload-buildroot.bin`) | |
| `nmc2v3-buildroot.img` | |
| `nmc2v3-yocto-payload.bin` (= `sample/yocto/payload-yocto.bin`) | |
| `nmc2v3-yocto.wic.gz` | |
| `nmc2v3-rtems-payload.bin` (= `sample/payload-rtems.bin`) | |
| `nmc2v3-rtems-ticker.elf` (= `sample/ticker`) | |

### Known issues

- PCIe is left disabled in the device tree: the SSD's 0.9 V rail (U28) does not initialize properly after a power failure. Corrected on NMC2v3.1.
- DDR ECC is not used: the ECC lanes are wired as two lanes instead of four and cannot be calibrated, so the ECC memory is not fitted (DNP).
- Linux reports an L2 cache (CCACHE) ECC DataError at `0x081DFFxx` during boot. No functional impact has been observed; under investigation.
- Buildroot and Yocto boot from different partitions: flash the payload and disk image from the same build system.
- U-Boot can only use Ethernet `eth0` (the PHY management bus is wired to MAC0 only).
