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
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 4350 900  1250 2750
U 57C489EF
F0 "PLL" 60
F1 "PLL.sch" 60
F2 "VCC_PLL" I L 4350 1350 60 
F3 "VCC_D" I L 4350 1050 60 
F4 "VCC_RF" I L 4350 1200 60 
F5 "CS_PLL" I L 4350 2400 60 
F6 "CE_PLL" I L 4350 2500 60 
F7 "MOSI" I L 4350 2850 60 
F8 "SCK" I L 4350 2950 60 
F9 "MISO" O L 4350 2750 60 
F10 "EN_PLL" I L 4350 2200 60 
F11 "LD_PLL" O L 4350 2300 60 
F12 "RF+" O R 5600 1350 60 
F13 "RF-" O R 5600 1450 60 
F14 "CLK_REF" I L 4350 3500 60 
F15 "RF_BALANCED+" O R 5600 2000 60 
F16 "RF_BALANCED-" O R 5600 2100 60 
$EndSheet
$Sheet
S 2950 2050 850  1600
U 57C489F0
F0 "MCU" 60
F1 "Controller.sch" 60
F2 "MISO" B R 3800 2750 60 
F3 "MOSI" B R 3800 2850 60 
F4 "SCK" B R 3800 2950 60 
F5 "SS_EXT" I L 2950 2900 60 
F6 "D+" B L 2950 2200 60 
F7 "D-" B L 2950 2300 60 
F8 "V_USB" I L 2950 2400 60 
F9 "CE_PLL" O R 3800 2500 60 
F10 "CS_PLL" O R 3800 2400 60 
F11 "LD_PLL" I R 3800 2300 60 
F12 "EN_PLL" O R 3800 2200 60 
F13 "VCC_D" I L 2950 2650 60 
F14 "EXT_CLK_EN" O R 3800 3500 60 
F15 "ATTEN_CS" O R 3800 3250 60 
F16 "FILT_SEL" O R 3800 3350 60 
$EndSheet
$Comp
L USB_OTG P?
U 1 1 57C489F1
P 1550 2200
F 0 "P?" V 1200 2000 50  0000 L CNN
F 1 "USB_OTG" H 1300 2400 50  0000 L CNN
F 2 "Connect:USB_Micro-B_10103594-0001LF" V 1500 2100 50  0001 C CNN
F 3 "" V 1500 2100 50  0000 C CNN
	1    1550 2200
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X06 P?
U 1 1 57C489F2
P 1450 3150
F 0 "P?" H 1300 3550 50  0000 C CNN
F 1 "CONN_01X06" V 1550 3150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 1450 3150 50  0001 C CNN
F 3 "" H 1450 3150 50  0000 C CNN
	1    1450 3150
	-1   0    0    1   
$EndComp
$Comp
L BARREL_JACK P?
U 1 1 57C489F3
P 1700 1150
F 0 "P?" H 1900 950 50  0000 C CNN
F 1 "BARREL_JACK" H 1681 1384 50  0000 C CNN
F 2 "Connect:BARREL_JACK" H 1700 1150 50  0001 C CNN
F 3 "" H 1700 1150 50  0000 C CNN
	1    1700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3000 2000 3000
Wire Wire Line
	1650 3100 2000 3100
Wire Wire Line
	1650 3200 2000 3200
Wire Wire Line
	1650 3400 1850 3400
Wire Wire Line
	1850 3400 1850 3500
$Comp
L GNDPWR #PWR?
U 1 1 57C489F4
P 1850 3500
F 0 "#PWR?" H 1850 3300 50  0001 C CNN
F 1 "GNDPWR" H 2050 3450 50  0000 C CNN
F 2 "" H 1850 3450 50  0000 C CNN
F 3 "" H 1850 3450 50  0000 C CNN
	1    1850 3500
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR?
U 1 1 57C489F5
P 2100 1350
F 0 "#PWR?" H 2100 1150 50  0001 C CNN
F 1 "GNDPWR" H 2300 1300 50  0000 C CNN
F 2 "" H 2100 1300 50  0000 C CNN
F 3 "" H 2100 1300 50  0000 C CNN
	1    2100 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1150 2100 1350
Wire Wire Line
	2100 1250 2000 1250
$Comp
L GNDPWR #PWR?
U 1 1 57C489F6
P 2100 2050
F 0 "#PWR?" H 2100 1850 50  0001 C CNN
F 1 "GNDPWR" H 2300 2000 50  0000 C CNN
F 2 "" H 2100 2000 50  0000 C CNN
F 3 "" H 2100 2000 50  0000 C CNN
	1    2100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2000 2100 2050
Wire Wire Line
	1850 2000 2100 2000
Wire Wire Line
	1950 2000 1950 1750
Wire Wire Line
	1950 1750 1450 1750
Wire Wire Line
	1450 1750 1450 1800
Connection ~ 1950 2000
Wire Wire Line
	1850 2100 1950 2100
NoConn ~ 1950 2100
Wire Wire Line
	2000 1150 2100 1150
Connection ~ 2100 1250
Wire Wire Line
	1850 2400 2950 2400
