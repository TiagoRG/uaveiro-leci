onerror {exit -code 1}
vlib work
vcom -work work Mux4_1Demo.vho
vcom -work work Mux4_1.vwf.vht
vsim -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.Mux4_1_vhd_vec_tst
vcd file -direction Mux4_1Demo.msim.vcd
vcd add -internal Mux4_1_vhd_vec_tst/*
vcd add -internal Mux4_1_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
