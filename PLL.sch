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
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title "Frequency Synthesizer"
Date ""
Rev ""
Comp "Martin Berglund"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5550 1500 5550 1600
Wire Wire Line
	5400 1500 5400 1600
Wire Wire Line
	4800 1500 4800 1600
Wire Wire Line
	3750 2250 3850 2250
Wire Wire Line
	3750 2400 3850 2400
Wire Wire Line
	3750 2550 3850 2550
Wire Wire Line
	3750 2700 3850 2700
$Comp
L GNDD #PWR26
U 1 1 57B31D6A
P 1650 6200
F 0 "#PWR26" H 1650 5950 50  0001 C CNN
F 1 "GNDD" H 1655 6027 50  0000 C CNN
F 2 "" H 1650 6200 50  0000 C CNN
F 3 "" H 1650 6200 50  0000 C CNN
	1    1650 6200
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 57B31D89
P 1650 5900
F 0 "C21" H 1700 6000 50  0000 L CNN
F 1 "10nF" H 1700 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1688 5750 50  0001 C CNN
F 3 "" H 1650 5900 50  0001 C CNN
F 4 "" H 1650 5900 60  0001 C CNN "manf#"
	1    1650 5900
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 57B31DE7
P 2000 5900
F 0 "C22" H 2050 6000 50  0000 L CNN
F 1 "100pF" H 2050 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2038 5750 50  0001 C CNN
F 3 "" H 2000 5900 50  0001 C CNN
F 4 "" H 2000 5900 60  0001 C CNN "manf#"
	1    2000 5900
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 57B31E10
P 2300 5900
F 0 "C23" H 2350 6000 50  0000 L CNN
F 1 "10nF" H 2350 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2338 5750 50  0001 C CNN
F 3 "" H 2300 5900 50  0001 C CNN
F 4 "" H 2300 5900 60  0001 C CNN "manf#"
	1    2300 5900
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 57B31EA3
P 2600 5900
F 0 "C24" H 2650 6000 50  0000 L CNN
F 1 "100pF" H 2650 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2638 5750 50  0001 C CNN
F 3 "" H 2600 5900 50  0001 C CNN
F 4 "" H 2600 5900 60  0001 C CNN "manf#"
	1    2600 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5700 2600 5700
Wire Wire Line
	1650 5700 1650 5750
Wire Wire Line
	2000 5700 2000 5750
Connection ~ 1650 5700
Wire Wire Line
	2300 5700 2300 5750
Connection ~ 2000 5700
Wire Wire Line
	2600 5700 2600 5750
Connection ~ 2300 5700
Wire Wire Line
	1650 6050 1650 6200
Wire Wire Line
	1650 6150 2600 6150
Wire Wire Line
	2000 6150 2000 6050
Connection ~ 1650 6150
Wire Wire Line
	2300 6150 2300 6050
Connection ~ 2000 6150
Wire Wire Line
	2600 6150 2600 6050
Connection ~ 2300 6150
$Comp
L GNDD #PWR24
U 1 1 57B33B3E
P 3650 6150
F 0 "#PWR24" H 3650 5900 50  0001 C CNN
F 1 "GNDD" H 3655 5977 50  0000 C CNN
F 2 "" H 3650 6150 50  0000 C CNN
F 3 "" H 3650 6150 50  0000 C CNN
	1    3650 6150
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 57B33B44
P 3650 5850
F 0 "C13" H 3700 5950 50  0000 L CNN
F 1 "10nF" H 3700 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3688 5700 50  0001 C CNN
F 3 "" H 3650 5850 50  0001 C CNN
F 4 "" H 3650 5850 60  0001 C CNN "manf#"
	1    3650 5850
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 57B33B4A
P 4000 5850
F 0 "C14" H 4050 5950 50  0000 L CNN
F 1 "100pF" H 4050 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4038 5700 50  0001 C CNN
F 3 "" H 4000 5850 50  0001 C CNN
F 4 "" H 4000 5850 60  0001 C CNN "manf#"
	1    4000 5850
	1    0    0    -1  