Text Label 2000 3000 2    60   ~ 0
MISO
Text Label 2000 3100 2    60   ~ 0
MOSI
Text Label 2000 3200 2    60   ~ 0
SCK
Text Label 4050 2750 2    60   ~ 0
MISO
Text Label 4050 2850 2    60   ~ 0
MOSI
Text Label 4050 2950 2    60   ~ 0
SCK
Connection ~ 2650 2400
Wire Wire Line
	2950 2200 1850 2200
Wire Wire Line
	1850 2300 2950 2300
Wire Wire Line
	1650 2900 2950 2900
Wire Wire Line
	1650 3300 2500 3300
$Comp
L BNC P?
U 1 1 57C489F7
P 6350 2000
F 0 "P?" H 6451 1976 50  0000 L CNN
F 1 "RF2P" H 6451 1885 50  0000 L CNN
F 2 "w_conn_rf:sma_straight_32k101-400l5" H 6350 2000 50  0001 C CNN
F 3 "" H 6350 2000 50  0000 C CNN
	1    6350 2000
	1    0    0    -1  
$EndComp
$Comp
L BNC P?
U 1 1 57C489F8
P 6050 2100
F 0 "P?" H 6151 2076 50  0000 L CNN
F 1 "RF2N" H 6151 1985 50  0000 L CNN
F 2 "w_conn_rf:sma_straight_32k101-400l5" H 6050 2100 50  0001 C CNN
F 3 "" H 6050 2100 50  0000 C CNN
	1    6050 2100
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 57C489F9
P 6350 2500
F 0 "#PWR?" H 6350 2250 50  0001 C CNN
F 1 "Earth" H 6350 2350 50  0001 C CNN
F 2 "" H 6350 2500 50  0000 C CNN
F 3 "" H 6350 2500 50  0000 C CNN
	1    6350 2500
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 57C489FA
P 6050 2500
F 0 "#PWR?" H 6050 2250 50  0001 C CNN
F 1 "Earth" H 6050 2350 50  0001 C CNN
F 2 "" H 6050 2500 50  0000 C CNN
F 3 "" H 6050 2500 50  0000 C CNN
	1    6050 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2100 5600 2100
Wire Wire Line
	6200 2000 5600 2000
Wire Wire Line
	6350 2200 6350 2500
Wire Wire Line
	6050 2300 6050 2500
$Sheet
S 2950 4400 1000 700 
U 57C489FB
F0 "Clock" 60
F1 "ClockRef.sch" 60
F2 "EXT_REF" I L 2950 4550 60 
F3 "REF_OUT" O R 3950 4550 60 
F4 "EXT_EN" I L 2950 4750 60 
F5 "3V3" I L 2950 4950 60 
$EndSheet
Wire Wire Line
	2950 2650 2800 2650
$Comp
L BNC P?
U 1 1 57C489FC
P 1600 4550
F 0 "P?" H 1701 4526 50  0000 L CNN
F 1 "REF_IN" H 1701 4435 50  0000 L CNN
F 2 "w_conn_rf:sma_straight_32k101-400l5" H 1600 4550 50  0001 C CNN
F 3 "" H 1600 4550 50  0000 C CNN
	1    1600 4550
	-1   0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 57C489FD
P 2100 4850
F 0 "C?" V 2150 4950 50  0000 C CNN
F 1 "0.1uF" V 2050 5000 50  0000 C CNN
F 2 "" H 2138 4700 50  0000 C CNN
F 3 "" H 2100 4850 50  0000 C CNN
	1    2100 4850
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 57C489FE
P 2100 4550
F 0 "C?" V 2150 4650 50  0000 C CNN
F 1 "0.1uF" V 2050 4700 50  0000 C CNN
F 2 "" H 2138 4400 50  0000 C CNN
F 3 "" H 2100 4550 50  0000 C CNN
	1    2100 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 4550 1750 4550
Wire Wire Line
	1600 4750 1600 4850
Wire Wire Line
	1600 4850 1950 4850
Wire Wire Line
	2250 4850 2400 4850
Wire Wire Line
	2400 4850 2400 5000
$Comp
L GNDD #PWR?
U 1 1 57C489FF
P 2400 5000
F 0 "#PWR?" H 2400 4750 50  0001 C CNN
F 1 "GNDD" H 2405 4827 50  0000 C CNN
F 2 "" H 2400 5000 50  0000 C CNN
F 3 "" H 2400 5000 50  0000 C CNN
	1    2400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 4550 2950 4550
Wire Wire Line
	2800 4950 2950 4950
$Comp
L VCC #PWR?
U 1 1 57C48A00
P 2800 2650
F 0 "#PWR?" H 2800 2500 50  0001 C CNN
F 1 "VCC" V 2850 2600 50  0000 L CNN
F 2 "" H 2800 2650 50  0000 C CNN
F 3 "" H 2800 2650 50  0000 C CNN
	1    2800 2650
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 57C48A01
P 2800 4950
F 0 "#PWR?" H 2800 4800 50  0001 C CNN
F 1 "VCC" V 2850 4950 50  0000 L CNN
F 2 "" H 2800 4950 50  0000 C CNN
F 3 "" H 2800 4950 50  0000 C CNN
	1    2800 4950
	0    -1   -1   0   
