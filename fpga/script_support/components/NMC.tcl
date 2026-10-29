# Creating SmartDesign "NMC"
set sd_name {NMC}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_RXBUS_F2M} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_RXBUS} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_422_1_RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_422_2_RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_0_11_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_0_12_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_0_13_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_0_8_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {GPIO_1_0_IN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {J1_UART_RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_4_RXD} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PG_0V9} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N_1} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N_2} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P_1} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P_2} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PAD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_RX3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_RX3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_0_DI} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW2_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BG0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TXBUS_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_0_TX_EBL_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TXBUS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAN_1_TX_EBL_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_RSTN} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_422_1_TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_422_2_TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {J1_UART_TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE1_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_B} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_G} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_R} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_0_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_0_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_1_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_2_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_4_TXD} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_0_PERST_OUT_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_CPU_LOCK_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_DDR_LOCK_M2F} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_SS0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX2_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX2_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX3_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_1_TX3_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX2_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX2_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX3_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SERDES_XCVR_2_TX3_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_0_DO} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SSD_DF_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SSD_QE_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SSD_SW_RST_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SSD_WP_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SSD_XIN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_NRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {VSC_SNRESET} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {WE_N} -port_direction {OUT} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MAC_0_MDIO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_0_CLK} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_0_SS0} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[15:0]} -port_is_pad {1}

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SSD_QE_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SSD_WP_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SSD_DF_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {SSD_SW_RST_N} -value {VCC}
# Add APB_ARBITER_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_ARBITER} -instance_name {APB_ARBITER_0}
# Exporting Parameters of instance APB_ARBITER_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0} -params {\
"select_bit:28" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {APB_ARBITER_0}
sd_update_instance -sd_name ${sd_name} -instance_name {APB_ARBITER_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {APB_ARBITER_0:out_low_paddr} -pin_slices {[25:0]}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_paddr}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_psel}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_penable}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_pwrite}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_prdata}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_pwdata}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_pready}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {APB_ARBITER_0:APB_MASTER_low} -pin_names {APB_ARBITER_0:out_low_pslverr}



# Add CLKINT_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKINT} -instance_name {CLKINT_0}



# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}



# Add CORESMARTBERT_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORESMARTBERT_C0_1} -instance_name {CORESMARTBERT_C0_1}



# Add CORESMARTBERT_C0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORESMARTBERT_C0} -instance_name {CORESMARTBERT_C0_2}



# Add FIC3_0x5_APB instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C2} -instance_name {FIC3_0x5_APB}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PADDRS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PSELS0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PENABLES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PWRITES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PRDATAS0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PWDATAS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PREADYS0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave0} -pin_names {FIC3_0x5_APB:PSLVERRS0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave1} -pin_names {FIC3_0x5_APB:PADDRS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave1} -pin_names {FIC3_0x5_APB:PENABLES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave1} -pin_names {FIC3_0x5_APB:PWRITES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave1} -pin_names {FIC3_0x5_APB:PWDATAS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave2} -pin_names {FIC3_0x5_APB:PADDRS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave2} -pin_names {FIC3_0x5_APB:PENABLES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave2} -pin_names {FIC3_0x5_APB:PWRITES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave2} -pin_names {FIC3_0x5_APB:PWDATAS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave3} -pin_names {FIC3_0x5_APB:PADDRS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave3} -pin_names {FIC3_0x5_APB:PENABLES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave3} -pin_names {FIC3_0x5_APB:PWRITES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave3} -pin_names {FIC3_0x5_APB:PWDATAS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave4} -pin_names {FIC3_0x5_APB:PADDRS}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave4} -pin_names {FIC3_0x5_APB:PENABLES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave4} -pin_names {FIC3_0x5_APB:PWRITES}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {FIC3_0x5_APB:APBmslave4} -pin_names {FIC3_0x5_APB:PWDATAS}



# Add FIC_1_INITIATOR instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C1} -instance_name {FIC_1_INITIATOR}