$EndComp
$Comp
L C C15
U 1 1 57B33B50
P 4300 5850
F 0 "C15" H 4350 5950 50  0000 L CNN
F 1 "10nF" H 4350 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4338 5700 50  0001 C CNN
F 3 "" H 4300 5850 50  0001 C CNN
F 4 "" H 4300 5850 60  0001 C CNN "manf#"
	1    4300 5850
	1    0    0    -1  
$EndComp
$Comp
L C C16
U 1 1 57B33B56
P 4600 5850
F 0 "C16" H 4650 5950 50  0000 L CNN
F 1 "100pF" H 4650 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4638 5700 50  0001 C CNN
F 3 "" H 4600 5850 50  0001 C CNN
F 4 "" H 4600 5850 60  0001 C CNN "manf#"
	1    4600 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5650 4600 5650
Wire Wire Line
	3650 5650 3650 5700
Wire Wire Line
	4000 5650 4000 5700
Connection ~ 3650 5650
Wire Wire Line
	4300 5650 4300 5700
Connection ~ 4000 5650
Wire Wire Line
	4600 5650 4600 5700
Connection ~ 4300 5650
Wire Wire Line
	3650 6000 3650 6150
Wire Wire Line
	3650 6100 4600 6100
Wire Wire Line
	4000 6100 4000 6000
Connection ~ 3650 6100
Wire Wire Line
	4300 6100 4300 6000
Connection ~ 4000 6100
Wire Wire Line
	4600 6100 4600 6000
Connection ~ 4300 6100
$Comp
L C C17
U 1 1 57B349E5
P 5550 5850
F 0 "C17" H 5600 5950 50  0000 L CNN
F 1 "10nF" H 5600 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5588 5700 50  0001 C CNN
F 3 "" H 5550 5850 50  0001 C CNN
F 4 "" H 5550 5850 60  0001 C CNN "manf#"
	1    5550 5850
	1    0    0    -1  
$EndComp
$Comp
L C C18
U 1 1 57B349EB
P 5900 5850
F 0 "C18" H 5950 5950 50  0000 L CNN
F 1 "100pF" H 5950 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5938 5700 50  0001 C CNN
F 3 "" H 5900 5850 50  0001 C CNN
F 4 "" H 5900 5850 60  0001 C CNN "manf#"
	1    5900 5850
	1    0    0    -1  
$EndComp
$Comp
L C C19
U 1 1 57B349F1
P 6200 5850
F 0 "C19" H 6250 5950 50  0000 L CNN
F 1 "10nF" H 6250 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6238 5700 50  0001 C CNN
F 3 "" H 6200 5850 50  0001 C CNN
F 4 "" H 6200 5850 60  0001 C CNN "manf#"
	1    6200 5850
	1    0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 57B349F7
P 6500 5850
F 0 "C20" H 6550 5950 50  0000 L CNN
F 1 "100pF" H 6550 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6538 5700 50  0001 C CNN
F 3 "" H 6500 5850 50  0001 C CNN
F 4 "" H 6500 5850 60  0001 C CNN "manf#"
	1    6500 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5650 6500 5650
Wire Wire Line
	5550 5650 5550 5700
Wire Wire Line
	5900 5650 5900 5700
Connection ~ 5550 5650
Wire Wire Line
	6200 5650 6200 5700
Connection ~ 5900 5650
Wire Wire Line
	6500 5650 6500 5700
Connection ~ 6200 5650
Wire Wire Line
	5550 6000 5550 6150
Wire Wire Line
	5550 6100 6500 6100
Wire Wire Line
	5900 6100 5900 6000
Connection ~ 5550 6100
Wire Wire Line
	6200 6100 6200 6000
Connection ~ 5900 6100
Wire Wire Line
	6500 6100 6500 6000
