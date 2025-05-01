onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_conv2_b_32x64_opt

do {wave.do}

view wave
view structure
view signals

do {rom_conv2_b_32x64.udo}

run -all

quit -force
