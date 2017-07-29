onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TxController_tb/clk
add wave -noupdate /TxController_tb/Reset
add wave -noupdate /TxController_tb/StartTx
add wave -noupdate /TxController_tb/Write
add wave -noupdate /TxController_tb/pstate
add wave -noupdate /TxController_tb/Addr
add wave -noupdate /TxController_tb/Data
add wave -noupdate /TxController_tb/Size
add wave -noupdate /TxController_tb/Burst
add wave -noupdate /TxController_tb/SDA
add wave -noupdate /TxController_tb/SCL
add wave -noupdate /TxController_tb/PassSCL
add wave -noupdate /TxController_tb/PassSDA
add wave -noupdate /TxController_tb/LoadTxBurstCount
add wave -noupdate /TxController_tb/LoadTxBuf0
add wave -noupdate /TxController_tb/LoadTxBuf1
add wave -noupdate /TxController_tb/DecTxBurstCount
add wave -noupdate /TxController_tb/TxBurstCount
add wave -noupdate /TxController_tb/LoadTxBitCount
add wave -noupdate /TxController_tb/ShiftTxBuf0
add wave -noupdate /TxController_tb/ShiftTxBuf1
add wave -noupdate /TxController_tb/DecTxBitCount
add wave -noupdate /TxController_tb/TxBitCount
add wave -noupdate /TxController_tb/LoadEightBitCount
add wave -noupdate /TxController_tb/DecEightBitCount
add wave -noupdate /TxController_tb/EightBitCount
add wave -noupdate /TxController_tb/ReadyData
add wave -noupdate /TxController_tb/TxIn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {16 ns} {246 ns}