Connection ~ 6200 6100
$Comp
L Earth #PWR25
U 1 1 57B35822
P 5550 6150
F 0 "#PWR25" H 5550 5900 50  0001 C CNN
F 1 "Earth" H 5550 6000 50  0001 C CNN
F 2 "" H 5550 6150 50  0000 C CNN
F 3 "" H 5550 6150 50  0000 C CNN
	1    5550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1500 4500 1600
Wire Wire Line
	5100 1500 5100 1600
Wire Wire Line
	3750 3000 3850 3000
Wire Wire Line
	4650 3900 4650 4000
Wire Wire Line
	5550 3900 5550 4000
$Comp
L Earth #PWR18
U 1 1 57B387F8
P 4800 4000
F 0 "#PWR18" H 4800 3750 50  0001 C CNN
F 1 "Earth" H 4800 3850 50  0001 C CNN
F 2 "" H 4800 4000 50  0000 C CNN
F 3 "" H 4800 4000 50  0000 C CNN
	1    4800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4000 4800 3900
$Comp
L Earth #PWR11
U 1 1 57B38A29
P 4350 1500
F 0 "#PWR11" H 4350 1250 50  0001 C CNN
F 1 "Earth" H 4350 1350 50  0001 C CNN
F 2 "" H 4350 1500 50  0000 C CNN
F 3 "" H 4350 1500 50  0000 C CNN
	1    4350 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4350 1500 4350 1600
$Comp
L GNDD #PWR15
U 1 1 57B38F7C
P 6350 3150
F 0 "#PWR15" H 6350 2900 50  0001 C CNN
F 1 "GNDD" V 6355 3022 50  0000 R CNN
F 2 "" H 6350 3150 50  0000 C CNN
F 3 "" H 6350 3150 50  0000 C CNN
	1    6350 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3150 6250 3150
$Comp
L GNDD #PWR17
U 1 1 57B39029
P 4500 4000
F 0 "#PWR17" H 4500 3750 50  0001 C CNN
F 1 "GNDD" H 4505 3827 50  0000 C CNN
F 2 "" H 4500 4000 50  0000 C CNN
F 3 "" H 4500 4000 50  0000 C CNN
	1    4500 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3900 4500 4000
$Comp
L Earth #PWR16
U 1 1 57B39270
P 3750 3300
F 0 "#PWR16" H 3750 3050 50  0001 C CNN
F 1 "Earth" H 3750 3150 50  0001 C CNN
F 2 "" H 3750 3300 50  0000 C CNN
F 3 "" H 3750 3300 50  0000 C CNN
	1    3750 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 3300 3850 3300
$Comp
L GNDD #PWR12
U 1 1 57B393CE
P 4650 1500
F 0 "#PWR12" H 4650 1250 50  0001 C CNN
F 1 "GNDD" H 4655 1327 50  0000 C CNN
F 2 "" H 4650 1500 50  0000 C CNN
F 3 "" H 4650 1500 50  0000 C CNN
	1    4650 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 1500 4650 1600
$Comp
L GNDD #PWR13
U 1 1 57B39624
P 5250 1500
F 0 "#PWR13" H 5250 1250 50  0001 C CNN
F 1 "GNDD" H 5255 1327 50  0000 C CNN
F 2 "" H 5250 1500 50  0000 C CNN
F 3 "" H 5250 1500 50  0000 C CNN
	1    5250 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 1500 5250 1600
