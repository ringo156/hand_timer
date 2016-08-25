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
LIBS:hand_timer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L KRC_Conn2_PowerIn PS1
U 1 1 57B9F5BE
P 4250 2550
F 0 "PS1" H 4250 2850 60  0000 C CNN
F 1 "KRC_Conn2_PowerIn" H 4250 2250 60  0000 C CNN
F 2 "KUT_Connector:DF22-2P" H 4200 2570 60  0001 C CNN
F 3 "" H 4200 2570 60  0000 C CNN
	1    4250 2550
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_INV SW3
U 1 1 57B9F5C5
P 5450 2500
F 0 "SW3" H 5250 2650 50  0000 C CNN
F 1 "SWITCH_INV" H 5300 2350 50  0000 C CNN
F 2 "myfootprint:Toggle_Switch_1L" H 5450 2500 50  0001 C CNN
F 3 "" H 5450 2500 50  0000 C CNN
	1    5450 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 57B9F5CC
P 4800 2900
F 0 "#PWR024" H 4800 2650 50  0001 C CNN
F 1 "GND" H 4800 2750 50  0000 C CNN
F 2 "" H 4800 2900 50  0000 C CNN
F 3 "" H 4800 2900 50  0000 C CNN
	1    4800 2900
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR025
U 1 1 57B9F5D2
P 5950 2100
F 0 "#PWR025" H 5950 1950 50  0001 C CNN
F 1 "VCC" H 5950 2250 50  0000 C CNN
F 2 "" H 5950 2100 50  0000 C CNN
F 3 "" H 5950 2100 50  0000 C CNN
	1    5950 2100
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 57B9F5D8
P 6500 2900
F 0 "C3" H 6525 3000 50  0000 L CNN
F 1 "220uF" H 6525 2800 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D10_L13_P5" H 6538 2750 50  0001 C CNN
F 3 "" H 6500 2900 50  0000 C CNN
	1    6500 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 57B9F5DF
P 6500 3250
F 0 "#PWR026" H 6500 3000 50  0001 C CNN
F 1 "GND" H 6500 3100 50  0000 C CNN
F 2 "" H 6500 3250 50  0000 C CNN
F 3 "" H 6500 3250 50  0000 C CNN
	1    6500 3250
	1    0    0    -1  
$EndComp
$Comp
L TA48Mxx VR1
U 1 1 57B9F5E5
P 5100 3650
F 0 "VR1" H 5100 4050 60  0000 C CNN
F 1 "TA48Mxx" H 5100 3950 60  0000 C CNN
F 2 "myfootprint:TA48m33smd" H 5100 3650 60  0001 C CNN
F 3 "" H 5100 3650 60  0000 C CNN
	1    5100 3650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 57B9F5EC
P 4500 3850
F 0 "C1" H 4510 3920 50  0000 L CNN
F 1 "1uF" H 4510 3770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4500 3850 50  0001 C CNN
F 3 "" H 4500 3850 50  0000 C CNN
	1    4500 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 57B9F5F3
P 4500 4100
F 0 "#PWR027" H 4500 3850 50  0001 C CNN
F 1 "GND" H 4500 3950 50  0000 C CNN
F 2 "" H 4500 4100 50  0000 C CNN
F 3 "" H 4500 4100 50  0000 C CNN
	1    4500 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 57B9F5F9
P 5100 4100
F 0 "#PWR028" H 5100 3850 50  0001 C CNN
F 1 "GND" H 5100 3950 50  0000 C CNN
F 2 "" H 5100 4100 50  0000 C CNN
F 3 "" H 5100 4100 50  0000 C CNN
	1    5100 4100
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 57B9F5FF
P 5650 3800
F 0 "C2" H 5660 3870 50  0000 L CNN
F 1 "1uF" H 5660 3720 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5650 3800 50  0001 C CNN
F 3 "" H 5650 3800 50  0000 C CNN
	1    5650 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 57B9F606
P 5650 4100
F 0 "#PWR029" H 5650 3850 50  0001 C CNN
F 1 "GND" H 5650 3950 50  0000 C CNN
F 2 "" H 5650 4100 50  0000 C CNN
F 3 "" H 5650 4100 50  0000 C CNN
	1    5650 4100
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR030
U 1 1 57B9F60C
P 6500 2450
F 0 "#PWR030" H 6500 2300 50  0001 C CNN
F 1 "+12V" H 6500 2590 50  0000 C CNN
F 2 "" H 6500 2450 50  0000 C CNN
F 3 "" H 6500 2450 50  0000 C CNN
	1    6500 2450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR031
U 1 1 57B9F612
P 5850 3400
F 0 "#PWR031" H 5850 3250 50  0001 C CNN
F 1 "+3.3V" H 5850 3540 50  0000 C CNN
F 2 "" H 5850 3400 50  0000 C CNN
F 3 "" H 5850 3400 50  0000 C CNN
	1    5850 3400
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR032
U 1 1 57B9F618
P 4250 3400
F 0 "#PWR032" H 4250 3250 50  0001 C CNN
F 1 "+12V" H 4250 3540 50  0000 C CNN
F 2 "" H 4250 3400 50  0000 C CNN
F 3 "" H 4250 3400 50  0000 C CNN
	1    4250 3400
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG033
U 1 1 57B9F61E
P 6250 2600
F 0 "#FLG033" H 6250 2695 50  0001 C CNN
F 1 "PWR_FLAG" H 6250 2780 50  0000 C CNN
F 2 "" H 6250 2600 50  0000 C CNN
F 3 "" H 6250 2600 50  0000 C CNN
	1    6250 2600
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR034
U 1 1 57B9F624
P 6800 3250
F 0 "#PWR034" H 6800 3000 50  0001 C CNN
F 1 "GNDREF" H 6800 3100 50  0000 C CNN
F 2 "" H 6800 3250 50  0000 C CNN
F 3 "" H 6800 3250 50  0000 C CNN
	1    6800 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2500 4950 2500
Wire Wire Line
	4500 2600 4800 2600
Wire Wire Line
	4800 2600 4800 2900
Wire Wire Line
	4950 2500 4950 2250
Wire Wire Line
	4950 2250 5950 2250
Wire Wire Line
	5950 2100 5950 2400
Connection ~ 4950 2500
Connection ~ 5950 2250
Wire Wire Line
	6500 2450 6500 2750
Wire Wire Line
	6500 3050 6500 3250
Connection ~ 6500 2600
Wire Wire Line
	4500 3750 4500 3550
Connection ~ 4500 3550
Wire Wire Line
	4500 3950 4500 4100
Wire Wire Line
	5100 3950 5100 4100
Wire Wire Line
	5500 3550 6000 3550
Wire Wire Line
	5650 3700 5650 3550
Connection ~ 5650 3550
Wire Wire Line
	5650 3900 5650 4100
Wire Wire Line
	5850 3550 5850 3400
Wire Wire Line
	5950 2600 6850 2600
Wire Wire Line
	4250 3550 4700 3550
Wire Wire Line
	4250 3400 4250 3550
Connection ~ 6250 2600
Wire Wire Line
	6500 3150 7000 3150
Wire Wire Line
	6800 3150 6800 3250
Connection ~ 6500 3150
Text HLabel 6850 2600 2    60   Output ~ 0
12V
Text HLabel 7000 3150 2    60   Output ~ 0
GND
Text HLabel 6000 3550 2    60   Output ~ 0
3.3V
Connection ~ 6800 3150
Connection ~ 5850 3550
$EndSCHEMATC
