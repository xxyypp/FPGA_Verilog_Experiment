transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/spi2dac.v}
vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/spi2adc.v}
vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/pwm.v}
vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/ex16_top.v}
vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/clktick_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto {H:/VERI_Experiment/Part_4/ex16/ex16_proto/ex16_proto/allpass.v}

