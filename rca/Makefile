# ******* Do not edit this CtoS generated Makefile ******* 
# *****************************************************************************
#                         Cadence C-to-Silicon Compiler
#       Version 12.10-d001 Internal (32 bit), build 39626 Thu, 01 Mar 2012
# 
# Copyright notice: Copyright 2006-2011 Cadence Design Systems, Inc. All
# rights reserved worldwide.
# 
# Patent notice: Protected by U.S. Patents 7472361, 7587687, 7673259, 7711536;
# other U.S. patents pending.
# ******************************************************************************
# This makefile runs simulations from the CtoS GUI or as a stand-alone
# makefile to run simulations in batch mode.
# 
# The following variables can be set in the command line as follows: 
# 	 make 
# 
# CTOS_EXE - Specify path to CtoS executable if it is not in your path
# 
# USER_ARGS - Specify additional arguments to the simulator
# 
# SIM_GUI - Bring up SimVision

# *****************************************************************************
# ***** CtoS Section *****
# *****************************************************************************
CTOS_EXE		?= $(shell echo `which ctos`)
CTOS_ROOT		:= ${CTOS_EXE}/../../../../..
DESIGN_NAME		 ?= RCA_32b
TOP_MODULE_NAME		 = RCA_32b
DESIGN_SRC_FILES	 =  
DESIGN_TB_FILES		 = tb/main.cpp tb/tb.cpp tb/driver.cpp
MODEL_DIR		 ?= model
CTOS_INCLUDES		 := -I./$(MODEL_DIR) -I$(CTOS_ROOT)/share/ctos/include \
			 -I$(CTOS_ROOT)/share/ctos/include/ctos_fx \
			 -I$(CTOS_ROOT)/share/ctos/include/ctos_tlm \
			 -I$(CTOS_ROOT)/share/ctos/include/ctos_flex_channels \
			 -I$(CTOS_ROOT)/share/ctos/include/ctos_clock_gating \
			 -I$(IUS_HOME)/tools/systemc/include/tlm2 \
PROFILE_INCLUDES	 := -I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include \
			 -I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include/ctos_fx \
			 -I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include/ctos_tlm \
			 -I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include/ctos_flex_channels\
			 -I$(IUS_HOME)/tools/systemc/include/tlm2 \
CDSROOT := /tools/cadence/cadence_hierarchy/IUS-13.1
CDFLAGS 		 := -I/usr/local/systemc/include \
		-I$(CDSROOT)/tools/tbsc/include \
		-I$(CDSROOT)/tools/vic/include \
		-I$(CDSROOT)/tools/ovm/sc/src \
		-I$(CDSROOT)/tools/uvm/uvm_lib/uvm_sc/sc \
		-I$(CDSROOT)/tools/uvm/uvm_lib/uvm_ml/sc \
		-I$(CDSROOT)/tools/systemc/include/cci \
		-I$(CDSROOT)/tools/systemc/include/factory \
		-I$(CDSROOT)/tools/systemc/include/tlm2 \
		-fPIC \
		-pg \
		-I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include \
		-I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include/ctos_fx \
		-I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include/ctos_tlm \
		-I/tools/cadence/cadence_hierarchy/CTOS-13.2/share/ctos/include/ctos_flex_channels \
		-I$(CDSROOT)/tools/systemc/include/tlm2 \
		

# *****************************************************************************
# ***** Simulator Section *****
# *****************************************************************************
SIM_EXE			 = ncsc_run

SIM_GUI_ARGS		 = -layout cdebug -ncelab_args,-scCreateViewables \
			-linedebug +access+rwc -DSIM_GUI +GUI \
			+ncsc_run_dir+$(WORK_LIBS) \

SIM_STANDARD_ARGS	 = -gnu -64BIT -DEBUG
SIM_CONFIG_ARGS		 := -sc_main -I -unbuffered 

SIM_INCLUDES		 ?= $(CTOS_INCLUDES)
ORIG_ARGS		 := $(SIM_INCLUDES) $(SIM_STANDARD_ARGS) \
			$(SIM_CONFIG_ARGS)  \
			$(DESIGN_SRC_FILES) $(DESIGN_TB_FILES) +access+rwc +GUI -linedebug  \
			+ncsc_run_dir+$(WORK_LIBS) 
			
			
LOG_DIR			 ?= log

ifneq ($(origin USER_ARGS), undefined)
	ORIG_ARGS	 := $(ORIG_ARGS) $(USER_ARGS)
endif

ifneq ($(origin SIM_GUI), undefined)
	ORIG_ARGS	 := $(ORIG_ARGS) $(SIM_GUI_ARGS)
endif

SIM_ARGS		 := $(ORIG_ARGS)
WORK_LIBS		 := work_orig_sim \
			    work_post_build_sc_sim work_post_build_sim \
			    work_current_sc_sim work_current_sim \
			    work_final_sc_sim work_final_sim work_rtl_sim

RUN_LIBS		 := run_orig_sim \
			    run_post_build_sc_sim run_post_build_sim \
			    run_current_sc_sim run_current_sim \
			    run_final_sc_sim run_final_sim run_rtl_sim

# *****************************************************************************
# ***** Rules and Targets Section *****
# *****************************************************************************
all:	setup orig_sim hls \
	post_build_sim rtl_sim ls

