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
L m5stamp:2SJ496TZ-E Q1
U 1 1 6123737E
P 5450 3050
F 0 "Q1" H 6100 2685 50  0000 C CNN
F 1 "2SJ496TZ-E" H 6100 2776 50  0000 C CNN
F 2 "m5stamp_cad:2SJ496TZE" H 6600 3150 50  0001 L CNN
F 3 "https://www.renesas.com/us/en/doc/products/transistor/002/r07ds0433ej_2sj496.pdf" H 6600 3050 50  0001 L CNN
F 4 "Trans MOSFET P-CH Si 60V 5A 3-Pin TO-92 Mod T/R" H 6600 2950 50  0001 L CNN "Description"
F 5 "8.5" H 6600 2850 50  0001 L CNN "Height"
F 6 "Renesas Electronics" H 6600 2750 50  0001 L CNN "Manufacturer_Name"
F 7 "2SJ496TZ-E" H 6600 2650 50  0001 L CNN "Manufacturer_Part_Number"
	1    5450 3050
	-1   0    0    1   
$EndComp
$Comp
L Transistor_FET:2N7000 Q2
U 1 1 612377C5
P 5650 3550
F 0 "Q2" H 5855 3504 50  0000 L CNN
F 1 "2N7000" H 5855 3595 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5850 3475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 5650 3550 50  0001 L CNN
	1    5650 3550
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 612393A7
P 3800 4250
F 0 "J1" H 3718 3925 50  0000 C CNN
F 1 "Conn_01x02" H 3718 4016 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 3800 4250 50  0001 C CNN
F 3 "~" H 3800 4250 50  0001 C CNN
	1    3800 4250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61239E84
P 4200 4450
F 0 "#PWR0101" H 4200 4200 50  0001 C CNN
F 1 "GND" H 4205 4277 50  0000 C CNN
F 2 "" H 4200 4450 50  0001 C CNN
F 3 "" H 4200 4450 50  0001 C CNN
	1    4200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4250 4200 4450
$Comp
L Device:R R1
U 1 1 6123EBCA
P 4400 3400
F 0 "R1" H 4470 3446 50  0000 L CNN
F 1 "4.7K" H 4470 3355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4330 3400 50  0001 C CNN
F 3 "~" H 4400 3400 50  0001 C CNN
	1    4400 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61240F24
P 4400 3800
F 0 "R2" H 4470 3846 50  0000 L CNN
F 1 "4.7K" H 4470 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4330 3800 50  0001 C CNN
F 3 "~" H 4400 3800 50  0001 C CNN
	1    4400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3550 4400 3600
Wire Wire Line
	5150 3850 5150 3600
Connection ~ 4400 3600
Wire Wire Line
	4400 3600 4400 3650
$Comp
L power:GND #PWR0102
U 1 1 61243953
P 4400 4450
F 0 "#PWR0102" H 4400 4200 50  0001 C CNN
F 1 "GND" H 4405 4277 50  0000 C CNN
F 2 "" H 4400 4450 50  0001 C CNN
F 3 "" H 4400 4450 50  0001 C CNN
	1    4400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2950 5950 2950
Wire Wire Line
	5950 2950 5950 3050
Connection ~ 5950 4150
$Comp
L Device:R R4
U 1 1 61246528
P 5700 3050
F 0 "R4" V 5493 3050 50  0000 C CNN
F 1 "47K" V 5584 3050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 3050 50  0001 C CNN
F 3 "~" H 5700 3050 50  0001 C CNN
	1    5700 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 3050 5950 3050
Connection ~ 5950 3050
Wire Wire Line
	5950 3050 5950 4150
Wire Wire Line
	5550 3050 5450 3050
Wire Wire Line
	4150 3050 4150 3250
Wire Wire Line
	4150 3250 4400 3250
$Comp
L Device:C C1
U 1 1 612504BF
P 4800 3950
F 0 "C1" H 4915 3996 50  0000 L CNN
F 1 "0.1uF" H 4915 3905 50  0000 L CNN
F 2 "m5stamp_cad:generic_2pin_5mm" H 4838 3800 50  0001 C CNN
F 3 "~" H 4800 3950 50  0001 C CNN
	1    4800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4100 4800 4350
$Comp
L m5stamp:HC-SR04 U1
U 1 1 61258EAE
P 6150 2150
F 0 "U1" V 6289 1820 50  0000 R CNN
F 1 "HC-SR04" V 6198 1820 50  0000 R CNN
F 2 "m5stamp_cad:XCVR_HC-SR04" H 6150 2150 50  0001 L BNN
F 3 "" H 6150 2150 50  0001 L BNN
F 4 "Osepp" H 6150 2150 50  0001 L BNN "MANUFACTURER"
	1    6150 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 2350 6050 4250
Wire Wire Line
	7250 4350 7050 4350
Connection ~ 4400 4350
Wire Wire Line
	4400 4350 4400 4450
Wire Wire Line
	4400 3950 4400 4350
Connection ~ 4800 4350
Wire Wire Line
	4800 4350 4400 4350
Wire Wire Line
	6350 2350 6350 4350
Connection ~ 6350 4350
Wire Wire Line
	6350 4350 5850 4350
Wire Wire Line
	6250 3250 6250 2350
Wire Wire Line
	7250 3350 6150 3350
Wire Wire Line
	6150 3350 6150 2350
