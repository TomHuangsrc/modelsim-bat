proc do_compile {} {
#  exec rm -rf work/
  vlib work
  vmap work work

  # compiling files
  vlog -work work  -f "list.f"
 
  
}

proc start_sim {} {
  # insert name of testbench module
 # vsim -coverage -novopt top_tb 
 vsim  -L work -L secureip -L unimacro_ver -L unisims_ver -L xpm -coverage -fsmdebug -voptargs="+acc" stack_tb glbl

  # adding all waveforms in hex view
 # add wave -r -hex *
 #  do wave.do
  # running simulation for some time
  # you can change for run -all for infinity simulation :-)
  #run -all 
  run 100us
}


proc show_coverage {} {
  coverage save 1.ucdb
  vcover report 1.ucdb -verbose -cvg
}

proc run_test {} {
  do_compile
  start_sim
}

proc help {} {
  echo "help                - show this message"
  echo "do_compile          - compile all"
  echo "start_sim           - start simulation"
  echo "run_test            - do_compile & start_sim"
  echo "show_coverage       - show coverage report"
}

help

run_test
