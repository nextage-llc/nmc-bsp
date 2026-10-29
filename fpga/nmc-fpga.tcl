# NMC2v3 FPGA reference design: recreates the Libero SoC project from the files in script_support/
# and mss/, the same way Microchip's PolarFire SoC reference designs are generated.
#
# Libero SoC 2025.2. Run from this folder:
#   Libero: Project -> Execute Script (Ctrl+U), select nmc-fpga.tcl, Arguments as below
#   Command line: libero SCRIPT:nmc-fpga.tcl "SCRIPT_ARGS:EXPORT_FPE"
#
# The script creates the project, runs the design flow (synthesis, place and route, programming
# data) and adds the HSS to the eNVM, so the project matches nmc-fpga.job. This takes a while.
#
# Arguments (optional, space-separated):
#   EXPORT_FPE            also export nmc-fpga.job to this folder
#   EXPORT_FPE:<dir>      same, export to <dir>
#   DESIGN_VERSION:<n>    design version in the bitstream (default 300, shown by the HSS as DESIGNVER)
#   HSS_HEX:<file>        HSS eNVM image (default script_support/nmc-hss.hex)
#
# The project is created in ./NMC2v3. Delete that folder to generate it again.

puts "TCL_BEGIN: [info script]"

set script_dir [file dirname [file normalize [info script]]]
set local_dir [pwd]
set support_dir "$script_dir/script_support"
set project_name "NMC2v3"
set project_dir "$local_dir/$project_name"

# Windows limits path lengths; Libero creates deep folders inside the project
if {[lindex $::tcl_platform(os) 0] == "Windows" && [string length $local_dir] >= 90} {
    error "Path to this folder is too long ([string length $local_dir] characters), move it closer to the drive root and try again."
}

if {$::argc > 0} {
    foreach arg $::argv {
        if {[string match "*:*" $arg]} {
            set var [string range $arg 0 [string first ":" $arg]-1]
            set val [string range $arg [string first ":" $arg]+1 end]
            set $var $val
        } else {
            set $arg 1
        }
        puts "Argument: $arg"
    }
}

set design_version [expr {[info exists DESIGN_VERSION] ? $DESIGN_VERSION : 300}]
set hss_hex [file normalize [expr {[info exists HSS_HEX] ? $HSS_HEX : "$support_dir/nmc-hss.hex"}]]
if {![file exists $hss_hex]} {
    error "HSS image not found: $hss_hex"
}

if {[file exists "$project_dir/$project_name.prjx"]} {
    error "$project_dir already exists. Open $project_name.prjx in Libero, or delete the folder to generate it again."
}

new_project \
    -location $project_dir \
    -name $project_name \
    -project_description {NMC2v3 FPGA reference design} \
    -block_mode 0 \
    -standalone_peripheral_initialization 0 \
    -instantiate_in_smartdesign 1 \
    -ondemand_build_dh 1 \
    -use_relative_path 0 \
    -linked_files_root_dir_env {} \
    -hdl {VERILOG} \
    -family {PolarFireSoC} \
    -die {MPFS250T} \
    -package {FCG1152} \
    -speed {-1} \
    -die_voltage {1.05} \
    -part_range {EXT} \
    -adv_options {IO_DEFT_STD:LVCMOS 3.3V} \
    -adv_options {RESTRICTPROBEPINS:0} \
    -adv_options {RESTRICTSPIPINS:0} \
    -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} \
    -adv_options {TEMPR:EXT} \
    -adv_options {VCCI_1.2_VOLTR:EXT} \
    -adv_options {VCCI_1.5_VOLTR:EXT} \
    -adv_options {VCCI_1.8_VOLTR:EXT} \
    -adv_options {VCCI_2.5_VOLTR:EXT} \
    -adv_options {VCCI_3.3_VOLTR:EXT} \
    -adv_options {VOLTR:EXT}

# MSS: the MSS Configurator output in mss/ (see README "Change the MSS configuration")
import_mss_component -file "$script_dir/mss/NMC2v3_MSS.cxz"

# HDL, IP cores and SmartDesigns, bottom-up (exported from Libero with Export Component Description (Tcl))
cd $support_dir
source NMC_recursive.tcl
cd $local_dir
set_root -module {NMC::work}

# Pin assignments; timing constraints are derived from the IP cores
import_files -convert_EDN_to_HDL 0 -io_pdc "$support_dir/constraints/NMC.pdc"
build_design_hierarchy
derive_constraints_sdc
organize_tool_files -tool {SYNTHESIZE} \
    -file "$project_dir/constraint/NMC_derived_constraints.sdc" \
    -module {NMC::work} -input_type {constraint}
organize_tool_files -tool {PLACEROUTE} \
    -file "$project_dir/constraint/io/NMC.pdc" \
    -file "$project_dir/constraint/NMC_derived_constraints.sdc" \
    -module {NMC::work} -input_type {constraint}
organize_tool_files -tool {VERIFYTIMING} \
    -file "$project_dir/constraint/NMC_derived_constraints.sdc" \
    -module {NMC::work} -input_type {constraint}

configure_tool -name {CONFIGURE_PROG_OPTIONS} \
    -params {back_level_version:0} \
    -params design_version:$design_version \
    -params {silicon_signature:}

save_project

# Design flow; the eNVM can only be configured once programming data exists
run_tool -name {GENERATEPROGRAMMINGDATA}

# eNVM: the HSS bootloader
set envm_cfg "$project_dir/ENVM.cfg"
set fd [open $envm_cfg w]
puts $fd "set_plain_text_client \\
   -client_name {BOOT_MODE_1_ENVM_CLIENT} \\
   -number_of_bytes 85712 \\
   -content_type {MEMORY_FILE} \\
   -content_file_format {Intel-Hex} \\
   -content_file {$hss_hex} \\
   -mem_file_base_address {0x20220000} \\
   -start_page 0 \\
   -use_for_simulation 0 \\
   -reprogram 1 \\
   -use_as_rom 0 \\
   -include_in_digest 0 \\
   -fabric_access_read 1 \\
   -fabric_access_write 0 \\
   -mss_access_read 1 \\
   -mss_access_write 0"
close $fd
configure_envm -cfg_file $envm_cfg
run_tool -name {GENERATEPROGRAMMINGDATA}
save_project

if {[info exists EXPORT_FPE]} {
    set job_dir $local_dir
    if {[file isdirectory $EXPORT_FPE]} { set job_dir [file normalize $EXPORT_FPE] }
    export_prog_job \
        -job_file_name {NMC} \
        -export_dir $job_dir \
        -bitstream_file_type {TRUSTED_FACILITY} \
        -bitstream_file_components {FABRIC_SNVM ENVM} \
        -zeroization_likenew_action 0 \
        -zeroization_unrecoverable_action 0 \
        -program_design 1 \
        -program_spi_flash 0 \
        -include_plaintext_passkey 0 \
        -design_bitstream_format {PPD} \
        -prog_optional_procedures {} \
        -skip_recommended_procedures {} \
        -sanitize_snvm 0 \
        -sanitize_envm 0
    file rename -force "$job_dir/NMC.job" "$job_dir/nmc-fpga.job"
    puts "Exported $job_dir/nmc-fpga.job"
    save_project
}

puts "TCL_END: [info script]"