$Comp
L Device:C C2
U 1 1 61271118
P 6500 3950
F 0 "C2" H 6615 3996 50  0000 L CNN
F 1 "0.1uF" H 6615 3905 50  0000 L CNN
F 2 "m5stamp_cad:generic_2pin_5mm" H 6538 3800 50  0001 C CNN
F 3 "~" H 6500 3950 50  0001 C CNN
	1    6500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4100 6500 4350
Connection ~ 6500 4350
Wire Wire Line
	6500 4350 6350 4350
$Comp
L Device:R R6
U 1 1 61280B2D
P 6700 3550
F 0 "R6" V 6493 3550 50  0000 C CNN
F 1 "47K" V 6584 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6630 3550 50  0001 C CNN
F 3 "~" H 6700 3550 50  0001 C CNN
	1    6700 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	6050 4250 6700 4250
Wire Wire Line
	6700 3700 6700 4250
Connection ~ 6700 4250
Wire Wire Line
	6700 4250 7250 4250
Wire Wire Line
	7250 2950 6700 2950
Wire Wire Line
	6700 2950 6700 3400
$Comp
L m5stamp:m5stamp U2
U 1 1 61237F54
P 7550 3850
F 0 "U2" H 7778 4246 50  0000 L CNN
F 1 "m5stamp" H 7778 4155 50  0000 L CNN
F 2 "m5stamp_cad:m5stamp" H 6950 5550 50  0001 C CNN
F 3 "" H 6950 5550 50  0001 C CNN
	1    7550 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:Polyfuse F1
U 1 1 6128AF9D
P 4200 4150
F 0 "F1" V 3975 4150 50  0000 C CNN
F 1 "Polyfuse" V 4066 4150 50  0000 C CNN
F 2 "m5stamp_cad:generic_2pin_5mm" H 4250 3950 50  0001 L CNN
F 3 "~" H 4200 4150 50  0001 C CNN
	1    4200 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 2950 6500 2950
Connection ~ 6700 2950
Wire Wire Line
	7250 2850 7050 2850
Connection ~ 7050 4350
Wire Wire Line
	7050 4350 6500 4350
Wire Wire Line
	6700 2950 6700 2850
Wire Wire Line
	6700 2850 7050 2850
Connection ~ 7050 2850
Wire Wire Line
	7050 2850 7050 3250
Wire Wire Line
	7050 3850 7050 4350
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 6129B027
P 7050 3550
F 0 "SW1" V 7096 3420 50  0000 R CNN
F 1 "SW_DIP_x01" V 7005 3420 50  0000 R CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx01_Slide_9.78x4.72mm_W7.62mm_P2.54mm" H 7050 3550 50  0001 C CNN
F 3 "~" H 7050 3550 50  0001 C CNN
	1    7050 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3250 7250 3250
$Comp
L Device:R R5
U 1 1 612A6888
P 6500 3550
F 0 "R5" V 6293 3550 50  0000 C CNN
F 1 "1K" V 6384 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6430 3550 50  0001 C CNN
F 3 "~" H 6500 3550 50  0001 C CNN
	1    6500 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 3800 6500 3700
Wire Wire Line
	6500 2950 6500 3400
Wire Wire Line
	4800 3800 4800 3600
$Comp
L power:PWR_FLAG #FLG02
U 1 1 612CC8CB
P 3950 2550
F 0 "#FLG02" H 3950 2625 50  0001 C CNN
F 1 "PWR_FLAG" H 3950 2723 50  0000 C CNN
F 2 "" H 3950 2550 50  0001 C CNN
F 3 "~" H 3950 2550 50  0001 C CNN
	1    3950 2550
	1    0    0    -1  
$EndComp
NoConn ~ 7250 3050
NoConn ~ 7250 3150
NoConn ~ 7250 3450
NoConn ~ 7250 3550
NoConn ~ 7250 3950
NoConn ~ 7250 4050
Wire Wire Line
	4000 4250 4200 4250
$Comp
L power:GND #PWR0103
U 1 1 612EED98
P 3950 2550
F 0 "#PWR0103" H 3950 2300 50  0001 C CNN
F 1 "GND" H 3955 2377 50  0000 C CNN
F 2 "" H 3950 2550 50  0001 C CNN
F 3 "" H 3950 2550 50  0001 C CNN
	1    3950 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4150 7250 4150
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 612EFD01
P 4500 4150
F 0 "#FLG0101" H 4500 4225 50  0001 C CNN
F 1 "PWR_FLAG" H 4500 4323 50  0000 C CNN
F 2 "" H 4500 4150 50  0001 C CNN
F 3 "~" H 4500 4150 50  0001 C CNN
	1    4500 4150
	1    0    0    -1  
$EndComp
Connection ~ 4500 4150
Wire Wire Line
	4500 4150 5950 4150
Wire Wire Line
	4000 4150 4050 4150
Wire Wire Line
	4350 4150 4500 4150
Wire Wire Line
	5150 3850 7200 3850
Wire Wire Line
	7200 3850 7200 3650
Wire Wire Line
	7200 3650 7250 3650
NoConn ~ 7250 3850
Wire Wire Line
	4400 3600 4800 3600
Connection ~ 4800 3600
Wire Wire Line
	4800 3600 5150 3600
Wire Wire Line
	7250 3750 5650 3750
Wire Wire Line
	5850 3450 5850 4350
Connection ~ 5850 4350
Wire Wire Line
	4800 4350 5850 4350
Wire Wire Line
	5450 3450 5450 3050
Connection ~ 5450 3050
$EndSCHEMATC