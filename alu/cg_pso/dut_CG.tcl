new_design topmodule

set_attr design_dir "model" /designs/topmodule
set_attr auto_write_models "true" /designs/topmodule
define_sim_config -model_dir "./model" /designs/topmodule
set_attr source_files [list src/topmodule.cc src/xbus_hw_idct.cc] /designs/topmodule
set_attr header_files [list src/fifo_type.h src/my_fifo.h src/powercontrol.h src/topmodule.h src/xbus_hw_idct.h] /designs/topmodule
set_attr compile_flags " -w" /designs/topmodule
set_attr top_module_path "topmodule" /designs/topmodule
define_clock -name clk -period 28000 -rise 0 -fall 14000
set_attr default_scheduling_effort low [get_design]
set_attr tech_lib_names "cg_cell/NangateOpenCellLibrary_slow_ecsm.lib" [get_design]
set_attr reset_registers internal [get_design]
#set_attr low_power_clock_gating true [get_design]
set_attr systemc_out_source_ext "cc" /designs/topmodule
set_attr auto_save_dir topmodule_incremental /designs/topmodule
build

write_sim -type verilog -suffix _post_build -birthday -dir ./model /designs/topmodule/modules/topmodule
write_wrapper -o ./model/topmodule_ctos_wrapper.h /designs/topmodule/modules/topmodule

read_ip_defs -ip_def cg_cell/cgic_def.xml [get_design]
set ipdef [find -cgic_ip_def CLKGATE_X1]
use_ip $ipdef [find -module ctos_clock_gate_module]

inline /designs/topmodule/modules/my_fifo/behaviors/reset_put /designs/topmodule/modules/my_fifo/behaviors/reset_get /designs/topmodule/modules/my_fifo/behaviors/put /designs/topmodule/modules/xbus_hw_idct/behaviors/jpeg_idct_islow /designs/topmodule/modules/my_fifo/behaviors/get /designs/topmodule/modules/my_fifo/behaviors/_incr_w /designs/topmodule/modules/my_fifo/behaviors/_incr_r

break_combinational_loop /designs/topmodule/modules/xbus_hw_idct/behaviors/xbus_hw_idct_run/nodes/Pass1_for_begin

break_combinational_loop /designs/topmodule/modules/xbus_hw_idct/behaviors/xbus_hw_idct_run/nodes/Pass2_for_begin

allocate_builtin_ram /designs/topmodule/modules/xbus_hw_idct/arrays/output_buf

allocate_builtin_ram /designs/topmodule/modules/xbus_hw_idct/arrays/coef_block

allocate_builtin_ram /designs/topmodule/modules/xbus_hw_idct/arrays/workspace

allocate_builtin_ram /designs/topmodule/modules/my_fifo/arrays/local_m_buf_data

allocate_builtin_ram /designs/topmodule/modules/my_fifo/arrays/local_m_buf_addr

constrain_latency -max 16 /designs/topmodule/modules/xbus_hw_idct/behaviors/xbus_hw_idct_run/nodes/Pass1_for_begin /designs/topmodule/modules/xbus_hw_idct/behaviors/xbus_hw_idct_run/nodes/Pass1_for_exit

constrain_latency -max 16 /designs/topmodule/modules/xbus_hw_idct/behaviors/xbus_hw_idct_run/nodes/Pass2_for_begin /designs/topmodule/modules/xbus_hw_idct/behaviors/xbus_hw_idct_run/nodes/Pass2_for_exit

schedule -passes 200 -post_optimize none /designs/topmodule

allocate_registers /designs/topmodule

write_sim -type verilog -suffix _final -dir ./model /designs/topmodule/modules/topmodule

write_rtl -tcf -file ./model/topmodule_rtl.v /designs/topmodule/modules/topmodule
write_rc_script -o topmodule_rc.tcl /designs/topmodule/modules/topmodule

#write_rtl -tcf -dir ./model1 /designs/topmodule/modules/topmodule
#write_rc_script
