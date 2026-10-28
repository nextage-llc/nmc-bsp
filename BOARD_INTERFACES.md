# NMC2v3 Board Interfaces

Each connector function on the NMC2v3, the Linux device it appears as with the reference design, and how to use it. RTEMS uses the same numbering (`serial0`–`serial6`, `can0`/`can1`). Addresses and interrupts are in [`fpga/README.md`](./fpga/README.md#what-the-design-contains).

## Serial (115200 8N1 by default)

| Linux | Port | Type | Connector |
| ----- | ---- | ---- | --------- |
| `ttyS0` | MMUART_0 | HSS console (free once Linux runs) | J3 |
| `ttyS1` | MMUART_1 | U-Boot / Linux console | J11 |
| `ttyS2` | MMUART_2 | RS-422 | J12 pins 1–4 |
| `ttyS3` | MMUART_4 | RS-422 | J5 E28/E31 RX, E33/E32 TX |
| `ttyS4` | Core16550 (fabric) | RS-422 | J12 pins 6–9 |
| `ttyS5` | Core16550 (fabric) | RS-422 | J5 E34–E38 |
| `ttyS6` | Core16550 (fabric) | 3.3 V TTL | J1 pin 2 TX, pin 3 RX |

RS-422 ports need an RS-422 transceiver or adapter on the other end. Use: `stty -F /dev/ttyS2 115200 raw -echo`.

## CAN, SPI, I2C

| Linux | Interface | Connector | Use |
| ----- | --------- | --------- | --- |
| `can0` | CAN_0 (pins routed through the FPGA) | J12 pins 14/15 | `ip link set can0 up type can bitrate 500000`, `cansend`, `candump` |
| `can1` | CAN_1 (MSS I/O) | J12 pins 11/12 | as above |
| `/dev/spidev0.0` | SPI0 | J12 pin 18 CS, 19 MISO, 20 MOSI, 21 CLK | `spi-config`, `spi-pipe` |
| `/dev/i2c-1` | I2C1 | J12 pins 24/25, J4 A17/A27 | `i2cdetect -y 1` |

I2C1 has **no pull-ups on the NMC** — the daughterboard must provide them.

## Ethernet and storage

| Linux | Interface | Where |
| ----- | --------- | ----- |
| `end0`, `end1` | Ethernet ×2 (VSC8662 PHYs) | J19 → 2× RJ45 (U-Boot can only use `eth0`) |
| `/dev/mmcblk0` | eMMC (4-bit, 3.3 V, HS DDR) | on board |
| `/dev/mtd0` | QSPI NOR flash (128 MiB) | on board |
| — | PCIe root port x2 + SSD | on board, disabled by default (`pcie0` in the Linux device tree) |

## LEDs and button

Plain GPIO lines with no behaviour attached; the LEDs are **active low** (write `0` to turn on).

| Line name | What | Controller |
| --------- | ---- | ---------- |
| `LED_D13`, `LED_D16`, `LED_D18` | Green LEDs D13/D16/D18 | MSS GPIO_1_0 / GPIO_0_12 / GPIO_0_11 |
| `LED_R`, `LED_G`, `LED_B` | RGB LED | CoreGPIO (FPGA) |
| `SW2_N` | Push button SW2 (low when pressed) | CoreGPIO (FPGA) |

Use (libgpiod 2): `gpioset -t0 LED_D13=0` (on), `gpioget SW2_N`, `gpiomon SW2_N`. `gpioinfo` lists `SW2_N` as an output until it is first read; that is normal. Under RTEMS or bare metal, use Microchip's MSS GPIO and CoreGPIO drivers. SW1 is the board reset.

## Stacking connectors J4 / J5

Not used by the reference design: the stacking I/O pins are high-Z with a weak pull-up until your FPGA design uses them. **96 of the J4/J5 signals go to package balls that are not connected on the MPFS250T** (usable only with an MPFS460T). J4 and J8 also carry the transceiver lanes XCVR_1 and XCVR_2 (testable with SmartBERT in Libero SmartDebug).

## Not available

SPI1, I2C0, USB and MMUART_3 are not brought out and stay disabled.