$Comp
L C C5
U 1 1 57B3A38B
P 3000 3150
F 0 "C5" V 2748 3150 50  0000 C CNN
F 1 "100nF" V 2839 3150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3038 3000 50  0001 C CNN
F 3 "" H 3000 3150 50  0001 C CNN
F 4 "" H 3000 3150 60  0001 C CNN "manf#"
	1    3000 3150
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 57B3A42C
P 2650 3400
F 0 "R2" H 2720 3446 50  0000 L CNN
F 1 "30.1R" V 2650 3300 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 2580 3400 50  0001 C CNN
F 3 "" H 2650 3400 50  0001 C CNN
F 4 "" H 2650 3400 60  0001 C CNN "manf#"
	1    2650 3400
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 57B3A50C
P 2650 3850
F 0 "R5" H 2580 3804 50  0000 R CNN
F 1 "90.9R" V 2650 3950 50  0000 R CNN
F 2 "Resistors_SMD:R_0603" V 2580 3850 50  0001 C CNN
F 3 "" H 2650 3850 50  0001 C CNN
F 4 "" H 2650 3850 60  0001 C CNN "manf#"
	1    2650 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 3600 2400 3600
Wire Wire Line
	2400 3600 2400 2850
Wire Wire Line
	2400 2850 3850 2850
Wire Wire Line
	2650 3550 2650 3700
Connection ~ 2650 3600
Wire Wire Line
	2650 3250 2650 3150
Wire Wire Line
	2650 3150 2850 3150
Wire Wire Line
	3150 3150 3850 3150
$Comp
L GNDD #PWR20
U 1 1 57B3AD4F
P 2650 4100
F 0 "#PWR20" H 2650 3850 50  0001 C CNN
F 1 "GNDD" H 2655 3927 50  0000 C CNN
F 2 "" H 2650 4100 50  0000 C CNN
F 3 "" H 2650 4100 50  0000 C CNN
	1    2650 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4000 2650 4100
$Comp
L C C7
U 1 1 57B3AF9E
P 3050 3850
F 0 "C7" H 2935 3804 50  0000 R CNN
F 1 "12nF" H 2935 3895 50  0000 R CNN
F 2 "Capacitors_SMD:C_0603" H 3088 3700 50  0001 C CNN
F 3 "" H 3050 3850 50  0001 C CNN
F 4 "" H 3050 3850 60  0001 C CNN "manf#"
	1    3050 3850
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR21
U 1 1 57B3B06B
P 3050 4100
F 0 "#PWR21" H 3050 3850 50  0001 C CNN
F 1 "Earth" H 3050 3950 50  0001 C CNN
F 2 "" H 3050 4100 50  0000 C CNN
F 3 "" H 3050 4100 50  0000 C CNN
	1    3050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4100 3050 4000
Wire Wire Line
	3050 3700 3050 3600
Wire Wire Line
	3050 3600 3400 3600
Wire Wire Line
	3400 3150 3400 3850
Connection ~ 3400 3150
$Comp
L R R6
U 1 1 57B3B6A3
P 3650 3850
F 0 "R6" V 3443 3850 50  0000 C CNN
F 1 "240R" V 3650 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3580 3850 50  0001 C CNN
F 3 "" H 3650 3850 50  0001 C CNN
F 4 "" H 3650 3850 60  0001 C CNN "manf#"
	1    3650 3850
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 57B3B74C
P 3950 4050
F 0 "C8" H 3835 4004 50  0000 R CNN
F 1 "820pF" H 3835 4095 50  0000 R CNN
F 2 "Capacitors_SMD:C_0603" H 3988 3900 50  0001 C CNN
F 3 "" H 3950 4050 50  0001 C CNN
F 4 "" H 3950 4050 60  0001 C CNN "manf#"
	1    3950 4050
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR22
U 1 1 57B3B7C5
P 3950 4300
F 0 "#PWR22" H 3950 4050 50  0001 C CNN
F 1 "Earth" H 3950 4150 50  0001 C CNN
F 2 "" H 3950 4300 50  0000 C CNN
F 3 "" H 3950 4300 50  0000 C CNN
	1    3950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4300 3950 4200
Wire Wire Line
	3950 3900 3950 3850
Wire Wire Line
	3800 3850 4150 3850
Wire Wire Line
	3400 3850 3500 3850
Connection ~ 3400 3600
Connection ~ 3950 3850
Text Label 4150 3850 2    60   ~ 0
TUNE
Wire Wire Line
	6250 2850 6500 2850
