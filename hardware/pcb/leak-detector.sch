EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Mechanical:MountingHole_Pad H3
U 1 1 5F3AD1F0
P 6350 850
F 0 "H3" H 6450 899 50  0000 L CNN
F 1 "MountingHole_Pad" H 6450 808 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO7380_Pad" H 6350 850 50  0001 C CNN
F 3 "~" H 6350 850 50  0001 C CNN
	1    6350 850 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F3AD6C6
P 5650 1250
F 0 "H2" H 5750 1299 50  0000 L CNN
F 1 "MountingHole_Pad" H 5750 1208 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO7380_Pad" H 5650 1250 50  0001 C CNN
F 3 "~" H 5650 1250 50  0001 C CNN
	1    5650 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5F3ADCDC
P 6600 1250
F 0 "H4" H 6700 1299 50  0000 L CNN
F 1 "MountingHole_Pad" H 6700 1208 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO7380_Pad" H 6600 1250 50  0001 C CNN
F 3 "~" H 6600 1250 50  0001 C CNN
	1    6600 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1350 5650 1450
Wire Wire Line
	6350 950  6350 1050
Wire Wire Line
	6600 1350 6600 1450
Wire Wire Line
	6600 1450 5650 1450
Connection ~ 5650 1450
Wire Wire Line
	2050 1150 2100 1150
Wire Wire Line
	2100 700  2250 700 
Wire Wire Line
	1300 1950 1450 1950
Connection ~ 1300 1950
Wire Wire Line
	1300 1950 1300 2200
$Comp
L power:GND #PWR0105
U 1 1 5F4C8F27
P 1300 2200
F 0 "#PWR0105" H 1300 1950 50  0001 C CNN
F 1 "GND" H 1305 2027 50  0000 C CNN
F 2 "" H 1300 2200 50  0001 C CNN
F 3 "" H 1300 2200 50  0001 C CNN
	1    1300 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 700  2250 800 
Wire Wire Line
	2100 1150 2100 700 
$Comp
L power:GND #PWR0106
U 1 1 5F4C83F4
P 2250 800
F 0 "#PWR0106" H 2250 550 50  0001 C CNN
F 1 "GND" H 2255 627 50  0000 C CNN
F 2 "" H 2250 800 50  0001 C CNN
F 3 "" H 2250 800 50  0001 C CNN
	1    2250 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2800 2300 2900
Wire Wire Line
	1050 2050 1450 2050
Wire Wire Line
	1050 1950 1300 1950
Wire Wire Line
	1050 1850 1450 1850
Wire Wire Line
	1050 1750 1450 1750
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5F3D481F
P 850 1850
F 0 "J2" H 958 2131 50  0000 C CNN
F 1 "Conn_01x04_Male" H 958 2040 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 850 1850 50  0001 C CNN
F 3 "~" H 850 1850 50  0001 C CNN
	1    850  1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5F3D36A4
P 2300 2900
F 0 "#PWR0104" H 2300 2650 50  0001 C CNN
F 1 "GND" H 2305 2727 50  0000 C CNN
F 2 "" H 2300 2900 50  0001 C CNN
F 3 "" H 2300 2900 50  0001 C CNN
	1    2300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1650 2600 1650
Wire Wire Line
	2450 1350 2450 1650
Wire Wire Line
	2050 1350 2450 1350
Wire Wire Line
	2600 1750 2600 1850
Wire Wire Line
	2950 1100 2950 1200
$Comp
L power:GND #PWR0103
U 1 1 5F3CD7D5
P 2950 1200
F 0 "#PWR0103" H 2950 950 50  0001 C CNN
F 1 "GND" H 2955 1027 50  0000 C CNN
F 2 "" H 2950 1200 50  0001 C CNN
F 3 "" H 2950 1200 50  0001 C CNN
	1    2950 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1250 2050 1250
Wire Wire Line
	2300 1100 2300 1250
Wire Wire Line
	2550 1100 2300 1100
$Comp
L power:GND #PWR0102
U 1 1 5F3BE7FE
P 2600 1850
F 0 "#PWR0102" H 2600 1600 50  0001 C CNN
F 1 "GND" H 2605 1677 50  0000 C CNN
F 2 "" H 2600 1850 50  0001 C CNN
F 3 "" H 2600 1850 50  0001 C CNN
	1    2600 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5F3C8B51
P 2750 1100
F 0 "SW1" H 2750 1385 50  0000 C CNN
F 1 "SW_Push" H 2750 1294 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_TL3342" H 2750 1300 50  0001 C CNN
F 3 "~" H 2750 1300 50  0001 C CNN
	1    2750 1100
	1    0    0    -1  
$EndComp
$Comp
L 1546215-2:1546215-2 J1
U 1 1 5F3BA73E
P 3000 1750
F 0 "J1" H 3230 1846 50  0000 L CNN
F 1 "1546215-2" H 3230 1755 50  0000 L CNN
F 2 "1546215-2:TE_1546215-2" H 3000 1750 50  0001 L BNN
F 3 "Compliant with Exemptions" H 3000 1750 50  0001 L BNN
F 4 "1546215-2" H 3000 1750 50  0001 L BNN "Field4"
	1    3000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1050 5400 1450
Connection ~ 5400 1050
Wire Wire Line
	6350 1050 5400 1050
Wire Wire Line
	5400 1450 5400 1550
Connection ~ 5400 1450
Wire Wire Line
	5650 1450 5400 1450
Wire Wire Line
	5400 950  5400 1050
