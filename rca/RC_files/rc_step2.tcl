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
set DESIGN RCA_32b_rtl
set SYN_EFF medium
set MAP_EFF medium

set _OUTPUTS_PATH output_files_cg_pso
set _REPORTS_PATH report_files_cg_pso 
set_attr source_verbose true /


set_attribute lp_power_analysis_effort high /
set_attribute information_level 7 /

read_cpf -library rca.cpf
check_library
read_hdl -v2001 ../model/RCA_32b_rtl.v

###########################
## Enabling Clock Gating ##
###########################
set_attribute lp_insert_clock_gating true /
elaborate $DESIGN
uniquify /designs/RCA_32b_rtl
puts "Runtime & Memory after 'read_hdl'"
timestat Elaboration
check_design -unresolved
##############################
## Define Clock Gating cell ##
##############################
set_attribute lp_clock_gating_cell [find / -libcell CLKGATE_X1]  /designs/RCA_32b_rtl
read_cpf rca.cpf

if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}

#cd /libraries/library_domains/lib_wc/
#set_attribute operating_conditions slow 
#cd /designs/RCA_32b_rtl/

set_attribute lp_pso_aware_estimation true /
set_attribute lp_pso_aware_tcf false /designs/RCA_32b_rtl
####################################################################################################
## Synthesizing to generic (RTL optimization)
####################################################################################################
synthesize -to_generic -eff $SYN_EFF
puts "Runtime & Memory after 'synthesize -to_generic'"
timestat GENERIC
####################################################################################################
## Synthesizing to gates (Maps the design to cells described in tech library)
####################################################################################################
synthesize -to_mapped -eff $MAP_EFF -no_incr
puts "Runtime & Memory after 'synthesize -to_map -no_incr'"
timestat MAPPED
##Intermediate netlist and CPF for LEC verification..
###########Revised design for LEC###################
write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_intermediate_cg_pso.v
###############Revised CPF for LEC##################
report timing >  $_REPORTS_PATH/${DESIGN}_timing_cg_pso_inter.txt
report gates >   $_REPORTS_PATH/${DESIGN}_gates_cg_pso_inter.txt
report area >    $_REPORTS_PATH/${DESIGN}_area_cg_pso_inter.txt
reload_cpf
commit_cpf -isolation_cell_only
#######################################################################################################
##Incremental Synthesis (Incrementally optimizes mapped gates. Allows the mapper to preserve the current 
##impl of the design and perform incremental optimizations if and only if the procedure guarantees an 
##improvement in the overall cost of the design.)
#######################################################################################################
synthesize -to_mapped -eff $MAP_EFF -incr  
puts "Runtime & Memory after incremental synthesis"
timestat INCREMENTAL
####################################################################################################
## Switching information based on computed values by RTL Compiler 
####################################################################################################
read_tcf -verbose rc_toggle.tcf
#verify_power_structure -post_synthesis -license lpgxl> $_REPORTS_PATH/${DESIGN}_cg_pso_verify_power_struct.rpt
###########Revised design after incremental opt for LEC#####################
write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_incremental_cg_pso.v
report timing > $_REPORTS_PATH/${DESIGN}_timing_cg_pso_incr.txt
report gates >  $_REPORTS_PATH/${DESIGN}_gates_cg_pso_incr.txt
report area >   $_REPORTS_PATH/${DESIGN}_area_cg_pso_incr.txt
puts "Total area [get_attr area /designs/RCA_32b_rtl]"
timestat FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
report power > ./Power_Reports/pwrrpt_cg_pso.txt
report power -mode PM1 > ./Power_Reports/pwrrpt_cg_pso_PM1.txt
report power -mode PM2 > ./Power_Reports/pwrrpt_cg_pso_PM2.txt
#report power -mode PM3 > ./Power_Reports/pwrrpt_cg_pso_PM3.txt
#report power -mode PM4 > ./Power_Reports/pwrrpt_cg_pso_PM4.txt
exit
