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
Sheet 6 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4800 1200 1    60   Input ~ 0
VCC_AMP
Text HLabel 2600 3150 0    60   Input ~ 0
ATTEN_MOSI
Text HLabel 2600 2950 0    60   Input ~ 0
ATTEN_CS
Text HLabel 2600 3050 0    60   Input ~ 0
ATTEN_SCK
Text HLabel 1100 2850 0    60   Input ~ 0
RF_IN
Text HLabel 7850 2850 2    60   Output ~ 0
RF_OUT
$Comp
L C C56
U 1 1 57CA75AE
P 4650 2850
F 0 "C56" V 4902 2850 50  0000 C CNN
F 1 "1nF" V 4811 2850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 4810 2850 50  0001 C CNN
F 3 "" H 4650 2850 50  0001 C CNN
F 4 "" H 4650 2850 60  0001 C CNN "manf#"
	1    4650 2850
	0    -1   -1   0   
$EndComp
$Comp
L C C57
U 1 1 57CA75FF
P 7550 2850
F 0 "C57" V 7802 2850 50  0000 C CNN
F 1 "1nF" V 7711 2850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 7710 2850 50  0001 C CNN
F 3 "" H 7550 2850 50  0001 C CNN
F 4 "" H 7550 2850 60  0001 C CNN "manf#"
	1    7550 2850
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR_SMALL L13
U 1 1 57CA7715
P 6300 2400
F 0 "L13" V 6254 2477 50  0000 L CNN
F 1 "100nH" V 6345 2477 50  0000 L CNN
F 2 "FreqSynth:L_0603" H 6300 2400 50  0001 C CNN
F 3 "" H 6300 2400 50  0001 C CNN
F 4 "" H 6300 2400 60  0001 C CNN "manf#"
	1    6300 2400
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR049
U 1 1 57CA7908
P 6100 2700
F 0 "#PWR049" H 6100 2450 50  0001 C CNN
F 1 "Earth" H 6100 2550 50  0001 C CNN
F 2 "" H 6100 2700 50  0000 C CNN
F 3 "" H 6100 2700 50  0000 C CNN
	1    6100 2700
	0    -1   -1   0   
$EndComp
$Comp
L Earth #PWR050
U 1 1 57CA793E
P 6100 3000
F 0 "#PWR050" H 6100 2750 50  0001 C CNN
F 1 "Earth" H 6100 2850 50  0001 C CNN
F 2 "" H 6100 3000 50  0000 C CNN
F 3 "" H 6100 3000 50  0000 C CNN
	1    6100 3000
	0    -1   -1   0   
$EndComp
$Comp
L Earth #PWR051
U 1 1 57CA7971
P 4800 3150
F 0 "#PWR051" H 4800 2900 50  0001 C CNN
F 1 "Earth" H 4800 3000 50  0001 C CNN
F 2 "" H 4800 3150 50  0000 C CNN
F 3 "" H 4800 3150 50  0000 C CNN
	1    4800 3150
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR052
U 1 1 57CA7990
P 4800 3000
F 0 "#PWR052" H 4800 2750 50  0001 C CNN
F 1 "Earth" H 4800 2850 50  0001 C CNN
F 2 "" H 4800 3000 50  0000 C CNN
F 3 "" H 4800 3000 50  0000 C CNN
	1    4800 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 1200 4800 2700
Wire Wire Line
	4800 2700 4900 2700
Wire Wire Line
	4800 2850 4900 2850
Wire Wire Line
	4800 3000 4900 3000
Wire Wire Line
	4800 3150 4900 3150
$Comp
L Earth #PWR053
U 1 1 57CA7B18
P 5450 3650
F 0 "#PWR053" H 5450 3400 50  0001 C CNN
F 1 "Earth" H 5450 3500 50  0001 C CNN
F 2 "" H 5450 3650 50  0000 C CNN
F 3 "" H 5450 3650 50  0000 C CNN
	1    5450 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3550 5450 3650
Wire Wire Line
	6000 3000 6100 3000
Wire Wire Line
	6000 3150 6100 3150
Wire Wire Line
	6100 2700 6000 2700
Wire Wire Line
	6000 2850 7400 2850
Wire Wire Line
	6300 2650 6300 2850
Connection ~ 6300 2850
Wire Wire Line
	7700 2850 7850 2850
Text HLabel 6300 1150 1    60   Input ~ 0
VCC_AMP
$Comp
L R R13
U 1 1 57CA7FC2
P 6300 1350
F 0 "R13" H 6370 1396 50  0000 L CNN
F 1 "1.8R" H 6370 1305 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 6230 1350 50  0001 C CNN
F 3 "" H 6300 1350 50  0001 C CNN
F 4 "" H 6300 1350 60  0001 C CNN "manf#"
	1    6300 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1150 6300 1200
Wire Wire Line
	6300 1500 6300 2150
