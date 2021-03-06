EESchema Schematic File Version 2
LIBS:FreqSynth-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:FreqSynth
LIBS:FreqSynth-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title "Frequency Synthesizer"
Date ""
Rev ""
Comp "Martin Berglund"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R19
U 1 1 57B616FD
P 8550 4500
F 0 "R19" H 8620 4546 50  0000 L CNN
F 1 "180R" H 8620 4455 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 8480 4500 50  0001 C CNN
F 3 "" H 8550 4500 50  0001 C CNN
F 4 "RC0603FR-07180RL" H 8550 4500 60  0001 C CNN "manf#"
	1    8550 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4750 8550 4650
Wire Wire Line
	8550 4350 8550 4250
Text HLabel 4100 3250 0    60   BiDi ~ 0
MISO
Text HLabel 4100 3350 0    60   BiDi ~ 0
MOSI
Text HLabel 4100 3150 0    60   BiDi ~ 0
SCK
Text HLabel 7800 3650 2    60   Output ~ 0
CE_PLL
Text HLabel 7800 3550 2    60   Output ~ 0
CS_PLL
Text HLabel 7800 3450 2    60   Input ~ 0
LD_PLL
Text HLabel 7800 3350 2    60   Output ~ 0
EN_PLL
Text HLabel 7800 4150 2    60   Output ~ 0
ATTEN_CS
$Comp
L LED D3
U 1 1 57C92149
P 8550 4950
F 0 "D3" V 8596 4842 50  0000 R CNN
F 1 "YELLOW" V 8505 4842 50  0000 R CNN
F 2 "LEDs:LED-3MM" H 8550 4950 50  0001 C CNN
F 3 "" H 8550 4950 50  0001 C CNN
F 4 "" H 8550 4950 60  0001 C CNN "manf#"
	1    8550 4950
	0    -1   -1   0   
$EndComp
Text Notes 8850 4850 0    60   ~ 0
8mA 1.93V
Text HLabel 7800 3950 2    60   Output ~ 0
FILT1
Text HLabel 4100 2950 0    60   Output ~ 0
FILT2
Text HLabel 4100 3050 0    60   Output ~ 0
FILT3
Text HLabel 7800 3850 2    60   Output ~ 0
FILT4
Text HLabel 4100 3450 0    60   Output ~ 0
TX
Text HLabel 4100 3550 0    60   Input ~ 0
RX
Text HLabel 7800 3750 2    60   Input ~ 0
ADC1
$Comp
L C C62
U 1 1 57CC38C8
P 3100 6150
F 0 "C62" H 3150 6250 50  0000 L CNN
F 1 "10nF" H 3150 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3138 6000 50  0001 C CNN
F 3 "" H 3100 6150 50  0001 C CNN
F 4 "CC0603KRX7R9BB103" H 3100 6150 60  0001 C CNN "manf#"
	1    3100 6150
	1    0    0    -1  
$EndComp
$Comp
L C C63
U 1 1 57CC38D0
P 3450 6150
F 0 "C63" H 3500 6250 50  0000 L CNN
F 1 "100pF" H 3500 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3488 6000 50  0001 C CNN
F 3 "" H 3450 6150 50  0001 C CNN
F 4 "CC0603JRNPO9BN101" H 3450 6150 60  0001 C CNN "manf#"
	1    3450 6150
	1    0    0    -1  
$EndComp
Text HLabel 2400 5850 0    60   Input ~ 0
VCC_D
Wire Wire Line
	4900 6350 2400 6350
Wire Wire Line
	3450 6350 3450 6300
Wire Wire Line
	3100 6300 3100 6350
Connection ~ 3100 6350
Wire Wire Line
	3100 5850 3100 6000
Wire Wire Line
	2400 5850 4250 5850
Wire Wire Line
	3450 5850 3450 6000
Connection ~ 3100 5850
NoConn ~ 7800 3150
NoConn ~ 7800 3050
$Comp
L STM32F030K6T6 U?
U 1 1 57D4EFDC
P 7650 3050
AR Path="/57D4EFDC" Ref="U?"  Part="1" 
AR Path="/57C489F0/57D4EFDC" Ref="U12"  Part="1" 
F 0 "U12" H 7950 1600 60  0000 C CNN
F 1 "STM32F030K6T6" H 8400 3200 60  0000 C CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 7650 3050 60  0001 C CNN
F 3 "" H 7650 3050 60  0001 C CNN
F 4 "STM32F030K6T6" H 7650 3050 60  0001 C CNN "manf#"
	1    7650 3050
	-1   0    0    -1  
$EndComp
$Comp
L STM32F030K6T6 U?
U 3 1 57D4F166
P 4250 4300
AR Path="/57D4F166" Ref="U?"  Part="3" 
AR Path="/57C489F0/57D4F166" Ref="U12"  Part="3" 
F 0 "U12" H 5650 3600 60  0000 C CNN
F 1 "STM32F030K6T6" H 4800 4450 60  0000 C CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 4250 4300 60  0001 C CNN
F 3 "" H 4250 4300 60  0001 C CNN
	3    4250 4300
	1    0    0    -1  
