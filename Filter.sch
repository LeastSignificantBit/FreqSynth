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
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1700 2450 0    60   Input ~ 0
RF_IN+
Text HLabel 1650 2600 0    60   Input ~ 0
RF_IN-
Text HLabel 8750 2550 0    60   Output ~ 0
RF_OUT
Text HLabel 1700 2200 0    60   Input ~ 0
VCC_RF
Text HLabel 1650 2800 0    60   Input ~ 0
FILTER_SEL
Wire Bus Line
	1650 2800 1900 2800
Wire Bus Line
	1900 2800 1900 3300
Entry Wire Line
	1900 2850 2000 2950
Entry Wire Line
	1900 3050 2000 3150
Entry Wire Line
	1900 3250 2000 3350
Wire Wire Line
	2000 2950 2300 2950
Wire Wire Line
	2000 3150 2300 3150
Wire Wire Line
	2000 3350 2300 3350
Text Label 2300 2950 2    60   ~ 0
FILT1
Text Label 2300 3150 2    60   ~ 0
FILT2
Text Label 2300 3350 2    60   ~ 0
FILT3
Text HLabel 1600 3600 0    60   Input ~ 0
ATTEN_MOSI
Text HLabel 1600 3750 0    60   Input ~ 0
ATTEN_CS
Text HLabel 1600 3900 0    60   Input ~ 0
ATTEN_SCK
$EndSCHEMATC
