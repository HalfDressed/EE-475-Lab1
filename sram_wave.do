onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /sramTestbench/clk
add wave -noupdate -radix binary /sramTestbench/reset
add wave -noupdate -radix binary /sramTestbench/read
add wave -noupdate -radix binary /sramTestbench/write
add wave -noupdate -radix binary /sramTestbench/latch
add wave -noupdate -radix binary /sramTestbench/dataEnable
add wave -noupdate -radix binary /sramTestbench/csBar
add wave -noupdate -radix binary /sramTestbench/oeBar
add wave -noupdate -radix binary /sramTestbench/weBar
add wave -noupdate -radix binary /sramTestbench/sramController/currState
add wave -noupdate -radix binary /sramTestbench/sramController/readState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16507 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {4152 ps} {19706 ps}