$Comp
L C C54
U 1 1 57CA8743
P 6100 2050
F 0 "C54" V 6352 2050 50  0000 C CNN
F 1 "10pF" V 6261 2050 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 6260 2050 50  0001 C CNN
F 3 "" H 6100 2050 50  0001 C CNN
F 4 "" H 6100 2050 60  0001 C CNN "manf#"
	1    6100 2050
	0    -1   -1   0   
$EndComp
$Comp
L C C52
U 1 1 57CA87F9
P 6100 1650
F 0 "C52" V 5848 1650 50  0000 C CNN
F 1 "10nF" V 5939 1650 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 6260 1650 50  0001 C CNN
F 3 "" H 6100 1650 50  0001 C CNN
F 4 "" H 6100 1650 60  0001 C CNN "manf#"
	1    6100 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 1650 6300 1650
Connection ~ 6300 1650
Wire Wire Line
	6250 2050 6300 2050
Connection ~ 6300 2050
$Comp
L Earth #PWR054
U 1 1 57CA98B3
P 5650 2200
F 0 "#PWR054" H 5650 1950 50  0001 C CNN
F 1 "Earth" H 5650 2050 50  0001 C CNN
F 2 "" H 5650 2200 50  0000 C CNN
F 3 "" H 5650 2200 50  0000 C CNN
	1    5650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1550 5650 2200
Wire Wire Line
	5650 2050 5950 2050
Wire Wire Line
	5950 1650 5650 1650
Connection ~ 5650 2050
$Comp
L C C53
U 1 1 57CAA415
P 5200 1950
F 0 "C53" V 4948 1950 50  0000 C CNN
F 1 "100nF" V 5039 1950 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 5360 1950 50  0001 C CNN
F 3 "" H 5200 1950 50  0001 C CNN
F 4 "" H 5200 1950 60  0001 C CNN "manf#"
	1    5200 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 1950 5650 1950
Connection ~ 5650 1950
Wire Wire Line
	5050 1950 4800 1950
Connection ~ 4800 1950
$Comp
L C C51
U 1 1 57CAAC76
P 5200 1550
F 0 "C51" V 4948 1550 50  0000 C CNN
F 1 "1uF" V 5039 1550 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 5360 1550 50  0001 C CNN
F 3 "" H 5200 1550 50  0001 C CNN
F 4 "" H 5200 1550 60  0001 C CNN "manf#"
	1    5200 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 1550 4800 1550
Connection ~ 4800 1550
Wire Wire Line
	5350 1550 5650 1550
Connection ~ 5650 1650
NoConn ~ 6100 3150
$Comp
L TRF37A75 U8
U 1 1 57C5E6F5
P 5450 2950
F 0 "U8" H 5750 2450 60  0000 C CNN
F 1 "TRF37A75" H 5450 3481 60  0000 C CNN
F 2 "Housings_DFN_QFN:DFN-8-1EP_2x2mm_Pitch0.5mm" H 5450 2200 60  0001 C CNN
F 3 "" H 5450 2200 60  0001 C CNN
F 4 "TRF37A73IDSGT" H 5450 2950 60  0001 C CNN "manf#"
	1    5450 2950
	1    0    0    -1  
$EndComp
Text Notes 5150 950  2    60   ~ 0
95mA
$Comp
L PE43711 U9
U 1 1 57C77FE1
P 3600 3100
F 0 "U9" H 4100 2600 60  0000 L CNN
F 1 "PE43711" H 3350 3150 60  0000 L CNN
F 2 "Housings_DFN_QFN:QFN-24-1EP_4x4mm_Pitch0.5mm" H 3600 3100 60  0001 C CNN
F 3 "" H 3600 3100 60  0001 C CNN
F 4 "PE43711A-Z" H 3600 3100 60  0001 C CNN "manf#"
	1    3600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2850 4250 2850
Wire Wire Line
	2600 3050 2750 3050
Wire Wire Line
	2750 2950 2600 2950
Wire Wire Line
	2600 3150 2750 3150
Wire Wire Line
	2600 3250 2750 3250
Wire Wire Line
	2750 2750 2600 2750
$Comp
L C C59
U 1 1 57C7879B
P 2700 4600
F 0 "C59" H 2750 4700 50  0000 L CNN
F 1 "10nF" H 2750 4500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2738 4450 50  0001 C CNN
F 3 "" H 2700 4600 50  0001 C CNN
F 4 "" H 2700 4600 60  0001 C CNN "manf#"
	1    2700 4600
	1    0    0    -1  
$EndComp
$Comp
L C C60
U 1 1 57C787A2
P 3050 4600
F 0 "C60" H 3100 4700 50  0000 L CNN
F 1 "100pF" H 3100 4500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3088 4450 50  0001 C CNN
F 3 "" H 3050 4600 50  0001 C CNN
F 4 "" H 3050 4600 60  0001 C CNN "manf#"
	1    3050 4600
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR055
U 1 1 57C787B7
P 2700 4950
F 0 "#PWR055" H 2700 4700 50  0001 C CNN
F 1 "Earth" H 2700 4800 50  0001 C CNN
F 2 "" H 2700 4950 50  0000 C CNN
F 3 "" H 2700 4950 50  0000 C CNN
	1    2700 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4750 2700 4950
