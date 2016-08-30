EESchema Schematic File Version 2
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
Sheet 4 7
Title "Frequency Synthesizer"
Date ""
Rev ""
Comp "Martin Berglund"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6100 3550 0    60   Input ~ 0
EXT_REF
Text HLabel 7100 3350 2    60   Output ~ 0
REF_OUT
Text HLabel 7100 3550 2    60   Input ~ 0
INT_EN
$Comp
L TS5A3159 U7
U 1 1 57C95E9C
P 6600 3450
F 0 "U7" H 6850 3200 50  0000 C CNN
F 1 "TS5A3159" H 6350 3750 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SC-70-6" H 6650 3200 50  0001 L CNN
F 3 "" H 6700 3450 50  0000 C CNN
	1    6600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3350 6200 3350
Text HLabel 6600 3050 1    60   Input ~ 0
3V3
Wire Wire Line
	6600 3050 6600 3150
$Comp
L GNDD #PWR031
U 1 1 57C95FB3
P 6600 3850
F 0 "#PWR031" H 6600 3600 50  0001 C CNN
F 1 "GNDD" H 6605 3677 50  0000 C CNN
F 2 "" H 6600 3850 50  0000 C CNN
F 3 "" H 6600 3850 50  0000 C CNN
	1    6600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3850 6600 3750
Wire Wire Line
	7100 3350 7000 3350
Wire Wire Line
	7100 3550 7000 3550
$Comp
L SIT5000AICGE-33E0-25.000000X X2
U 1 1 57C96AC6
P 4850 3450
F 0 "X2" H 5050 3150 60  0000 C CNN
F 1 "SIT5000AICGE-33E0-25.000000X" H 4850 3731 60  0000 C CNN
F 2 "Crystals:Crystal_SMD_2520_4Pads" H 4900 2800 60  0001 C CNN
F 3 "" H 4900 2800 60  0001 C CNN
	1    4850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3550 6200 3550
Text HLabel 5400 3050 1    60   Input ~ 0
3V3
Wire Wire Line
	5300 3350 5400 3350
$Comp
L GNDD #PWR032
U 1 1 57C96C05
P 4300 3650
F 0 "#PWR032" H 4300 3400 50  0001 C CNN
F 1 "GNDD" H 4305 3477 50  0000 C CNN
F 2 "" H 4300 3650 50  0000 C CNN
F 3 "" H 4300 3650 50  0000 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3350 4300 3350
Wire Wire Line
	4300 3650 4300 3550
Wire Wire Line
	4300 3550 4400 3550
Wire Wire Line
	5300 3550 5550 3550
Wire Wire Line
	5550 3550 5550 3350
Wire Wire Line
	5400 3350 5400 3050
Text HLabel 4300 3350 0    60   Input ~ 0
INT_EN
Text HLabel 4400 4700 1    60   Input ~ 0
3V3
$Comp
L GNDD #PWR033
U 1 1 57C9CB52
P 4400 5200
F 0 "#PWR033" H 4400 4950 50  0001 C CNN
F 1 "GNDD" H 4405 5027 50  0000 C CNN
F 2 "" H 4400 5200 50  0000 C CNN
F 3 "" H 4400 5200 50  0000 C CNN
	1    4400 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4700 4400 4800
Wire Wire Line
	4400 4750 4750 4750
Wire Wire Line
	4750 4750 4750 4800
Connection ~ 4400 4750
Wire Wire Line
	4750 5100 4750 5150
Wire Wire Line
	4750 5150 4400 5150
Wire Wire Line
	4400 5100 4400 5200
Connection ~ 4400 5150
$Comp
L C C40
U 1 1 57C9D01B
P 4400 4950
F 0 "C40" H 4450 5050 50  0000 L CNN
F 1 "10nF" H 4450 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4438 4800 50  0001 C CNN
F 3 "" H 4400 4950 50  0000 C CNN
	1    4400 4950
	1    0    0    -1  
$EndComp
$Comp
L C C41
U 1 1 57C9D022
P 4750 4950
F 0 "C41" H 4800 5050 50  0000 L CNN
F 1 "100pF" H 4800 4850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4788 4800 50  0001 C CNN
F 3 "" H 4750 4950 50  0000 C CNN
	1    4750 4950
	1    0    0    -1  
$EndComp
Text Notes 5500 2950 0    60   ~ 0
33mA\n
Text Notes 6650 2900 0    60   ~ 0
<1mA
$EndSCHEMATC