Text Label 6500 2850 2    60   ~ 0
TUNE
$Comp
L C C2
U 1 1 57B3D3F2
P 6550 2250
F 0 "C2" V 6600 2350 50  0000 C CNN
F 1 "1uF" V 6500 2100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6588 2100 50  0001 C CNN
F 3 "" H 6550 2250 50  0001 C CNN
F 4 "" H 6550 2250 60  0001 C CNN "manf#"
	1    6550 2250
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 57B3D4C8
P 6550 2400
F 0 "C3" V 6600 2500 50  0000 C CNN
F 1 "1uF" V 6500 2250 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6588 2250 50  0001 C CNN
F 3 "" H 6550 2400 50  0001 C CNN
F 4 "" H 6550 2400 60  0001 C CNN "manf#"
	1    6550 2400
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 57B3D523
P 6550 2550
F 0 "R1" V 6600 2700 50  0000 C CNN
F 1 "5.1k" V 6550 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6480 2550 50  0001 C CNN
F 3 "" H 6550 2550 50  0001 C CNN
F 4 "" H 6550 2550 60  0001 C CNN "manf#"
	1    6550 2550
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR14
U 1 1 57B3D5EB
P 6850 3100
F 0 "#PWR14" H 6850 2850 50  0001 C CNN
F 1 "Earth" H 6850 2950 50  0001 C CNN
F 2 "" H 6850 3100 50  0000 C CNN
F 3 "" H 6850 3100 50  0000 C CNN
	1    6850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2250 6250 2250
Wire Wire Line
	6400 2400 6250 2400
Wire Wire Line
	6400 2550 6250 2550
Wire Wire Line
	6850 2250 6850 3100
Wire Wire Line
	6850 2550 6700 2550
Connection ~ 6850 2700
Wire Wire Line
	6850 2400 6700 2400
Connection ~ 6850 2550
Wire Wire Line
	6850 2250 6700 2250
Connection ~ 6850 2400
$Comp
L C C4
U 1 1 57B3ED9C
P 6550 3000
F 0 "C4" V 6600 3100 50  0000 C CNN
F 1 "1uF" V 6500 2850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6588 2850 50  0001 C CNN
F 3 "" H 6550 3000 50  0001 C CNN
F 4 "" H 6550 3000 60  0001 C CNN "manf#"
	1    6550 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 3000 6250 3000
Wire Wire Line
	6850 3000 6700 3000
Wire Wire Line
	6350 3300 6250 3300
Wire Wire Line
	4950 3900 4950 4300
Wire Wire Line
	5100 3900 5100 4300
Wire Wire Line
	5250 3900 5250 4300
Wire Wire Line
	5400 3900 5400 4300
Text Label 5250 4300 1    60   ~ 0
RFB_P
Text Label 5400 4300 1    60   ~ 0
RFB_N
Text Label 8550 4150 0    60   ~ 0
RFB_P
Text Label 8550 4550 0    60   ~ 0
RFB_N
$Comp
L R R3
U 1 1 57B418C6
P 8950 3750
F 0 "R3" H 8950 3600 50  0000 L CNN
F 1 "49.9R" V 8950 3650 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 8880 3750 50  0001 C CNN
F 3 "" H 8950 3750 50  0001 C CNN
F 4 "" H 8950 3750 60  0001 C CNN "manf#"
	1    8950 3750
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 57B41952
P 9250 3750
F 0 "R4" H 9250 3600 50  0000 L CNN
F 1 "49.9R" V 9250 3650 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 9180 3750 50  0001 C CNN
F 3 "" H 9250 3750 50  0001 C CNN
F 4 "" H 9250 3750 60  0001 C CNN "manf#"
	1    9250 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3500 9500 3500
Wire Wire Line
	8950 3500 8950 3600
Wire Wire Line
	9250 3500 9250 3600
Connection ~ 8950 3500
Wire Wire Line
	8550 4150 9500 4150