setup:	info clean
	mkdir -p $(LOG_DIR)

info:
	@echo Test run at `date` on `hostname`
	@echo Test run in `pwd`

clean:

	rm -rf core* $(LOG_DIR)/*_sim.log $(WORK_LIBS) $(RUN_LIBS)

ctos_found:
	@if [ ! ${CTOS_EXE} ]; then \
		echo ""; \
		echo "============================="; \
		echo "Error: ctos not found in PATH"; \
		echo "============================="; \
		echo "Two ways to specify location of ctos:"; \
		echo "1. Run 'make CTOS_EXE=<ctos_install_path>/tools/bin/ctos' OR"; \
		echo "2. Add <ctos_install_path>/tools/bin to your PATH"; \
		echo ""; \
		exit 1; \
	fi;

	@if [ ! -e ${CTOS_EXE} ]; then \
		echo ""; \
		echo "================================================="; \
		echo "Error: Value of CTOS_EXE is not executable file"; \
		echo "================================================="; \
		echo "Check that the value of CTOS_EXE specified is an executable."; \
		echo ""; \
		exit 1; \
	fi;
profile:
	@echo "======================================================="
	@echo "Creating Profiling info for the original SystemC model "
	@echo "======================================================="
	mkdir -p profile_dir
	g++ $(CDFLAGS) src/axi_system.cc src/sgm_mod.cpp tb/tb.cpp tb/main.cpp -L/usr/local/systemc/lib-linux64 -lsystemc \
	-o profile_dir/main.out \
		

sim_found:	ctos_found
	@if [ ! $(shell echo `which ncsc_run`) ]; then \
		echo ""; \
		echo "=================================="; \
		echo "Error: ncsc_run not found in PATH"; \
		echo "=================================="; \
		echo "Add <ius_install_path>/tools/bin to your PATH"; \
		echo ""; \
		exit 1; \
	fi;

orig_sim:	sim_found
	@echo "======================================"
	@echo "Simulating the original SystemC model "
	@echo "======================================"
	rm -rf run_orig_sim/*
	mkdir -p $(LOG_DIR) work_orig_sim run_orig_sim
	$(SIM_EXE) $(ORIG_ARGS) \
		-out work_orig_sim \
		-log ../$(LOG_DIR)/orig_sim.log

post_build_sim:	sim_found
	@echo "==================================================="
	@echo "Simulating the post-build Verilog simulation model "
	@echo "==================================================="
	rm -rf run_post_build_sim/*
	mkdir -p $(LOG_DIR) work_post_build_sim run_post_build_sim
	export CTOS_TARGET_NAME=post_build_sim; export CTOS_MODEL=post_build; \
	$(SIM_EXE) $(SIM_ARGS) \
		$(MODEL_DIR)/*_post_build.v \
		-DCTOS_post_build -DCTOS_MODEL=post_build \
		-out work_post_build_sim \
		-log ../$(LOG_DIR)/post_build_sim.log

current_sim:	sim_found
	@echo "================================================"
	@echo "Simulating the current Verilog simulation model "
	@echo "================================================"
	rm -rf run_current_sim/*
	mkdir -p $(LOG_DIR) work_current_sim run_current_sim
	export CTOS_TARGET_NAME=current_sim; export CTOS_MODEL=current; \
	$(SIM_EXE) $(SIM_ARGS) \
		$(MODEL_DIR)/*_current.v \
		-DCTOS_current -DCTOS_MODEL=current \
		-out work_current_sim \
		-log ../$(LOG_DIR)/current_sim.log

final_sim:	sim_found
	@echo "=============================================="
	@echo "Simulating the final Verilog simulation model "
	@echo "=============================================="
	rm -rf run_final_sim/*
	mkdir -p $(LOG_DIR) work_final_sim run_final_sim
	export CTOS_TARGET_NAME=final_sim; export CTOS_MODEL=final; \
	$(SIM_EXE) $(SIM_ARGS) \
		$(MODEL_DIR)/*_final.v \
		-DCTOS_final -DCTOS_MODEL=final -D__CTOS__ -D_CTOS_ -DNOBURST\
		-out work_final_sim \
		-log ../$(LOG_DIR)/final_sim.log

rtl_sim:	sim_found
	@echo "========================="
	@echo "Simulating the RTL model "
	@echo "========================="
	rm -rf run_rtl_sim/*
	mkdir -p $(LOG_DIR) work_rtl_sim run_rtl_sim
	export CTOS_TARGET_NAME=rtl_sim; export CTOS_MODEL=rtl; \
	$(SIM_EXE) $(SIM_ARGS) \
		$(MODEL_DIR)/*_rtl.v \
		-DCTOS_rtl -DCTOS_MODEL=rtl  -DCTOS_SIM_CGIC -D__CTOS__ -D_CTOS_ \
		-out work_rtl_sim \
		-log ../$(LOG_DIR)/rtl_sim.log

hls:	ctos_found
	@echo "========================="
	@echo "Running CtoS..."
	@echo "========================="
	ctos ctos.tcl

ls:	ctos_found
	@echo "========================="
	@echo "Running RC..."
	@echo "========================="
	echo -n | rc -f DUT_rc.tcl -overwrite -cmdfile /dev/null -log log/rc.log -post exit

.PHONY: hls ls rtl_sim final_sim post_build_sim orig_sim
