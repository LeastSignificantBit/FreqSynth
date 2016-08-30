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
Title "Frequency Synthesizer"
Date ""
Rev ""
Comp "Martin Berglund"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3050 2850 0    60   Input ~ 0
RF_IN+
Text HLabel 1350 1650 0    60   Input ~ 0
RF_IN-
Text HLabel 9400 2800 2    60   Output ~ 0
RF_OUT
Text HLabel 1600 2950 0    60   Input ~ 0
VCC_RF
Text HLabel 1400 700  0    60   Input ~ 0
FILTER_SEL
Wire Bus Line
	1400 700  1650 700 
Wire Bus Line
	1650 700  1650 1350
Entry Wire Line
	1650 750  1750 850 
Entry Wire Line
	1650 950  1750 1050
Entry Wire Line
	1650 1150 1750 1250
Wire Wire Line
	1750 850  2050 850 
Wire Wire Line
	1750 1050 2050 1050
Wire Wire Line
	1750 1250 2050 1250
Text Label 2050 850  2    60   ~ 0
FILT1
Text Label 2050 1050 2    60   ~ 0
FILT2
Text Label 2050 1250 2    60   ~ 0
FILT3
Entry Wire Line
	1650 1350 1750 1450
Wire Wire Line
	1750 1450 2050 1450
Text Label 2050 1450 2    60   ~ 0
FILT4
Wire Wire Line
	9100 2800 9400 2800
Wire Wire Line
	4150 2550 4200 2550
Wire Wire Line
	4200 2550 4200 2200
Wire Wire Line
	4200 2200 8050 2200
Wire Wire Line
	8050 2200 8050 2500
Wire Wire Line
	8050 2500 8100 2500
Wire Wire Line
	4150 3150 4200 3150
Wire Wire Line
	4200 3150 4200 3500
Wire Wire Line
	4200 3500 8050 3500
Wire Wire Line
	8050 3500 8050 3100
Wire Wire Line
	8050 3100 8100 3100
Wire Wire Line
	3150 2550 3100 2550
Wire Wire Line
	3100 2550 3100 1350
Wire Wire Line
	3100 1350 9150 1350
Wire Wire Line
	9150 1350 9150 2500
Wire Wire Line
	9150 2500 9100 2500
Wire Wire Line
	9100 3100 9150 3100
Wire Wire Line
	9150 3100 9150 4400
Wire Wire Line
	9150 4400 3100 4400
Wire Wire Line
	3100 4400 3100 3150
Wire Wire Line
	3100 3150 3150 3150
$Comp
L Earth #PWR046
U 1 1 57C5693B
P 3650 3550
F 0 "#PWR046" H 3650 3300 50  0001 C CNN
F 1 "Earth" H 3650 3400 50  0001 C CNN
F 2 "" H 3650 3550 50  0000 C CNN
F 3 "" H 3650 3550 50  0000 C CNN
	1    3650 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3550 3650 3500
$Comp
L Earth #PWR047
U 1 1 57C5697B
P 8600 3500
F 0 "#PWR047" H 8600 3250 50  0001 C CNN
F 1 "Earth" H 8600 3350 50  0001 C CNN
F 2 "" H 8600 3500 50  0000 C CNN
F 3 "" H 8600 3500 50  0000 C CNN
	1    8600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3450 8600 3500
Wire Wire Line
	3150 2850 3050 2850
Wire Wire Line
	3150 2700 2900 2700
Wire Wire Line
	3150 3000 2900 3000
Wire Wire Line
	4150 2700 4400 2700
Wire Wire Line
	4150 3000 4400 3000
Wire Wire Line
	8100 2650 7850 2650
Wire Wire Line
	8100 2950 7850 2950
Wire Wire Line
	9100 2650 9350 2650
Wire Wire Line
	9100 2950 9350 2950
Text Label 4400 3000 2    60   ~ 0
FILT1
Text Label 4400 2700 2    60   ~ 0
FILT2
Text Label 2900 3000 0    60   ~ 0
FILT3
Text Label 2900 2700 0    60   ~ 0
FILT4
Text Label 7850 2950 0    60   ~ 0
FILT1
Text Label 7850 2650 0    60   ~ 0
FILT2
Text Label 9350 2950 2    60   ~ 0
FILT3
Text Label 9350 2650 2    60   ~ 0
FILT4
Text Notes 3500 900  0    60   ~ 0
-2dB
Text Notes 8450 850  0    60   ~ 0
-2dB
Wire Notes Line
	9150 600  9150 1150
Wire Notes Line
	3100 700  3100 1150
Wire Notes Line
	4250 700  4250 1150
Wire Notes Line
	8050 600  8050 1150
$Comp
L R R15
U 1 1 57C57D88
P 1600 1850
F 0 "R15" H 1600 1700 50  0000 L CNN
F 1 "49.9R" V 1600 1750 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 1530 1850 50  0001 C CNN
F 3 "" H 1600 1850 50  0000 C CNN
	1    1600 1850
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR048
U 1 1 57C57D98
P 1600 2100
F 0 "#PWR048" H 1600 1850 50  0001 C CNN
F 1 "Earth" H 1600 1950 50  0001 C CNN
F 2 "" H 1600 2100 50  0000 C CNN
F 3 "" H 1600 2100 50  0000 C CNN
	1    1600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2100 1600 2000
Wire Wire Line
	1600 1700 1600 1650
Wire Wire Line
	1600 1650 1350 1650
$Comp
L SKY13322-375LF U6
U 1 1 57C5590A
P 8600 2800
F 0 "U6" H 8600 3437 60  0000 C CNN
F 1 "SKY13322-375LF" H 8600 3331 60  0000 C CNN
F 2 "FreqSynth:MLPD-10" H 8600 2800 60  0001 C CNN
F 3 "" H 8600 2800 60  0001 C CNN
	1    8600 2800
	1    0    0    -1  
$EndComp
$Comp
L SKY13322-375LF U5
U 1 1 57C55831
P 3650 2850
F 0 "U5" H 3650 3487 60  0000 C CNN
F 1 "SKY13322-375LF" H 3650 3381 60  0000 C CNN
F 2 "FreqSynth:MLPD-10" H 3650 2850 60  0001 C CNN
F 3 "" H 3650 2850 60  0001 C CNN
	1    3650 2850
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
