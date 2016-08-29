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
Sheet 3 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA32U2 IC1
U 1 1 57A9B514
P 6350 3300
F 0 "IC1" H 5550 1900 50  0000 C CNN
F 1 "ATMEGA32U2" H 5700 2000 50  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 7250 2000 50  0000 C CNN
F 3 "http://www.atmel.com/Images/doc7799.pdf" H 6450 1850 50  0001 C CNN
	1    6350 3300
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR25
U 1 1 57A9BBC6
P 5050 4000
F 0 "#PWR25" H 5050 3800 50  0001 C CNN
F 1 "GNDPWR" H 5054 4074 50  0000 C CNN
F 2 "" H 5050 3950 50  0000 C CNN
F 3 "" H 5050 3950 50  0000 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 57A9BBDC
P 4450 3700
F 0 "C24" H 4565 3746 50  0000 L CNN
F 1 "1µF" H 4565 3655 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 4488 3550 50  0001 C CNN
F 3 "" H 4450 3700 50  0000 C CNN
	1    4450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3500 4450 3500
Wire Wire Line
	4450 3500 4450 3550
Wire Wire Line
	4450 3850 4450 3900
Wire Wire Line
	4450 3900 5250 3900
Wire Wire Line
	5050 4000 5050 3900
Connection ~ 5050 3900
Wire Wire Line
	5050 3600 5250 3600
Wire Wire Line
	5050 3700 5250 3700
Wire Wire Line
	5050 3800 5250 3800
$Comp
L GNDD #PWR27
U 1 1 57A9BF8B
P 6350 4800
F 0 "#PWR27" H 6350 4550 50  0001 C CNN
F 1 "GNDD" H 6355 4627 50  0000 C CNN
F 2 "" H 6350 4800 50  0000 C CNN
F 3 "" H 6350 4800 50  0000 C CNN
	1    6350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4800 6350 4700
Wire Wire Line
	6350 1800 6350 1900
$Comp
L R R9
U 1 1 57A9C7A8
P 5100 2300
F 0 "R9" H 5170 2346 50  0000 L CNN
F 1 "10k" H 5170 2255 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 5030 2300 50  0001 C CNN
F 3 "" H 5100 2300 50  0000 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2600 5100 2450
Wire Wire Line
	5100 1850 5100 2150
Wire Wire Line
	5100 1850 6350 1850
Connection ~ 6350 1850
$Comp
L SW_PUSH SW1
U 1 1 57A9C87D
P 4550 2250
F 0 "SW1" V 4596 2196 50  0000 R CNN
F 1 "RESET" V 4505 2196 50  0000 R CNN
F 2 "Buttons_Switches_SMD:SW_SPST_PTS645" H 4550 2250 50  0001 C CNN
F 3 "" H 4550 2250 50  0000 C CNN
	1    4550 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4550 2550 4550 2600
Connection ~ 5100 2600
$Comp
L GNDD #PWR24
U 1 1 57A9C94F
P 4550 1800
F 0 "#PWR24" H 4550 1550 50  0001 C CNN
F 1 "GNDD" H 4555 1627 50  0000 C CNN
F 2 "" H 4550 1800 50  0000 C CNN
F 3 "" H 4550 1800 50  0000 C CNN
	1    4550 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4550 1800 4550 1950
Connection ~ 4550 2600
Wire Wire Line
	7450 2500 7700 2500
Wire Wire Line
	7450 2400 7700 2400
Wire Wire Line
	7450 2300 7700 2300
Wire Wire Line
	7450 2200 7700 2200
Wire Wire Line
	5100 2000 4900 2000
Wire Wire Line
	4900 2000 4900 2700
Wire Wire Line
	4900 2700 5250 2700
Connection ~ 5100 2000
$Comp
L CRYSTAL_SMD X1
U 1 1 57A9EACC
P 4300 3000
F 0 "X1" V 4254 3083 50  0000 L CNN
F 1 "8MHz" V 4345 3083 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_2520_4Pads" H 4300 3000 50  0001 C CNN
F 3 "" H 4300 3000 50  0000 C CNN
	1    4300 3000
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 57A9EBA1
P 4800 3000
F 0 "R8" H 4870 3046 50  0000 L CNN
F 1 "1M" H 4870 2955 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 4730 3000 50  0001 C CNN
F 3 "" H 4800 3000 50  0000 C CNN
	1    4800 3000
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 57A9ECA3
P 3850 3250
F 0 "C23" V 3900 3350 50  0000 C CNN
F 1 "22p" V 3900 3100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3888 3100 50  0001 C CNN
F 3 "" H 3850 3250 50  0000 C CNN
	1    3850 3250
	0    -1   -1   0   
$EndComp
$Comp
L C C22
U 1 1 57A9ED32
P 3850 2750
F 0 "C22" V 3900 2850 50  0000 C CNN
F 1 "22p" V 3900 2600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3888 2600 50  0001 C CNN
F 3 "" H 3850 2750 50  0000 C CNN
	1    3850 2750
	0    -1   -1   0   