$Comp
L power:GND #PWR0101
U 1 1 5F3B4BB1
P 5400 1550
F 0 "#PWR0101" H 5400 1300 50  0001 C CNN
F 1 "GND" H 5405 1377 50  0000 C CNN
F 2 "" H 5400 1550 50  0001 C CNN
F 3 "" H 5400 1550 50  0001 C CNN
	1    5400 1550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F3ACDAC
P 5400 850
F 0 "H1" H 5500 899 50  0000 L CNN
F 1 "MountingHole_Pad" H 5500 808 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO7380_Pad" H 5400 850 50  0001 C CNN
F 3 "~" H 5400 850 50  0001 C CNN
	1    5400 850 
	1    0    0    -1  
$EndComp
$Comp
L TINYPICO:TINYPICO XA1
U 1 1 5F3A7413
P 1450 1150
F 0 "XA1" H 1750 1375 50  0000 C CNN
F 1 "TINYPICO" H 1750 1284 50  0000 C CNN
F 2 "tinypico-kicad-footprint:TINYPICO" H 1700 1150 50  0001 C CNN
F 3 "" H 1700 1150 50  0001 C CNN
	1    1450 1150
	1    0    0    -1  
$EndComp
Text Notes 3400 2700 0    50   ~ 0
- On deep sleep the pin becomes floating hence\n  the pull-down.\n- Pin 25/26 have a 36 Hz noise in deep sleep after\n  having transmitted over wifi.\n- All pins with touch capability seem to have some\n  value of pull-up which prevents them from getting\n  to full 0 with an external pull-down in deep sleep. \n- So we use pin 21.
Wire Wire Line
	2050 1550 2300 1550
Wire Wire Line
	2300 1550 2300 2450
$Comp
L Device:R R1
U 1 1 5F4C0E76
P 2300 2650
F 0 "R1" H 2370 2696 50  0000 L CNN
F 1 "10k" H 2370 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2230 2650 50  0001 C CNN
F 3 "~" H 2300 2650 50  0001 C CNN
	1    2300 2650
	1    0    0    -1  
$EndComp
$Comp
L PS1240P02BT:PS1240P02BT LS1
U 1 1 5F396412
P 2650 2450
F 0 "LS1" H 2650 2717 50  0000 C CNN
F 1 "PS1240P02BT" H 2650 2626 50  0000 C CNN
F 2 "PS1240P02BT:XDCR_PS1240P02BT" H 2650 2450 50  0001 L BNN
F 3 "Unavailable" H 2650 2450 50  0001 L BNN
F 4 "PS1240P02CT3" H 2650 2450 50  0001 L BNN "Field4"
F 5 "7.0mm" H 2650 2450 50  0001 L BNN "Field5"
F 6 "None" H 2650 2450 50  0001 L BNN "Field6"
F 7 "Buzzers Transducer, Externally Driven Piezo 3V 4kHz 60dB @ 3V, 10cm Through Hole PC Pins" H 2650 2450 50  0001 L BNN "Field7"
F 8 "SIP-5 TDK" H 2650 2450 50  0001 L BNN "Field8"
F 9 "TDK" H 2650 2450 50  0001 L BNN "Field9"
	1    2650 2450
	1    0    0    -1  
$EndComp
Connection ~ 2300 2800
Wire Wire Line
	2450 2450 2300 2450
Connection ~ 2300 2450
Wire Wire Line
	2300 2450 2300 2500
Wire Wire Line
	2850 2450 2850 2800
Wire Wire Line
	2300 2800 2850 2800
Text Label 1050 2050 0    50   ~ 0
VBAT
$Comp
L B2B-PH-K-S_LF__SN_:B2B-PH-K-S(LF)(SN) J3
U 1 1 5F5A372D
P 1500 3350
F 0 "J3" H 1630 3346 50  0000 L CNN
F 1 "B2B-PH-K-S(LF)(SN)" H 1630 3255 50  0000 L CNN
F 2 "JST_B2B-PH-K-S(LF)(SN)" H 1500 3350 50  0001 L BNN
F 3 "455-1704-ND" H 1500 3350 50  0001 L BNN
F 4 "https://www.digikey.com.ua/product-detail/en/jst-sales-america-inc/B2B-PH-K-S_LF__SN_/455-1704-ND/926611?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 1500 3350 50  0001 L BNN "Field4"
F 5 "None" H 1500 3350 50  0001 L BNN "Field5"
F 6 "IPC-7251" H 1500 3350 50  0001 L BNN "Field6"
F 7 "JST Sales" H 1500 3350 50  0001 L BNN "Field7"
F 8 "N/A" H 1500 3350 50  0001 L BNN "Field8"
F 9 "B2B-PH-K-S_LF__SN_" H 1500 3350 50  0001 L BNN "Field9"
F 10 "PH Series 2 Position 2 mm Pitch Through Hole Top Entry Shrouded Header" H 1500 3350 50  0001 L BNN "Field10"
	1    1500 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F5A6AAA
P 1100 3500
F 0 "#PWR0107" H 1100 3250 50  0001 C CNN
F 1 "GND" H 1105 3327 50  0000 C CNN
F 2 "" H 1100 3500 50  0001 C CNN
F 3 "" H 1100 3500 50  0001 C CNN
	1    1100 3500
	1    0    0    -1  
$EndComp
Text Label 1000 3350 0    50   ~ 0
VBAT
Wire Wire Line
	1200 3350 1000 3350
Wire Wire Line
	1100 3500 1100 3450
Wire Wire Line
	1100 3450 1200 3450
$EndSCHEMATC
