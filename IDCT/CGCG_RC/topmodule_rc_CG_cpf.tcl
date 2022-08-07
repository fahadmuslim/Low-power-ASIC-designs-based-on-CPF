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

set _OUTPUTS_PATH outputs_My_Files_CGcpf
set _REPORTS_PATH reports_My_Files_CGcpf 
set_attr source_verbose true /


set_attribute lp_power_analysis_effort high /
#set_attribute hdl_track_filename_row_col true /
set_attribute information_level 7 /

read_cpf -library rcCPFmoduleforIDCT.cpf
#suspend 
check_library
#suspend

read_hdl -v2001 RTL_CG/topmodule_rtl.v
#suspend

###########################
## Enabling Clock Gating ##
###########################
set_attribute lp_insert_clock_gating true /

elaborate $DESIGN
uniquify /designs/topmodule_rtl
puts "Runtime & Memory after 'read_hdl'"
timestat Elaboration
#suspend
check_design -unresolved
#suspend

##############################
## Define Clock Gating cell ##
##############################
set_attribute lp_clock_gating_cell [find / -libcell CLKGATE_X1]  /designs/topmodule_rtl

read_cpf rcCPFmoduleforIDCT.cpf
#suspend

####################################################################
#Switching Info
####################################################################
##read_tcf -instance [find / -inst XLXI_3] -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/top_CGnew.tcf


if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}

#check_cpf -license lpgxl   
#suspend

cd /libraries/library_domains/lib_wc/
set_attribute operating_conditions slow 
cd /designs/topmodule_rtl/

set_attribute lp_pso_aware_estimation true /
set_attribute lp_pso_aware_tcf false /designs/topmodule_rtl
####################################################################################################
## Synthesizing to generic (RTL optimization)
####################################################################################################
synthesize -to_generic -eff $SYN_EFF
puts "Runtime & Memory after 'synthesize -to_generic'"
timestat GENERIC
###############################################report datapath >  $_REPORTS_PATH/${DESIGN}_datapath_generic.txt
####################################################################################################
## Synthesizing to gates (Maps the design to cells described in tech library)
####################################################################################################
synthesize -to_mapped -eff $MAP_EFF -no_incr
puts "Runtime & Memory after 'synthesize -to_map -no_incr'"
timestat MAPPED
#suspend

#read_tcf -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/my5.tcf


##Intermediate netlist and CPF for LEC verification..
###########Revised design for LEC###################
write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_intermediate_CGcpf.v
###############Revised CPF for LEC##################
#write_cpf -output_directory ${_OUTPUTS_PATH} -prefix intermediate 

report timing >  $_REPORTS_PATH/${DESIGN}_timing_CGcpf_inter.txt
report gates >   $_REPORTS_PATH/${DESIGN}_gates_CGcpf_inter.txt
report area >    $_REPORTS_PATH/${DESIGN}_area_CGcpf_inter.txt

reload_cpf
commit_cpf -isolation_cell_only
#suspend

#######################################################################################################
##Incremental Synthesis (Incrementally optimizes mapped gates. Allows the mapper to preserve the current 
##impl of the design and perform incremental optimizations if and only if the procedure guarantees an 
##improvement in the overall cost of the design.)
#######################################################################################################

synthesize -to_mapped -eff $MAP_EFF -incr  
puts "Runtime & Memory after incremental synthesis"
timestat INCREMENTAL

read_tcf -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/extra.tcf

##write_encounter design -basename <path & base filename> -lef <lef_file(s)>
verify_power_structure -post_synthesis -license lpgxl> $_REPORTS_PATH/${DESIGN}_CGcpf_verify_power_struct.rpt
#suspend

###########Revised design after incremental opt for LEC#####################
write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_incremental_CGcpf.v
###############Revised CPF after incremental opt for LEC####################
#write_cpf -output_directory ${_OUTPUTS_PATH} -prefix incremental

report timing > $_REPORTS_PATH/${DESIGN}_timing_CGcpf_incr.txt
report gates >  $_REPORTS_PATH/${DESIGN}_gates_CGcpf_incr.txt
report area >   $_REPORTS_PATH/${DESIGN}_area_CGcpf_incr.txt
puts "Total area [get_attr area /designs/topmodule_rtl]"
timestat FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
report power > ./Power_Reports/pwrrpt_CGcpf.txt
report power -mode PM1 > ./Power_Reports/pwrrpt_CGcpf_PM1.txt
report power -mode PM2 > ./Power_Reports/pwrrpt_CGcpf_PM2.txt
write_encounter design -basename TEST1_CGcpf/test2_CGcpf

#write_do_lec -no_exit -revised_design ${_OUTPUTS_PATH}/${DESIGN}_CGcpf_incremental.v -logfile rtl2incr_CGcpf.log > ${_OUTPUTS_PATH}/rtl2incr_CGcpf.lec.do

