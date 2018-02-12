transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_3/ex10 {H:/VERI_Experiment/Part_3/ex10/spi2dac.v}