Wire Wire Line
	8950 3900 8950 4150
Connection ~ 8950 4150
Wire Wire Line
	9250 3900 9250 4550
$Comp
L C C6
U 1 1 57B42399
P 9500 3750
F 0 "C6" H 9550 3600 50  0000 L CNN
F 1 "10nF" H 9550 3850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9538 3600 50  0001 C CNN
F 3 "" H 9500 3750 50  0001 C CNN
F 4 "" H 9500 3750 60  0001 C CNN "manf#"
	1    9500 3750
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR19
U 1 1 57B4246D
P 9500 4000
F 0 "#PWR19" H 9500 3750 50  0001 C CNN
F 1 "Earth" H 9500 3850 50  0001 C CNN
F 2 "" H 9500 4000 50  0000 C CNN
F 3 "" H 9500 4000 50  0000 C CNN
	1    9500 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4000 9500 3900
Wire Wire Line
	9500 3500 9500 3600
Connection ~ 9250 3500
$Comp
L C C9
U 1 1 57B4608E
P 9650 4150
F 0 "C9" V 9700 4000 50  0000 C CNN
F 1 "100pF" V 9600 4300 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 9688 4000 50  0001 C CNN
F 3 "" H 9650 4150 50  0001 C CNN
F 4 "" H 9650 4150 60  0001 C CNN "manf#"
	1    9650 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	8550 4550 9500 4550
Connection ~ 9250 4550
$Comp
L C C10
U 1 1 57B46E3B
P 9650 4550
F 0 "C10" V 9700 4400 50  0000 C CNN
F 1 "100pF" V 9600 4700 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 9688 4400 50  0001 C CNN
F 3 "" H 9650 4550 50  0001 C CNN
F 4 "" H 9650 4550 60  0001 C CNN "manf#"
	1    9650 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	10200 4550 9800 4550
Wire Wire Line
	10200 4150 9800 4150
Wire Wire Line
	6850 2700 6250 2700
Connection ~ 6850 3000
Text HLabel 4650 4000 3    60   Input ~ 0
VCC_PLL
Text HLabel 3450 5650 0    60   Input ~ 0
VCC_D
Text HLabel 6350 3300 2    60   Input ~ 0
VCC_RF
Text HLabel 3750 3000 0    60   Input ~ 0
VCC_PLL
Text HLabel 8800 3500 0    60   Input ~ 0
VCC_RF
Text HLabel 5550 4000 3    60   Input ~ 0
VCC_RF
Text HLabel 4500 1500 1    60   Input ~ 0
VCC_D
Text HLabel 5100 1500 1    60   Input ~ 0
VCC_D
Text HLabel 1450 5700 0    60   Input ~ 0
VCC_PLL
Text HLabel 5350 5650 0    60   Input ~ 0
VCC_RF
Text HLabel 3750 2550 0    60   Input ~ 0
CS_PLL
Text HLabel 3750 2700 0    60   Input ~ 0
CE_PLL
Text HLabel 3750 2400 0    60   Input ~ 0
MOSI
Text HLabel 3750 2250 0    60   Input ~ 0
SCK
Text HLabel 4800 1500 1    60   Output ~ 0
MISO
Text HLabel 5400 1500 1    60   Input ~ 0
EN_PLL
Text HLabel 5550 1500 1    60   Output ~ 0
LD_PLL
Text HLabel 10200 5650 2    60   Output ~ 0
RF+
Text HLabel 10200 6050 2    60   Output ~ 0
RF-
Wire Wire Line
	4950 1600 4950 1500