$EndComp
$Comp
L GNDD #PWR23
U 1 1 57A9EED3
P 3500 2900
F 0 "#PWR23" H 3500 2650 50  0001 C CNN
F 1 "GNDD" V 3505 2772 50  0000 R CNN
F 2 "" H 3500 2900 50  0000 C CNN
F 3 "" H 3500 2900 50  0000 C CNN
	1    3500 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 2750 3700 2750
Wire Wire Line
	3600 3250 3700 3250
Wire Wire Line
	3600 3000 4200 3000
Wire Wire Line
	4300 2800 4300 2750
Wire Wire Line
	4000 2750 5150 2750
Wire Wire Line
	4300 3200 4300 3250
Wire Wire Line
	4000 3250 5150 3250
Wire Wire Line
	4800 3250 4800 3150
Connection ~ 4300 3250
Wire Wire Line
	4800 2750 4800 2850
Connection ~ 4300 2750
Wire Wire Line
	5150 2750 5150 2800
Wire Wire Line
	5150 2800 5250 2800
Connection ~ 4800 2750
Wire Wire Line
	5250 2900 5150 2900
Wire Wire Line
	5150 2900 5150 3250
Connection ~ 4800 3250
Wire Wire Line
	3600 2750 3600 3250
Wire Wire Line
	3500 2900 3600 2900
Connection ~ 3600 2900
Connection ~ 3600 3000
$Comp
L CONN_01X01 P6
U 1 1 57AA1A9E
P 4150 2150
F 0 "P6" V 4115 2062 50  0000 R CNN
F 1 "RESET" V 4250 2250 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 4150 2150 50  0001 C CNN
F 3 "" H 4150 2150 50  0000 C CNN
	1    4150 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 2350 4150 2600
Wire Wire Line
	4150 2600 5250 2600
Wire Wire Line
	7650 3100 7450 3100
Wire Wire Line
	7650 3400 7450 3400
Wire Wire Line
	7450 3300 7650 3300
Wire Wire Line
	7650 3200 7450 3200
$Comp
L LTST-C190KSKT D1
U 1 1 57B615FA
P 8850 4000
F 0 "D1" V 8946 3920 50  0000 R CNN
F 1 "LTST-C190KSKT" V 8855 3920 50  0000 R CNN
F 2 "LEDs:LED_0603" H 8850 4000 50  0001 L CNN
F 3 "" H 8850 4000 60  0001 C CNN
	1    8850 4000
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 57B616FD
P 8850 3350
F 0 "R7" H 8920 3396 50  0000 L CNN
F 1 "R" H 8920 3305 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 8780 3350 50  0001 C CNN
F 3 "" H 8850 3350 50  0000 C CNN
	1    8850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4400 8850 4300
Wire Wire Line
	8850 3600 8850 3500
Wire Wire Line
	8850 3200 8850 3100
Text HLabel 7700 2500 2    60   BiDi ~ 0
MISO
Text HLabel 7700 2400 2    60   BiDi ~ 0
MOSI
Text HLabel 7700 2300 2    60   BiDi ~ 0
SCK
Text HLabel 7700 2200 2    60   Input ~ 0
SS_EXT
Text HLabel 5050 3700 0    60   BiDi ~ 0
D+
Text HLabel 5050 3800 0    60   BiDi ~ 0
D-
Text HLabel 5050 3600 0    60   Input ~ 0
V_USB
Text HLabel 7650 3200 2    60   Output ~ 0
CE_PLL
Text HLabel 7650 3100 2    60   Output ~ 0
CS_PLL
Text HLabel 7650 3300 2    60   Input ~ 0
LD_PLL
Text HLabel 7650 3400 2    60   Output ~ 0
EN_PLL
Wire Wire Line
	8850 4400 7450 4400
Text HLabel 6350 1800 1    60   Input ~ 0
VCC_D
Text HLabel 8850 3100 1    60   Input ~ 0
VCC_D
Text HLabel 7600 4300 2    60   Output ~ 0
EXT_CLK_EN
Wire Wire Line
	7600 4300 7450 4300
Entry Wire Line
	8100 3500 8200 3600
Entry Wire Line
	8100 3600 8200 3700
Entry Wire Line
	8100 3700 8200 3800
Wire Bus Line
	8200 3800 8200 3450
Wire Bus Line
	8200 3450 8300 3450
Text HLabel 8300 3450 2    60   Output ~ 0
FILT_SEL
Wire Wire Line
	8100 3500 7450 3500
Wire Wire Line
	8100 3600 7450 3600
Wire Wire Line
	8100 3700 7450 3700
Text Label 7700 3500 0    60   ~ 0
FILT1
Text Label 7700 3600 0    60   ~ 0
FILT2
Text Label 7700 3700 0    60   ~ 0
FILT3
Text HLabel 7600 4100 2    60   Output ~ 0
ATTEN_CS
Wire Wire Line
	7600 4100 7450 4100
$EndSCHEMATC
