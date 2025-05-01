onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_conv2_w_32x18432_opt

do {wave.do}

view wave
view structure
view signals

do {rom_conv2_w_32x18432.udo}

run -all

quit -force
