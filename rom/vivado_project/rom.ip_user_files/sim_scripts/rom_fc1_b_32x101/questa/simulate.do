onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom_fc1_b_32x101_opt

do {wave.do}

view wave
view structure
view signals

do {rom_fc1_b_32x101.udo}

run -all

quit -force
