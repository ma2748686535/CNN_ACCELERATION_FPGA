onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_fc_w_32x6464_opt

do {wave.do}

view wave
view structure
view signals

do {rom_fc_w_32x6464.udo}

run -all

quit -force