# Add GPIO_USER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {GPIO_USER} -instance_name {GPIO_USER_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:INT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:INT} -pin_slices {[1:1]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_USER_0:INT[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:INT} -pin_slices {[2:2]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_USER_0:INT[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:INT} -pin_slices {[3:3]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_USER_0:INT[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_IN} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_IN} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_USER_0:GPIO_IN[1:1]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_IN} -pin_slices {[2:2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_USER_0:GPIO_IN[2:2]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_IN} -pin_slices {[3:3]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {GPIO_USER_0:GPIO_IN[3:3]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_OUT} -pin_slices {[0:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {GPIO_USER_0:GPIO_OUT[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_OUT} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_OUT} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {GPIO_USER_0:GPIO_OUT} -pin_slices {[3:3]}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add MIV_IHC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_IHC_C0} -instance_name {MIV_IHC_C0_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PADDR}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PSEL}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PENABLE}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PWRITE}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PRDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PWDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {MIV_IHC_C0_0:APB_0_M_INITIATOR} -pin_names {MIV_IHC_C0_0:APB_0_PSLVERR}



# Add NMC_2_MSS_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {NMC2v3_MSS} -instance_name {NMC_2_MSS_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[0:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[0:0]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[10:10]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[10:10]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[11:11]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[11:11]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[12:12]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[12:12]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[13:13]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[13:13]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[14:14]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[14:14]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[15:15]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[15:15]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[16:16]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[16:16]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[17:17]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[17:17]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[18:18]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[18:18]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[19:19]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[19:19]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[20:20]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[20:20]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[21:21]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[21:21]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[22:22]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[22:22]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[23:23]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[23:23]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[24:24]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[24:24]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[25:25]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[25:25]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[26:26]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[26:26]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[27:27]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[27:27]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[28:28]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[28:28]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[29:29]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[29:29]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[30:30]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[30:30]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[31:31]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[31:31]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[32:32]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[32:32]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[33:33]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[33:33]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[34:34]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[34:34]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[35:35]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[35:35]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[36:36]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[36:36]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[37:37]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[37:37]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[38:38]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[38:38]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[39:39]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[39:39]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[40:40]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[40:40]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[41:41]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[41:41]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[42:42]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[42:42]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[43:43]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[43:43]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[44:44]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[44:44]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[45:45]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[45:45]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[46:46]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[46:46]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[47:47]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[47:47]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[48:48]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[48:48]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[49:49]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[49:49]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[50:50]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[50:50]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[51:51]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[51:51]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[52:52]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[52:52]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[53:53]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[53:53]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[54:54]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[54:54]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[55:55]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[55:55]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[56:56]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[56:56]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[57:57]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[57:57]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[58:58]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[58:58]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[59:59]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[60:60]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[61:61]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[62:62]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[63:63]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[6:6]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[6:6]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[7:7]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[7:7]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[8:8]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[8:8]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {NMC_2_MSS_0:MSS_INT_F2M} -pin_slices {[9:9]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:MSS_INT_F2M[9:9]} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NMC_2_MSS_0:FIC_0_ACLK} -value {GND}



# Add PCIE_INITIATOR instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C2} -instance_name {PCIE_INITIATOR}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_CLK_DIV_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CLK_DIV_C0} -instance_name {PF_CLK_DIV_C0_0}



# Add PF_NGMUX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_NGMUX_C0} -instance_name {PF_NGMUX_C0_0}



# Add PF_OSC_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_C1} -instance_name {PF_OSC_C1_0}



# Add PF_PCIE_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_PCIE_C0} -instance_name {PF_PCIE_C0_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PADDR}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PSEL}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PENABLE}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PWRITE}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PRDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PWDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_PCIE_C0_0:PCIE_APB_SLAVE} -pin_names {PF_PCIE_C0_0:APB_S_PSLVERR}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_0_M_RDERR} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_0_S_WDERR} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_PCIE_C0_0:PCIE_0_INTERRUPT} -value {GND}



# Add PF_TX_PLL_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C0_0}



# Add PF_TX_PLL_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C0_1}



# Add PF_TX_PLL_C0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C0_2}



# Add PF_XCVR_REF_CLK_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_C0_0}



# Add PF_XCVR_REF_CLK_C0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_C0_1}



# Add PF_XCVR_REF_CLK_C0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_REF_CLK_C0} -instance_name {PF_XCVR_REF_CLK_C0_2}



# Add PFSOC_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PFSOC_INIT_MONITOR_C0} -instance_name {PFSOC_INIT_MONITOR_C0_0}