Wire Wire Line
	2700 4850 3050 4850
Wire Wire Line
	3050 4850 3050 4750
Connection ~ 2700 4850
Wire Wire Line
	3050 4350 3050 4450
Wire Wire Line
	2400 4350 3050 4350
Wire Wire Line
	2700 4450 2700 4350
Connection ~ 2700 4350
$Comp
L Earth #PWR056
U 1 1 57C788CB
P 4150 3900
F 0 "#PWR056" H 4150 3650 50  0001 C CNN
F 1 "Earth" H 4150 3750 50  0001 C CNN
F 2 "" H 4150 3900 50  0000 C CNN
F 3 "" H 4150 3900 50  0000 C CNN
	1    4150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3850 4150 3900
Wire Wire Line
	3000 3850 4150 3850
Wire Wire Line
	3000 3850 3000 3750
Wire Wire Line
	3100 3750 3100 3850
Connection ~ 3100 3850
Wire Wire Line
	3200 3750 3200 3850
Connection ~ 3200 3850
Wire Wire Line
	3300 3750 3300 3850
Connection ~ 3300 3850
Wire Wire Line
	3400 3750 3400 3850
Connection ~ 3400 3850
Wire Wire Line
	3500 3750 3500 3850
Connection ~ 3500 3850
Wire Wire Line
	3600 3750 3600 3850
Connection ~ 3600 3850
Wire Wire Line
	3700 3750 3700 3850
Connection ~ 3700 3850
Wire Wire Line
	3800 3750 3800 3850
Connection ~ 3800 3850
Wire Wire Line
	3900 3750 3900 3850
Connection ~ 3900 3850
Wire Wire Line
	4000 3750 4000 3850
Connection ~ 4000 3850
$Comp
L Earth #PWR057
U 1 1 57C78EEE
P 4050 2400
F 0 "#PWR057" H 4050 2150 50  0001 C CNN
F 1 "Earth" H 4050 2250 50  0001 C CNN
F 2 "" H 4050 2400 50  0000 C CNN
F 3 "" H 4050 2400 50  0000 C CNN
	1    4050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2300 4050 2400
Wire Wire Line
	3250 2300 4050 2300
Wire Wire Line
	3250 2300 3250 2400
Wire Wire Line
	3350 2400 3350 2300
Connection ~ 3350 2300
Wire Wire Line
	3450 2400 3450 2300
Connection ~ 3450 2300
Wire Wire Line
	3550 2300 3550 2400
Connection ~ 3550 2300
Wire Wire Line
	3650 2400 3650 2300
Connection ~ 3650 2300
Wire Wire Line
	3750 2400 3750 2300
Connection ~ 3750 2300
Wire Wire Line
	3850 2400 3850 2300
Connection ~ 3850 2300
Text Notes 2350 2600 0    60   ~ 0
0.2mA
$Comp
L C C55
U 1 1 57C799CE
P 1750 2850
F 0 "C55" V 2002 2850 50  0000 C CNN
F 1 "1nF" V 1911 2850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 1910 2850 50  0001 C CNN
F 3 "" H 1750 2850 50  0001 C CNN
F 4 "" H 1750 2850 60  0001 C CNN "manf#"
	1    1750 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 2850 2750 2850
Wire Wire Line
	1600 2850 1100 2850
Text HLabel 2600 2750 0    60   Input ~ 0
3V3
Text HLabel 2600 3250 0    60   Input ~ 0
3V3
Text HLabel 2400 4350 0    60   Input ~ 0
3V3
$Comp
L R R14
U 1 1 57C74CB9
P 6800 3150
F 0 "R14" H 6870 3196 50  0000 L CNN
F 1 "100R" H 6870 3105 50  0000 L CNN
F 2 "" V 6730 3150 50  0001 C CNN
F 3 "" H 6800 3150 50  0001 C CNN
F 4 "" H 6800 3150 60  0001 C CNN "manf#"
	1    6800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3000 6800 2850
Connection ~ 6800 2850
$Comp
L C C58
U 1 1 57C74DEF
P 6800 3600
F 0 "C58" V 7052 3600 50  0000 C CNN
F 1 "1nF" V 6961 3600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" V 6960 3600 50  0001 C CNN
F 3 "" H 6800 3600 50  0001 C CNN
F 4 "" H 6800 3600 60  0001 C CNN "manf#"
	1    6800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3450 6800 3300
Wire Wire Line
	6800 3750 6800 4100
Wire Wire Line
	6800 4100 7150 4100
$EndSCHEMATC