$EndComp
$Comp
L STM32F030K6T6 U?
U 2 1 57D4F1F6
P 4250 2950
AR Path="/57D4F1F6" Ref="U?"  Part="2" 
AR Path="/57C489F0/57D4F1F6" Ref="U12"  Part="2" 
F 0 "U12" H 5100 2200 60  0000 L CNN
F 1 "STM32F030K6T6" H 4450 3100 60  0000 L CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 4250 2950 60  0001 C CNN
F 3 "" H 4250 2950 60  0001 C CNN
F 4 "STM32F030K6T6" H 4250 2950 60  0001 C CNN "manf#"
	2    4250 2950
	1    0    0    -1  
$EndComp
$Comp
L STM32F030K6T6 U?
U 4 1 57D4F275
P 4950 5800
AR Path="/57D4F275" Ref="U?"  Part="4" 
AR Path="/57C489F0/57D4F275" Ref="U12"  Part="4" 
F 0 "U12" H 5400 5200 60  0000 L CNN
F 1 "STM32F030K6T6" H 5150 6000 60  0000 L CNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 4950 5800 60  0001 C CNN
F 3 "" H 4950 5800 60  0001 C CNN
	4    4950 5800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P6
U 1 1 57D7C27A
P 2950 4500
F 0 "P6" H 3028 4541 50  0000 L CNN
F 1 "SWD" H 3028 4450 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 2950 4500 50  0001 C CNN
F 3 "" H 2950 4500 50  0001 C CNN
F 4 "" H 2950 4500 60  0001 C CNN "manf#"
	1    2950 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3150 4300 3250 4300
Text HLabel 3250 4300 2    60   Input ~ 0
VCC_D
$Comp
L Earth #PWR064
U 1 1 57D7C90A
P 3250 4500
F 0 "#PWR064" H 3250 4250 50  0001 C CNN
F 1 "Earth" H 3250 4350 50  0001 C CNN
F 2 "" H 3250 4500 50  0000 C CNN
F 3 "" H 3250 4500 50  0000 C CNN
	1    3250 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 4500 3150 4500
Wire Wire Line
	4250 4500 3550 4500
Wire Wire Line
	3550 4500 3550 4400
Wire Wire Line
	3550 4400 3150 4400
Wire Wire Line
	3150 4600 4250 4600
Wire Wire Line
	3150 4700 3700 4700
Wire Wire Line
	3700 4700 3700 4400
Wire Wire Line
	3700 4400 4250 4400
$Comp
L Earth #PWR065
U 1 1 57D7D255
P 4100 4300
F 0 "#PWR065" H 4100 4050 50  0001 C CNN
F 1 "Earth" H 4100 4150 50  0001 C CNN
F 2 "" H 4100 4300 50  0000 C CNN
F 3 "" H 4100 4300 50  0000 C CNN
	1    4100 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 4300 4100 4300
Wire Wire Line
	4250 4700 4100 4700
Wire Wire Line
	4250 4800 4100 4800
NoConn ~ 4100 4800
Text HLabel 4100 4700 0    60   Input ~ 0
CLK_IN
$Comp
L Earth #PWR066
U 1 1 57D8B7C1
P 2400 6450
F 0 "#PWR066" H 2400 6200 50  0001 C CNN
F 1 "Earth" H 2400 6300 50  0001 C CNN
F 2 "" H 2400 6450 50  0000 C CNN
F 3 "" H 2400 6450 50  0000 C CNN
	1    2400 6450
	1    0    0    -1  
$EndComp
$Comp
L C C64
U 1 1 57D8B8B9
P 3800 6150
F 0 "C64" H 3850 6250 50  0000 L CNN
F 1 "10nF" H 3850 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3838 6000 50  0001 C CNN
F 3 "" H 3800 6150 50  0001 C CNN
F 4 "CC0603KRX7R9BB103" H 3800 6150 60  0001 C CNN "manf#"
	1    3800 6150
	1    0    0    -1  
$EndComp
$Comp
L C C65
U 1 1 57D8B8C0
P 4150 6150
F 0 "C65" H 4200 6250 50  0000 L CNN
F 1 "100pF" H 4200 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4188 6000 50  0001 C CNN
F 3 "" H 4150 6150 50  0001 C CNN
F 4 "CC0603JRNPO9BN101" H 4150 6150 60  0001 C CNN "manf#"
	1    4150 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5850 3800 6000
Connection ~ 3450 5850
Wire Wire Line
	4150 5850 4150 6000
Connection ~ 3800 5850
Wire Wire Line
	4150 6350 4150 6300
Connection ~ 3450 6350
Wire Wire Line
	3800 6300 3800 6350
Connection ~ 3800 6350
$Comp
L L_Small L22
U 1 1 57D8F528
P 4350 5850
F 0 "L22" V 4450 5850 50  0000 C CNN
F 1 "Ferrite" V 4400 5850 50  0000 C CNN
F 2 "FreqSynth:L_0603" H 4350 5850 50  0001 C CNN
F 3 "" H 4350 5850 50  0001 C CNN
F 4 "BLM18AG121SN1D" H 4350 5850 60  0001 C CNN "manf#"
	1    4350 5850
	0    -1   -1   0   