# Add PulseGenerator_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {PulseGenerator} -hdl_file {hdl\Counterx64VHD.vhd} -instance_name {PulseGenerator_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PulseGenerator_0:pulse_out}



# Add PulseGenerator_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {PulseGenerator} -hdl_file {hdl\Counterx64VHD.vhd} -instance_name {PulseGenerator_1}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PulseGenerator_1:pulse_out}



# Add RESET_FIC3_CLK_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RESET_FIC3_CLK} -instance_name {RESET_FIC3_CLK_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC3_CLK_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC3_CLK_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC3_CLK_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {RESET_FIC3_CLK_0:FF_US_RESTORE} -value {GND}



# Add UART_FPGA_422_1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_FPGA_422_1} -instance_name {UART_FPGA_422_1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_1_0:CTSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_1_0:DCDN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_1_0:DSRN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_1_0:RIN} -value {VCC}



# Add UART_FPGA_422_2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_FPGA_422_2} -instance_name {UART_FPGA_422_2_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_2_0:CTSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_2_0:DCDN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_2_0:DSRN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_FPGA_422_2_0:RIN} -value {VCC}



# Add UART_J1_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {UART_J1_0} -instance_name {UART_J1_0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_J1_0_0:CTSN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_J1_0_0:DCDN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_J1_0_0:DSRN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {UART_J1_0_0:RIN} -value {VCC}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACT_N" "NMC_2_MSS_0:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_penable" "PF_PCIE_C0_0:APB_S_PENABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_pready" "PF_PCIE_C0_0:APB_S_PREADY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_psel" "PF_PCIE_C0_0:APB_S_PSEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_pslverr" "PF_PCIE_C0_0:APB_S_PSLVERR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_pwrite" "PF_PCIE_C0_0:APB_S_PWRITE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BG0" "NMC_2_MSS_0:BG0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_RXBUS_F2M" "NMC_2_MSS_0:CAN_0_RXBUS_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TXBUS_M2F" "NMC_2_MSS_0:CAN_0_TXBUS_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_0_TX_EBL_M2F" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_RXBUS" "NMC_2_MSS_0:CAN_1_RXBUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TXBUS" "NMC_2_MSS_0:CAN_1_TXBUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAN_1_TX_EBL_N" "NMC_2_MSS_0:CAN_1_TX_EBL_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAS_N" "NMC_2_MSS_0:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0" "NMC_2_MSS_0:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK0_N" "NMC_2_MSS_0:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE0" "NMC_2_MSS_0:CKE0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:A" "FPGA_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:Y" "PF_CCC_C0_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:CLK" "FIC_1_INITIATOR:ACLK" "NMC_2_MSS_0:FIC_1_ACLK" "PCIE_INITIATOR:ACLK" "PF_CCC_C0_0:OUT0_FABCLK_0" "PF_PCIE_C0_0:AXI_CLK" "PulseGenerator_0:clk" "PulseGenerator_1:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:EXT_RST_N" "NMC_2_MSS_0:MSS_RESET_N_M2F" "RESET_FIC3_CLK_0:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "FIC_1_INITIATOR:ARESETN" "PCIE_INITIATOR:ARESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "NMC_2_MSS_0:MSS_RESET_N_F2M" "PFSOC_INIT_MONITOR_C0_0:FABRIC_POR_N" "PulseGenerator_0:reset" "PulseGenerator_1:reset" "RESET_FIC3_CLK_0:FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "PFSOC_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" "RESET_FIC3_CLK_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_LOCK" "PF_CCC_C0_0:PLL_LOCK_0" "PF_PCIE_C0_0:AXI_CLK_STABLE" "RESET_FIC3_CLK_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE0_CDR_REF_CLK_0" "CORESMARTBERT_C0_1:LANE1_CDR_REF_CLK_0" "CORESMARTBERT_C0_1:LANE2_CDR_REF_CLK_0" "CORESMARTBERT_C0_1:LANE3_CDR_REF_CLK_0" "PF_TX_PLL_C0_1:REF_CLK" "PF_XCVR_REF_CLK_C0_1:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE0_RXD_N" "SERDES_XCVR_1_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE0_RXD_P" "SERDES_XCVR_1_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE0_TXD_N" "SERDES_XCVR_1_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE0_TXD_P" "SERDES_XCVR_1_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE1_RXD_N" "SERDES_XCVR_1_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE1_RXD_P" "SERDES_XCVR_1_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE1_TXD_N" "SERDES_XCVR_1_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE1_TXD_P" "SERDES_XCVR_1_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE2_RXD_N" "SERDES_XCVR_1_RX2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE2_RXD_P" "SERDES_XCVR_1_RX2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE2_TXD_N" "SERDES_XCVR_1_TX2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE2_TXD_P" "SERDES_XCVR_1_TX2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE3_RXD_N" "SERDES_XCVR_1_RX3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE3_RXD_P" "SERDES_XCVR_1_RX3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE3_TXD_N" "SERDES_XCVR_1_TX3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:LANE3_TXD_P" "SERDES_XCVR_1_TX3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:SYS_RESET_N" "CORESMARTBERT_C0_2:SYS_RESET_N" "PFSOC_INIT_MONITOR_C0_0:XCVR_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE0_CDR_REF_CLK_0" "CORESMARTBERT_C0_2:LANE1_CDR_REF_CLK_0" "CORESMARTBERT_C0_2:LANE2_CDR_REF_CLK_0" "CORESMARTBERT_C0_2:LANE3_CDR_REF_CLK_0" "PF_TX_PLL_C0_2:REF_CLK" "PF_XCVR_REF_CLK_C0_2:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE0_RXD_N" "SERDES_XCVR_2_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE0_RXD_P" "SERDES_XCVR_2_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE0_TXD_N" "SERDES_XCVR_2_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE0_TXD_P" "SERDES_XCVR_2_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE1_RXD_N" "SERDES_XCVR_2_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE1_RXD_P" "SERDES_XCVR_2_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE1_TXD_N" "SERDES_XCVR_2_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE1_TXD_P" "SERDES_XCVR_2_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE2_RXD_N" "SERDES_XCVR_2_RX2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE2_RXD_P" "SERDES_XCVR_2_RX2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE2_TXD_N" "SERDES_XCVR_2_TX2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE2_TXD_P" "SERDES_XCVR_2_TX2_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE3_RXD_N" "SERDES_XCVR_2_RX3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE3_RXD_P" "SERDES_XCVR_2_RX3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE3_TXD_N" "SERDES_XCVR_2_TX3_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:LANE3_TXD_P" "SERDES_XCVR_2_TX3_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS0_N" "NMC_2_MSS_0:CS0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_CLK" "NMC_2_MSS_0:EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_CMD" "NMC_2_MSS_0:EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA0" "NMC_2_MSS_0:EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA1" "NMC_2_MSS_0:EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA2" "NMC_2_MSS_0:EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_DATA3" "NMC_2_MSS_0:EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_RSTN" "NMC_2_MSS_0:EMMC_RSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_STRB" "NMC_2_MSS_0:EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PENABLES" "MIV_IHC_C0_0:APB_0_PENABLE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PREADYS0" "MIV_IHC_C0_0:APB_0_PREADY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PSELS0" "MIV_IHC_C0_0:APB_0_PSEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PSLVERRS0" "MIV_IHC_C0_0:APB_0_PSLVERR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PWRITES" "MIV_IHC_C0_0:APB_0_PWRITE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_422_1_RX" "UART_FPGA_422_1_0:SIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_422_1_TX" "UART_FPGA_422_1_0:SOUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_422_2_RX" "UART_FPGA_422_2_0:SIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_422_2_TX" "UART_FPGA_422_2_0:SOUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_0_11_IN" "NMC_2_MSS_0:GPIO_0_11_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_0_12_IN" "NMC_2_MSS_0:GPIO_0_12_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_0_13_IN" "NMC_2_MSS_0:GPIO_0_13_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_0_8_IN" "NMC_2_MSS_0:GPIO_0_8_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_1_0_IN" "NMC_2_MSS_0:GPIO_1_0_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:GPIO_IN[0:0]" "SW2_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:GPIO_OUT[1:1]" "LED_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:GPIO_OUT[2:2]" "LED_G" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:GPIO_OUT[3:3]" "LED_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:INT[0:0]" "NMC_2_MSS_0:MSS_INT_F2M[5:5]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:PCLK" "MIV_IHC_C0_0:APB_0_PCLK" "MIV_IHC_C0_0:CORE_CLK" "NMC_2_MSS_0:FIC_3_PCLK" "PF_CCC_C0_0:OUT3_FABCLK_0" "PF_PCIE_C0_0:APB_S_PCLK" "RESET_FIC3_CLK_0:CLK" "UART_FPGA_422_1_0:PCLK" "UART_FPGA_422_2_0:PCLK" "UART_J1_0_0:PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"GPIO_USER_0:PRESETN" "MIV_IHC_C0_0:APB_0_PRESETn" "MIV_IHC_C0_0:CORE_RESETN" "PF_PCIE_C0_0:APB_S_PRESET_N" "RESET_FIC3_CLK_0:FABRIC_RESET_N" "UART_FPGA_422_1_0:PRESETN" "UART_FPGA_422_2_0:PRESETN" "UART_J1_0_0:PRESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SCL" "NMC_2_MSS_0:I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_1_SDA" "NMC_2_MSS_0:I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INV_0:A" "NMC_2_MSS_0:CAN_0_TX_EBL_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"J1_UART_RX" "UART_J1_0_0:SIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"J1_UART_TX" "UART_J1_0_0:SOUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "PF_PCIE_C0_0:PCIESS_LANE_RXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "PF_PCIE_C0_0:PCIESS_LANE_RXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "PF_PCIE_C0_0:PCIESS_LANE_TXD0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "PF_PCIE_C0_0:PCIESS_LANE_TXD0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_N" "PF_PCIE_C0_0:PCIESS_LANE_RXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_RXD_P" "PF_PCIE_C0_0:PCIESS_LANE_RXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_N" "PF_PCIE_C0_0:PCIESS_LANE_TXD1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE1_TXD_P" "PF_PCIE_C0_0:PCIESS_LANE_TXD1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_0_MDC" "NMC_2_MSS_0:MAC_0_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MAC_0_MDIO" "NMC_2_MSS_0:MAC_0_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_IHC_C0_0:APP_IRQ_H0" "NMC_2_MSS_0:MSS_INT_F2M[63:63]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_IHC_C0_0:APP_IRQ_H1" "NMC_2_MSS_0:MSS_INT_F2M[62:62]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_IHC_C0_0:APP_IRQ_H2" "NMC_2_MSS_0:MSS_INT_F2M[61:61]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_IHC_C0_0:APP_IRQ_H3" "NMC_2_MSS_0:MSS_INT_F2M[60:60]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_IHC_C0_0:APP_IRQ_H4" "NMC_2_MSS_0:MSS_INT_F2M[59:59]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_RXD" "NMC_2_MSS_0:MMUART_0_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_0_TXD" "NMC_2_MSS_0:MMUART_0_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_RXD" "NMC_2_MSS_0:MMUART_1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_1_TXD" "NMC_2_MSS_0:MMUART_1_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_RXD" "NMC_2_MSS_0:MMUART_2_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_2_TXD" "NMC_2_MSS_0:MMUART_2_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_4_RXD" "NMC_2_MSS_0:MMUART_4_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MMUART_4_TXD" "NMC_2_MSS_0:MMUART_4_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:GPIO_2_M2F_0" "VSC_NRESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:GPIO_2_M2F_1" "VSC_SNRESET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:MSS_INT_F2M[1:1]" "PF_PCIE_C0_0:PCIE_0_INTERRUPT_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:MSS_INT_F2M[2:2]" "UART_FPGA_422_1_0:INTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:MSS_INT_F2M[3:3]" "UART_FPGA_422_2_0:INTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:MSS_INT_F2M[4:4]" "UART_J1_0_0:INTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:ODT0" "ODT0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:PLL_CPU_LOCK_M2F" "PLL_CPU_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:PLL_DDR_LOCK_M2F" "PLL_DDR_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:QSPI_CLK" "QSPI_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:QSPI_DATA0" "QSPI_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:QSPI_DATA1" "QSPI_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:QSPI_DATA2" "QSPI_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:QSPI_DATA3" "QSPI_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:QSPI_SS0" "QSPI_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:RAS_N" "RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:REFCLK" "REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:REFCLK_N" "REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:RESET_N" "RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_RX0_N" "SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_RX0_P" "SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_RX1_N" "SGMII_RX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_RX1_P" "SGMII_RX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_TX0_N" "SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_TX0_P" "SGMII_TX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_TX1_N" "SGMII_TX1_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SGMII_TX1_P" "SGMII_TX1_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SPI_0_CLK" "SPI_0_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SPI_0_DI" "SPI_0_DI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SPI_0_DO" "SPI_0_DO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:SPI_0_SS0" "SPI_0_SS0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:WE_N" "WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_0_PERST_OUT_N" "PF_PCIE_C0_0:PCIE_0_PERST_OUT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PFSOC_INIT_MONITOR_C0_0:PCIE_INIT_DONE" "PF_NGMUX_C0_0:SEL" "PF_PCIE_C0_0:INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:OUT2_FABCLK_0" "SSD_XIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:PLL_POWERDOWN_N_0" "RESET_FIC3_CLK_0:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CLK_DIV_C0_0:CLK_IN" "PF_OSC_C1_0:RCOSC_160MHZ_GL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CLK_DIV_C0_0:CLK_OUT" "PF_NGMUX_C0_0:CLK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_NGMUX_C0_0:CLK1" "PF_TX_PLL_C0_0:CLK_125" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_NGMUX_C0_0:CLK_OUT" "PF_PCIE_C0_0:PCIE_0_TL_CLK_125MHz" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:PCIESS_LANE0_CDR_REF_CLK_0" "PF_PCIE_C0_0:PCIESS_LANE1_CDR_REF_CLK_0" "PF_TX_PLL_C0_0:REF_CLK" "PF_XCVR_REF_CLK_C0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_N" "REF_CLK_PAD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_0:REF_CLK_PAD_P" "REF_CLK_PAD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_1:REF_CLK_PAD_N" "REF_CLK_PAD_N_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_1:REF_CLK_PAD_P" "REF_CLK_PAD_P_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_2:REF_CLK_PAD_N" "REF_CLK_PAD_N_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_XCVR_REF_CLK_C0_2:REF_CLK_PAD_P" "REF_CLK_PAD_P_2" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"A" "NMC_2_MSS_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_paddr[25:0]" "PF_PCIE_C0_0:APB_S_PADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_prdata" "PF_PCIE_C0_0:APB_S_PRDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:out_low_pwdata" "PF_PCIE_C0_0:APB_S_PWDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BA" "NMC_2_MSS_0:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "NMC_2_MSS_0:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "NMC_2_MSS_0:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "NMC_2_MSS_0:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PADDRS" "MIV_IHC_C0_0:APB_0_PADDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PRDATAS0" "MIV_IHC_C0_0:APB_0_PRDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:PWDATAS" "MIV_IHC_C0_0:APB_0_PWDATA" }

