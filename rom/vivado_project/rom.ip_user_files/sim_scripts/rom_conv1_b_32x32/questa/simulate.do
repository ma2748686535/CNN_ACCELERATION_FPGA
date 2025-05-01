onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_conv1_b_32x32_opt

do {wave.do}

view wave
view structure
view signals

do {rom_conv1_b_32x32.udo}

run -all

quit -force
