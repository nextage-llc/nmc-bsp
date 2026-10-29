#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source hdl_source.tcl
build_design_hierarchy

#Sourcing the Tcl files in which HDL+ core definitions are created for HDL modules
source components/APB_ARBITER.tcl 
build_design_hierarchy

#Sourcing the Tcl files for creating individual components under the top level
source components/COREAXI4INTERCONNECT_C1.tcl 
source components/COREAXI4INTERCONNECT_C2.tcl 
source components/CORERESET_PF_C0.tcl 
source components/CORESMARTBERT_C0.tcl 
source components/CORESMARTBERT_C0_1.tcl 
source components/CoreAPB3_C2.tcl 
source components/GPIO_USER.tcl 
source components/MIV_IHC_C0.tcl 
source components/PFSOC_INIT_MONITOR_C0.tcl 
source components/PF_CCC_C0.tcl 
source components/PF_CLK_DIV_C0.tcl 
source components/PF_NGMUX_C0.tcl 
source components/PF_OSC_C1.tcl 
source components/PF_PCIE_C0.tcl 
source components/PF_TX_PLL_C0.tcl 
source components/PF_XCVR_REF_CLK_C0.tcl 
source components/RESET_FIC3_CLK.tcl 
source components/UART_FPGA_422_1.tcl 
source components/UART_FPGA_422_2.tcl 
source components/UART_J1_0.tcl 
source components/NMC.tcl 
build_design_hierarchy