# Add bus interface net connections
sd_create_bif_net -sd_name ${sd_name} -net_name {FIC_3_0x5xxx_xxxx}
sd_connect_net_to_pins -sd_name ${sd_name} -net_name {FIC_3_0x5xxx_xxxx} -pin_names {"APB_ARBITER_0:APB_MASTER_high" "FIC3_0x5_APB:APB3mmaster" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MMASTER" "NMC_2_MSS_0:FIC_3_APB_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_1:CLKS_FROM_TXPLL_0" "PF_TX_PLL_C0_1:CLKS_TO_XCVR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESMARTBERT_C0_2:CLKS_FROM_TXPLL_0" "PF_TX_PLL_C0_2:CLKS_TO_XCVR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:APBmslave1" "UART_FPGA_422_1_0:APBtarget" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:APBmslave2" "UART_FPGA_422_2_0:APBtarget" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:APBmslave3" "UART_J1_0_0:APBtarget" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_0x5_APB:APBmslave4" "GPIO_USER_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_INITIATOR:AXI4mmaster0" "NMC_2_MSS_0:FIC_1_AXI4_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_1_INITIATOR:AXI4mslave0" "PF_PCIE_C0_0:AXI_0_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NMC_2_MSS_0:FIC_1_AXI4_TARGET" "PCIE_INITIATOR:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_INITIATOR:AXI4mmaster0" "PF_PCIE_C0_0:AXI_0_MASTER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_PCIE_C0_0:CLKS_FROM_TXPLL_TO_PCIE_0" "PF_TX_PLL_C0_0:CLKS_TO_XCVR" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "NMC"
generate_component -component_name ${sd_name}
