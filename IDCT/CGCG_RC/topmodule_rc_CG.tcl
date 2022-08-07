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

set _OUTPUTS_PATH outputs_My_Files_CG
set _REPORTS_PATH reports_My_Files_CG 
set_attr source_verbose true /


set_attribute lp_power_analysis_effort high /
#set_attribute hdl_track_filename_row_col true /
set_attribute information_level 7 /


set_attribute library {cg_cell/NangateOpenCellLibrary_slow_ecsm.lib}

read_hdl -v2001 RTL_CG/topmodule_rtl.v
#suspend

###########################
## Enabling Clock Gating ##
###########################
set_attribute lp_insert_clock_gating true /

elaborate $DESIGN
#uniquify /designs/topmodule_rtl
puts "Runtime & Memory after 'read_hdl'"
timestat Elaboration
#suspend
check_design -unresolved
#suspend

##############################
## Define Clock Gating cell ##
##############################
set_attribute lp_clock_gating_cell [find / -libcell CLKGATE_X1]  /designs/topmodule_rtl

####################################################################
## Constraints Setup
####################################################################
read_sdc idct.sdc
##read_tcf -instance [find / -inst XLXI_3] -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/top_CGnew.tcf

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
#suspend

read_tcf -verbose /home/muslim/Desktop/prof_method/CGCG_RC/constraints/mmmc/my3.tcf

##Intermediate netlist for LEC verification..
###########Revised design for LEC###################
write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_CG_intermediate.v

report timing >  $_REPORTS_PATH/${DESIGN}_CGtiming_inter.txt
report gates >   $_REPORTS_PATH/${DESIGN}_CGgates_inter.txt
report area >    $_REPORTS_PATH/${DESIGN}_CGarea_inter.txt

#######################################################################################################
## Incremental Synthesis
#######################################################################################################

#synthesize -to_mapped -eff $MAP_EFF -incr  
#puts "Runtime & Memory after incremental synthesis"
#timestat INCREMENTAL

###########Revised design after incremental opt for LEC#####################
#write_hdl -lec > ${_OUTPUTS_PATH}/${DESIGN}_CG_incremental.v
###############Revised CPF after incremental opt for LEC####################
#write_cpf -output_directory ${_OUTPUTS_PATH} -prefix incremental

#report timing > $_REPORTS_PATH/${DESIGN}_CGtiming_incr.txt
#report gates >  $_REPORTS_PATH/${DESIGN}_CGgates_incr.txt
#report area >   $_REPORTS_PATH/${DESIGN}_CGarea_incr.txt
report clock_gating > $_REPORTS_PATH/${DESIGN}_CG.clock_gating.txt

puts "Total area [get_attr area /designs/topmodule_rtl]"
timestat FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"
report power > ./Power_Reports/pwrrpt_CG.txt
write_encounter design -basename TEST1_CG/test2_CG

#write_do_lec -no_exit -revised_design ${_OUTPUTS_PATH}/${DESIGN}_CG_incremental.v -logfile mylecrtl2incr_nohier.log > ${_OUTPUTS_PATH}/rtl2incr_nohier.lec.do


#write_do_lec -golden_design ${_OUTPUTS_PATH}/${DESIGN}_CG_intermediate.v -revised_design ${_OUTPUTS_PATH}/${DESIGN}_CG_incremental.v -logfile intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do 
