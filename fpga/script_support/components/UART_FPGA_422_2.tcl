# Exporting Component Description of UART_FPGA_422_2 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T-1FCG1152E
# Create and Configure the core component UART_FPGA_422_2
# FAMILY:26 (PolarFire SoC) added by hand: Libero's export leaves it out, and without it CORE16550
# picks its ProASIC3 FIFO (synthesis error: undefined module RAM512X18)
create_and_configure_core -core_vlnv {Actel:DirectCore:CORE16550:3.4.101} -component_name {UART_FPGA_422_2} -params {"FAMILY:26"}
# Exporting Component Description of UART_FPGA_422_2 to TCL done