$EndComp
$Comp
L C C61
U 1 1 57D9026B
P 2750 6150
F 0 "C61" H 2865 6196 50  0000 L CNN
F 1 "1µF" H 2865 6105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2788 6000 50  0001 C CNN
F 3 "" H 2750 6150 50  0001 C CNN
F 4 "CC0603KRX7R8BB105" H 2750 6150 60  0001 C CNN "manf#"
	1    2750 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6350 2400 6450
Wire Wire Line
	2750 6300 2750 6350
Connection ~ 2750 6350
Wire Wire Line
	2750 6000 2750 5850
Connection ~ 2750 5850
$Comp
L C C66
U 1 1 57D908CA
P 4600 6150
F 0 "C66" H 4650 6250 50  0000 L CNN
F 1 "10nF" H 4650 6050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4638 6000 50  0001 C CNN
F 3 "" H 4600 6150 50  0001 C CNN
F 4 "CC0603KRX7R9BB103" H 4600 6150 60  0001 C CNN "manf#"
	1    4600 6150
	1    0    0    -1  
$EndComp
Connection ~ 4150 5850
Wire Wire Line
	4450 5850 4750 5850
Wire Wire Line
	4600 5850 4600 6000
Wire Wire Line
	4600 6350 4600 6300
Connection ~ 4150 6350
Wire Wire Line
	4750 5800 4750 6000
Wire Wire Line
	4750 6000 4950 6000
Connection ~ 4600 5850
Wire Wire Line
	4950 6100 4900 6100
Wire Wire Line
	4900 6100 4900 6350
Connection ~ 4600 6350
Wire Wire Line
	4900 6200 4950 6200
Connection ~ 4900 6200
Wire Wire Line
	4850 5900 4950 5900
Wire Wire Line
	4850 5650 4850 5900
Wire Wire Line
	4850 5650 4050 5650
Wire Wire Line
	4050 5600 4050 5850
Connection ~ 4050 5850
Wire Wire Line
	4950 5800 4850 5800
Connection ~ 4850 5800
Wire Wire Line
	4250 3150 4100 3150
Wire Wire Line
	4100 3250 4250 3250
Wire Wire Line
	4100 3350 4250 3350
Wire Wire Line
	4100 3450 4250 3450
Wire Wire Line
	4100 3550 4250 3550
Wire Wire Line
	7800 3050 7650 3050
Wire Wire Line
	7800 3150 7650 3150
Wire Wire Line
	7800 3250 7650 3250
Wire Wire Line
	7800 3350 7650 3350
Wire Wire Line
	7800 3450 7650 3450
Wire Wire Line
	7800 3550 7650 3550
Wire Wire Line
	7800 3650 7650 3650
Wire Wire Line
	7800 3750 7650 3750
Wire Wire Line
	7650 3850 7800 3850
Wire Wire Line
	7800 3950 7650 3950
Wire Wire Line
	7800 4050 7650 4050
Wire Wire Line
	7800 4150 7650 4150
Wire Wire Line
	8550 4250 7650 4250
Wire Wire Line
	7800 4350 7650 4350
Wire Wire Line
	4250 3050 4100 3050
NoConn ~ 7800 4350
$Comp
L PWR_FLAG #FLG067
U 1 1 57DBB9EF
P 4750 5800
F 0 "#FLG067" H 4750 5895 50  0001 C CNN
F 1 "PWR_FLAG" H 4750 6024 50  0000 C CNN
F 2 "" H 4750 5800 50  0000 C CNN
F 3 "" H 4750 5800 50  0000 C CNN
	1    4750 5800
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG068
U 1 1 57DBBA23
P 4050 5600
F 0 "#FLG068" H 4050 5695 50  0001 C CNN
F 1 "PWR_FLAG" H 4050 5824 50  0000 C CNN
F 2 "" H 4050 5600 50  0000 C CNN
F 3 "" H 4050 5600 50  0000 C CNN
	1    4050 5600
	1    0    0    -1  
$EndComp
Connection ~ 4750 5850
Connection ~ 4050 5650
Text HLabel 7800 4050 2    60   Output ~ 0
PWDWN
Wire Wire Line
	4250 2950 4100 2950
Wire Wire Line
	8550 5250 8550 5150
$Comp
L Earth #PWR069
U 1 1 57D53363
P 8550 5250
F 0 "#PWR069" H 8550 5000 50  0001 C CNN
F 1 "Earth" H 8550 5100 50  0001 C CNN
F 2 "" H 8550 5250 50  0000 C CNN
F 3 "" H 8550 5250 50  0000 C CNN
	1    8550 5250
	1    0    0    -1  
$EndComp
Text HLabel 7800 3250 2    60   Output ~ 0
INT_CLK_EN
$EndSCHEMATC
