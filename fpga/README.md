# NMC2v3 FPGA Design (`fpga`)

The NMC2v3 reference design for the PolarFire SoC MPFS250T: the FPGA fabric design and the Microcontroller Subsystem (MSS) configuration the rest of this BSP is built against. Programming it also loads the HSS bootloader into eNVM.

- **Programming file** (FPGA design + HSS) `nmc2v3.job`, **Libero SoC project archive** `nmc2v3-libero.zip` and **HSS eNVM image** `nmc2v3-hss.hex`: [release downloads](https://github.com/nextage-llc/nmc-bsp/releases)
- **MSS configuration:** [`mss/`](./mss) · **HSS source:** [`../hart-software-services`](../hart-software-services)
- **Tools:** Libero SoC 2025.2 (includes FlashPro Express and the PolarFire SoC MSS Configurator)

## Program the Board

Do this on a new board, and whenever you change the FPGA design or the HSS. You need FlashPro Express (with Libero SoC, or the standalone Microchip Program and Debug Tools), a FlashPro5/6 programmer and `nmc2v3.job`.

1. Connect the programmer to the JTAG header **J2** (10-pin) and to the PC by USB, then power the board.
2. In FlashPro Express choose **Project → New Job Project from FlashPro Express Job**, select `nmc2v3.job`, pick a folder, and click **OK**.
3. Check that the programmer is listed, leave the action on **PROGRAM**, and click **RUN**. It ends with **RUN PASSED** after a few minutes.
4. Disconnect the programmer and power cycle the board: the HSS boot banner appears on UART0 (J3, 115200 8N1).

Next, load an operating system: [Linux](../nmc-linux-bsp/README.md) or [RTEMS](../nmc-rtems-bsp/README.md).

## Fabric Memory Map

The fabric blocks the MSS reaches over FIC3 (APB, 50 MHz) and FIC1 (AXI). Fabric interrupt `MSS_INT_F2M[n]` is PLIC interrupt 118 + n. MSS peripherals (Ethernet, CAN, eMMC, QSPI, SPI, I2C, MSS UARTs and GPIO) and connector pins are in [`BOARD_INTERFACES.md`](../BOARD_INTERFACES.md).

| Block | Address | Interrupt | Linux |
| ----- | ------- | --------- | ----- |
| MIV_IHC (inter-hart communication, for Linux + RTEMS on separate harts) | `0x5000_0000` (FIC3 slot 0) | F2M[59–63] = PLIC 177–181 | not used |
| Core16550 UART, FPGA_422_1 (RS-422) | `0x5100_0000` (slot 1) | F2M[2] = PLIC 120 | `ttyS4` |
| Core16550 UART, FPGA_422_2 (RS-422) | `0x5200_0000` (slot 2) | F2M[3] = PLIC 121 | `ttyS5` |
| Core16550 UART, J1 (3.3 V TTL) | `0x5300_0000` (slot 3) | F2M[4] = PLIC 122 | `ttyS6` |
| CoreGPIO: SW2, RGB LED | `0x5400_0000` (slot 4) | F2M[5] = PLIC 123 | lines `SW2_N`, `LED_R`, `LED_G`, `LED_B` |
| PCIe root port x2 | config `0xE000_0000` + memory `0xE100_0000` (FIC1); registers `0x4300_4000` (FIC3) | F2M[1] = PLIC 119 | disabled in the device tree |
| CoreSmartBERT ×2 (XCVR_1 on J4, XCVR_2 on J8) | none (JTAG, Libero SmartDebug) | none | none |

**Free for your own blocks:** FIC3 slots 5–15 (`0x5500_0000`–`0x5F00_0000`) and interrupts F2M[6–58] (PLIC 124–176).

## Customize the Design

**Open the project:** unzip `nmc2v3-libero.zip` and open `NMC2v3.prjx` in Libero SoC 2025.2. The HSS image the design uses is in the project's `hss/` folder. To program your version, generate the bitstream, use **Export FlashPro Express Job**, and program it as above.

**Change the MSS configuration** — it is used in three places, which must match:

1. Open `mss/NMC2v3_MSS.cfg` in the MSS Configurator, make your changes and click **Generate** (rewrites `NMC2v3_MSS.cxz`, `NMC2v3_MSS_mss_cfg.xml` and the report in `mss/`).
2. **Libero:** import the new `NMC2v3_MSS.cxz` (replaces the `NMC2v3_MSS` component) and regenerate the design.
3. **HSS:** copy `NMC2v3_MSS_mss_cfg.xml` to `../hart-software-services/boards/NMC2v3/soc_fpga_design/xml/` and rebuild the HSS.

If you changed peripherals, update the device trees in `../nmc-linux-bsp` and `../nmc-rtems-bsp` to match.

### Put a rebuilt HSS into the `.job`

1. Build the HSS ([Rebuild the HSS](../README.md#rebuild-the-hss)); the eNVM image is `hart-software-services/build/bootmode1/hss-envm-wrapper-bm1-p0.hex`.
2. Copy it over `hss/hss-envm-wrapper-bm1-p0.hex` in the Libero project. If Libero doesn't pick it up, open **Configure Design Initialization Data and Memories** → eNVM tab and point the HSS client at that file again.
3. Generate the bitstream, **Export FlashPro Express Job**, and program the board as above.
