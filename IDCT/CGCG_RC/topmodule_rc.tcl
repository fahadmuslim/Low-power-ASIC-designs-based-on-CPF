# *****************************************************************************
#                         Cadence C-to-Silicon Compiler
#           Version 13.20-p100  (64 bit), build 48535 Fri, 06 Dec 2013
# 
# File created on Wed Mar 11 18:18:00 2015
# 
# The code contained herein is generated for Cadences customer and third
# parties authorized by customer.  It may be used in accordance with a
# previously executed license agreement between Cadence and that customer.
# Absolutely no disassembling, decompiling, reverse-translations or
# reverse-engineering of the generated code is allowed.
# 
# ******************************************************************************
set DESIGN topmodule_rtl
set SYN_EFF medium
set MAP_EFF medium

set _OUTPUTS_PATH outputs_My_Files_NoCPF
set _REPORTS_PATH reports_My_Files_NoCPF 
set_attr source_verbose true /


set_attribute lp_power_analysis_effort high /
#set_attribute hdl_track_filename_row_col true /
set_attribute information_level 7 /


set_attribute library {cg_cell/NangateOpenCellLibrary_slow_ecsm.lib}
#set_attribute operating_conditions _nominal_ /

read_hdl -v2001 RTL/topmodule_rtl.v
#suspend

elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
timestat Elaboration
#suspend
check_design -unresolved
#suspend

####################################################################
## Constraints Setup
####################################################################
read_sdc idct.sdc
#read_tcf /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/top_NoCG_hier.tcf
#read_tcf -instance [find / -inst XLXI_1] /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/XLXI_1_NoCG.tcf
#read_tcf -instance [find / -inst XLXI_2] /home/muslim/desktop/prof_method/cgcg_rc/constraints/mmmc/xlxi_2_nocg.tcf
#read_tcf -scale 1.5 -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/my.tcf
###########read_tcf -instance [find / -inst XLXI_3] -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/top_NoCGnew.tcf
#read_tcf -update /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/XLXI_2_NoCG.tcf
#read_tcf -update /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/XLXI_3_NoCG.tcf
#suspend
if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}

####################################################################################################
## Synthesizing to generic 
####################################################################################################
#synthesize -to_generic -eff $SYN_EFF
#puts "Runtime & Memory after 'synthesize -to_generic'"
#timestat GENERIC
#report datapath >  $_REPORTS_PATH/${DESIGN}_datapath_generic.txt
####################################################################################################
## Synthesizing to gates
####################################################################################################
#synthesize -to_mapped -eff $MAP_EFF -no_incr
synthesize -to_mapped -eff $MAP_EFF
puts "Runtime & Memory after 'synthesize -to_map -no_incr'"
timestat MAPPED
read_tcf -scale 1.5 -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/my2.tcf
#suspend

##Intermediate netlist for LEC verification..
###########Revised design for LEC###################
write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_nocpf_intermediate.v

report timing >  $_REPORTS_PATH/${DESIGN}_timing_inter.txt
report gates >   $_REPORTS_PATH/${DESIGN}_gates_inter.txt
report area >    $_REPORTS_PATH/${DESIGN}_area_inter.txt

#######################################################################################################
## Incremental Synthesis
#######################################################################################################

#synthesize -to_mapped -eff $MAP_EFF -incr  
#puts "Runtime & Memory after incremental synthesis"
#timestat INCREMENTAL
#read_tcf -scale 1.5 -verbose /home/fahad1/Desktop/Low_Pwr_Alldesigns/prof_method/CGCG_RC/#constraints/mmmc/my2.tcf
###########Revised design after incremental opt for LEC#####################
#write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_nocpf_incremental.v
###############Revised CPF after incremental opt for LEC####################
#write_cpf -output_directory ${_OUTPUTS_PATH} -prefix incremental

#report timing > $_REPORTS_PATH/${DESIGN}_timing_incr.txt
#report gates >  $_REPORTS_PATH/${DESIGN}_gates_incr.txt
#report area >   $_REPORTS_PATH/${DESIGN}_area_incr.txt

puts "Total area [get_attr area /designs/topmodule_rtl]"
#timestat FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
report power > ./Power_Reports/pwrrpt_NoCPF.txt
write_encounter design -basename TEST1_nocpf/test2_nocpf

