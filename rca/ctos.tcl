close_design
new_design RCA_32b
set_attr design_dir "post_build" [get_design]
set_attr auto_write_models "true" [get_design]
define_sim_config -model_dir "./model" [get_design]
set_attr source_files [list src/RCA_32b.cc] [get_design]
set_attr compile_flags " -w -I src -DCTOS -D__CTOS__ -D_CTOS_" [get_design]
set_attr top_module_path "RCA_32b" [get_design]
define_clock -name clk -period 1000 -rise 0 -fall 500
set_attr default_scheduling_effort low [get_design]
set_attr tech_lib_names "/tools/techlibs/nangate/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/Liberty/ECSM/NangateOpenCellLibrary_slow_ecsm.lib" [get_design]
set_attr reset_registers internal [get_design]
#set_attr systemc_out_source_ext "cc" [get_design]
set_attr auto_save_dir RCA_32b_incremental [get_design]
build
read_ip_defs -ip_def /home/affaq/Low_Power/designs/idct/CTOS_CGCG/systemc/cg_cell/cgic_def.xml [get_design]
set ipdef [find -cgic_ip_def CLKGATE_X1]
use_ip $ipdef [find -module ctos_clock_gate_module]
if 0{
}
return;