Text HLabel 4950 1500 1    60   Input ~ 0
CLK_REF
Text HLabel 10200 4150 2    60   Output ~ 0
RF_BALANCED+
Text HLabel 10200 4550 2    60   Output ~ 0
RF_BALANCED-
Text Label 8550 5650 0    60   ~ 0
RFA_P
Text Label 8550 6050 0    60   ~ 0
RFA_N
$Comp
L R R7
U 1 1 57C56026
P 8950 5250
F 0 "R7" H 8950 5100 50  0000 L CNN
F 1 "49.9R" V 8950 5150 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 8880 5250 50  0001 C CNN
F 3 "" H 8950 5250 50  0001 C CNN
F 4 "" H 8950 5250 60  0001 C CNN "manf#"
	1    8950 5250
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 57C5602C
P 9250 5250
F 0 "R8" H 9250 5100 50  0000 L CNN
F 1 "49.9R" V 9250 5150 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 9180 5250 50  0001 C CNN
F 3 "" H 9250 5250 50  0001 C CNN
F 4 "" H 9250 5250 60  0001 C CNN "manf#"
	1    9250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5000 9500 5000
Wire Wire Line
	8950 5000 8950 5100
Wire Wire Line
	9250 5000 9250 5100
Connection ~ 8950 5000
Wire Wire Line
	8550 5650 9500 5650
Wire Wire Line
	8950 5400 8950 5650
Connection ~ 8950 5650
Wire Wire Line
	9250 5400 9250 6050
$Comp
L C C11
U 1 1 57C5603A
P 9500 5250
F 0 "C11" H 9550 5100 50  0000 L CNN
F 1 "10nF" H 9550 5350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9538 5100 50  0001 C CNN
F 3 "" H 9500 5250 50  0001 C CNN
F 4 "" H 9500 5250 60  0001 C CNN "manf#"
	1    9500 5250
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR23
U 1 1 57C56040
P 9500 5500
F 0 "#PWR23" H 9500 5250 50  0001 C CNN
F 1 "Earth" H 9500 5350 50  0001 C CNN
F 2 "" H 9500 5500 50  0000 C CNN
F 3 "" H 9500 5500 50  0000 C CNN
	1    9500 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5500 9500 5400
Wire Wire Line
	9500 5000 9500 5100
Connection ~ 9250 5000
Wire Wire Line
	8550 6050 9500 6050
Connection ~ 9250 6050
Text HLabel 8800 5000 0    60   Input ~ 0
VCC_RF
Text Label 4950 4300 1    60   ~ 0
RFA_P
Text Label 5100 4300 1    60   ~ 0
RFA_N
$Comp
L C C12
U 1 1 57C56163
P 9650 5650
F 0 "C12" V 9700 5500 50  0000 C CNN
F 1 "100pF" V 9600 5800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 9688 5500 50  0001 C CNN
F 3 "" H 9650 5650 50  0001 C CNN
F 4 "" H 9650 5650 60  0001 C CNN "manf#"
	1    9650 5650
	0    1    1    0   
$EndComp
$Comp
L C C25
U 1 1 57C56213
P 9650 6050
F 0 "C25" V 9700 5900 50  0000 C CNN
F 1 "100pF" V 9600 6200 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 9688 5900 50  0001 C CNN
F 3 "" H 9650 6050 50  0001 C CNN
F 4 "" H 9650 6050 60  0001 C CNN "manf#"
	1    9650 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	10200 6050 9800 6050
Wire Wire Line
	10200 5650 9800 5650
$Comp
L MAX2870 U1
U 1 1 57C4AF1D
P 5000 2750
F 0 "U1" V 5200 2700 60  0000 L CNN
F 1 "MAX2870" V 5000 2550 60  0000 L CNN
F 2 "Housings_DFN_QFN:QFN-32-1EP_5x5mm_Pitch0.5mm" H 3850 3750 60  0001 C CNN
F 3 "" H 3850 3750 60  0001 C CNN
F 4 "MAX2870ETJ+" H 5000 2750 60  0001 C CNN "manf#"
	1    5000 2750
	0    1    1    0   
$EndComp
Text Notes 5300 5550 0    60   ~ 0
120mA
Text Notes 3150 5500 0    60   ~ 0
120mA
Text Notes 1150 5550 0    60   ~ 0
120mA
$EndSCHEMATC