$EndComp
$Sheet
S 3000 900  850  600 
U 57C48A02
F0 "Power" 60
F1 "Power.sch" 60
F2 "VCC_D" O R 3850 1050 60 
F3 "VUSB" I L 3000 1350 60 
F4 "VCC_RF" O R 3850 1200 60 
F5 "VCC_PLL" O R 3850 1350 60 
F6 "VIN" I L 3000 1050 60 
$EndSheet
Wire Wire Line
	2650 2400 2650 1350
Wire Wire Line
	2650 1350 3000 1350
Wire Wire Line
	2500 3300 2500 1050
Wire Wire Line
	2000 1050 3000 1050
Connection ~ 2500 1050
Wire Wire Line
	3800 2950 4350 2950
Wire Wire Line
	3800 2850 4350 2850
Wire Wire Line
	3800 2750 4350 2750
Wire Wire Line
	3800 2200 4350 2200
Wire Wire Line
	3800 2300 4350 2300
Wire Wire Line
	3800 2400 4350 2400
Wire Wire Line
	3800 2500 4350 2500
Wire Wire Line
	3850 1050 4350 1050
Wire Wire Line
	3850 1200 4350 1200
Wire Wire Line
	3850 1350 4350 1350
Wire Wire Line
	3800 3500 3850 3500
Wire Wire Line
	3850 3500 3850 4200
Wire Wire Line
	3850 4200 2850 4200
Wire Wire Line
	2850 4200 2850 4750
Wire Wire Line
	2850 4750 2950 4750
Wire Wire Line
	4300 4550 4300 3500
Wire Wire Line
	4300 3500 4350 3500
$Comp
L VCC #PWR?
U 1 1 57C48A03
P 3950 850
F 0 "#PWR?" H 3950 700 50  0001 C CNN
F 1 "VCC" V 4000 800 50  0000 L CNN
F 2 "" H 3950 850 50  0000 C CNN
F 3 "" H 3950 850 50  0000 C CNN
	1    3950 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4550 3950 4550
Text Notes 2700 2550 0    60   ~ 0
??mA
Text Notes 2600 4850 0    60   ~ 0
??mA
Text Notes 3950 1350 0    60   ~ 0
??mA
Text Notes 3950 1200 0    60   ~ 0
??mA
Text Notes 3950 1050 0    60   ~ 0
??mA
Wire Wire Line
	3950 850  3950 1050
Connection ~ 3950 1050
$Sheet
S 6650 850  1150 2800
U 57C48A04
F0 "Filter" 60
F1 "Filter.sch" 60
F2 "RF_IN+" I L 6650 1350 60 
F3 "RF_IN-" I L 6650 1450 60 
F4 "RF_OUT" O R 7800 1050 60 
F5 "VCC_RF" I L 6650 950 60 
F6 "FILTER_SEL" I L 6650 3500 60 
F7 "ATTEN_MOSI" I L 6650 3050 60 
F8 "ATTEN_CS" I L 6650 3250 60 
F9 "ATTEN_SCK" I L 6650 3150 60 
$EndSheet
Wire Wire Line
	6650 1350 5600 1350
Wire Wire Line
	5600 1450 6650 1450
Wire Wire Line
	6650 950  5950 950 
Wire Wire Line
	5950 950  5950 750 
Wire Wire Line
	5950 750  4300 750 
Wire Wire Line
	4300 750  4300 1200
Connection ~ 4300 1200
Wire Wire Line
	6650 3050 6350 3050
Text Label 6350 3050 0    60   ~ 0
MOSI
Text Label 6350 3150 0    60   ~ 0
SCK
Wire Wire Line
	6350 3150 6650 3150
Wire Wire Line
	6650 3250 6450 3250
Wire Wire Line
	6450 3250 6450 3800
$Comp
L BNC P?
U 1 1 57C48A05
P 8350 1050
F 0 "P?" H 8451 1026 50  0000 L CNN
F 1 "RF1" H 8451 935 50  0000 L CNN
F 2 "w_conn_rf:sma_straight_32k101-400l5" H 8350 1050 50  0001 C CNN
F 3 "" H 8350 1050 50  0000 C CNN
	1    8350 1050
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR?
U 1 1 57C48A06
P 8350 1450
F 0 "#PWR?" H 8350 1200 50  0001 C CNN
F 1 "Earth" H 8350 1300 50  0001 C CNN
F 2 "" H 8350 1450 50  0000 C CNN
F 3 "" H 8350 1450 50  0000 C CNN
	1    8350 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1450 8350 1250
Wire Wire Line
	7800 1050 8200 1050
Wire Bus Line
	6650 3500 6550 3500
Wire Bus Line
	6550 3500 6550 3900
Wire Bus Line
	6550 3900 3950 3900
Wire Bus Line
	3950 3900 3950 3350
Wire Wire Line
	6450 3800 4050 3800
Wire Wire Line
	4050 3800 4050 3250
Wire Wire Line
	4050 3250 3800 3250
Wire Bus Line
	3950 3350 3800 3350
$EndSCHEMATC
