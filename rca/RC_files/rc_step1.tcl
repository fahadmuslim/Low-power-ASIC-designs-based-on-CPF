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
####################################################################
#Switching Info
####################################################################
#read_tcf -scale 0.00224 -instance [find / -inst mult] -verbose ../work_rtl_sim/rca_90.tcf
#read_tcf -instance [find / -inst msb_rca] -verbose ../work_rtl_sim/rca_90.tcf
read_tcf -verbose ../work_rtl_sim/rca_90.tcf
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
write_tcf -computed > rc_toggle.tcf
exit
