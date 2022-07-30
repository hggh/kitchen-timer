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
L Device:Buzzer BZ1
U 1 1 5DB4C2D7
P 8250 1300
F 0 "BZ1" H 8403 1329 50  0000 L CNN
F 1 "Buzzer" H 8403 1238 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" V 8225 1400 50  0001 C CNN
F 3 "~" V 8225 1400 50  0001 C CNN
	1    8250 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DB4D2CD
P 8550 3850
F 0 "R3" V 8343 3850 50  0000 C CNN
F 1 "2.6k" V 8434 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8480 3850 50  0001 C CNN
F 3 "~" H 8550 3850 50  0001 C CNN
	1    8550 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5DB4D5F0
P 9500 3550
F 0 "R4" V 9293 3550 50  0000 C CNN
F 1 "2.6k" V 9384 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9430 3550 50  0001 C CNN
F 3 "~" H 9500 3550 50  0001 C CNN
	1    9500 3550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DB4D70E
P 9200 4300
F 0 "#PWR013" H 9200 4050 50  0001 C CNN
F 1 "GND" H 9205 4127 50  0000 C CNN
F 2 "" H 9200 4300 50  0001 C CNN
F 3 "" H 9200 4300 50  0001 C CNN
	1    9200 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR014
U 1 1 5DB4E51D
P 10050 3400
F 0 "#PWR014" H 10050 3250 50  0001 C CNN
F 1 "+3V3" H 10065 3573 50  0000 C CNN
F 2 "" H 10050 3400 50  0001 C CNN
F 3 "" H 10050 3400 50  0001 C CNN
	1    10050 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 3550 9650 3000
Wire Wire Line
	9650 3000 10650 3000
Wire Wire Line
	10650 3000 10650 3800
Wire Wire Line
	10650 3800 10350 3800
$Comp
L power:GND #PWR015
U 1 1 5DB4EEF7
P 10550 4650
F 0 "#PWR015" H 10550 4400 50  0001 C CNN
F 1 "GND" H 10555 4477 50  0000 C CNN
F 2 "" H 10550 4650 50  0001 C CNN
F 3 "" H 10550 4650 50  0001 C CNN
	1    10550 4650
	1    0    0    -1  
$EndComp
Text GLabel 9550 4350 0    50   Input ~ 0
SCL
Text GLabel 9550 4450 0    50   Input ~ 0
SDA
Text GLabel 8250 3850 1    50   Input ~ 0
ENABLE_LCD
Wire Wire Line
	8250 3850 8400 3850
$Comp
L power:+3V3 #PWR09
U 1 1 5DB51C6E
P 7400 5300
F 0 "#PWR09" H 7400 5150 50  0001 C CNN
F 1 "+3V3" H 7415 5473 50  0000 C CNN
F 2 "" H 7400 5300 50  0001 C CNN
F 3 "" H 7400 5300 50  0001 C CNN
	1    7400 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5DB5347F
P 8350 5950
F 0 "#PWR012" H 8350 5700 50  0001 C CNN
F 1 "GND" H 8355 5777 50  0000 C CNN
F 2 "" H 8350 5950 50  0001 C CNN
F 3 "" H 8350 5950 50  0001 C CNN
	1    8350 5950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 5DB5367A
P 6950 5650
F 0 "J3" H 7056 6028 50  0000 C CNN
F 1 "RT" H 7056 5937 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6950 5650 50  0001 C CNN
F 3 "~" H 6950 5650 50  0001 C CNN
	1    6950 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5450 8350 5450
Wire Wire Line
	8350 5450 8350 5950
Text GLabel 7400 5650 2    50   Input ~ 0
RT_SW
Text GLabel 7700 5750 2    50   Input ~ 0
RT_DT
Text GLabel 7950 5850 2    50   Input ~ 0
RT_CLK
Wire Wire Line
	7400 5650 7150 5650
Wire Wire Line
	7150 5750 7700 5750
Wire Wire Line
	7950 5850 7150 5850
Text GLabel 3950 4200 2    50   Input ~ 0
RT_SW
Text GLabel 3950 4700 2    50   Input ~ 0
RT_DT
Text GLabel 3850 4500 2    50   Input ~ 0
ENABLE_LCD
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5DCF1949
P 1650 6050
F 0 "J1" H 1756 6228 50  0000 C CNN
F 1 "BATT" H 1756 6137 50  0000 C CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 1650 6050 50  0001 C CNN
F 3 "~" H 1650 6050 50  0001 C CNN
	1    1650 6050
	1    0    0    -1  
$EndComp
$Comp
L kitchen-timer-rescue:ATmega328-PU-MCU_Microchip_ATmega U1
U 1 1 5DCF6330
P 2950 3500
F 0 "U1" H 2309 3546 50  0000 R CNN
F 1 "ATmega328-PU" H 2309 3455 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2950 3500 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2950 3500 50  0001 C CNN
	1    2950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 5DCF657C
P 3900 2950
F 0 "Y1" V 3854 3038 50  0000 L CNN
F 1 "32khz" V 3945 3038 50  0000 L CNN
F 2 "Crystal:Crystal_DS15_D1.5mm_L5.0mm_Vertical" H 3900 2950 50  0001 C CNN
F 3 "~" H 3900 2950 50  0001 C CNN
	1    3900 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 2900 3750 2900
Wire Wire Line
	3750 2900 3750 2850
Wire Wire Line
	3750 2850 3900 2850
Wire Wire Line
	3900 3050 3800 3050
Wire Wire Line
	3800 3050 3800 3000
Wire Wire Line
	3800 3000 3550 3000
$Comp
L Device:R R1
U 1 1 5DCF94BC
P 3900 3800
F 0 "R1" V 3693 3800 50  0000 C CNN
F 1 "10k" V 3784 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3830 3800 50  0001 C CNN
F 3 "~" H 3900 3800 50  0001 C CNN
	1    3900 3800
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR07
U 1 1 5DCF9596
P 4250 3800
F 0 "#PWR07" H 4250 3650 50  0001 C CNN
F 1 "+3.3V" H 4265 3973 50  0000 C CNN
F 2 "" H 4250 3800 50  0001 C CNN
F 3 "" H 4250 3800 50  0001 C CNN
	1    4250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3800 4050 3800
Wire Wire Line
	3750 3800 3550 3800
$Comp
L Device:C C3
U 1 1 5DCFCBF0
P 2800 1750
F 0 "C3" V 2548 1750 50  0000 C CNN
F 1 "100nf" V 2639 1750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2838 1600 50  0001 C CNN
F 3 "~" H 2800 1750 50  0001 C CNN
	1    2800 1750
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5DCFCE19
P 2800 1350
F 0 "C2" V 2548 1350 50  0000 C CNN
F 1 "100nf" V 2639 1350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2838 1200 50  0001 C CNN
F 3 "~" H 2800 1350 50  0001 C CNN
	1    2800 1350
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5DCFD20C
P 2950 1100
F 0 "#PWR05" H 2950 950 50  0001 C CNN
F 1 "+3.3V" H 2965 1273 50  0000 C CNN
F 2 "" H 2950 1100 50  0001 C CNN
F 3 "" H 2950 1100 50  0001 C CNN
	1    2950 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DCFD28B
P 2650 1800
F 0 "#PWR04" H 2650 1550 50  0001 C CNN
F 1 "GND" V 2655 1672 50  0000 R CNN
F 2 "" H 2650 1800 50  0001 C CNN
F 3 "" H 2650 1800 50  0001 C CNN
	1    2650 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 5DCFD2C0
P 2100 2300
F 0 "#PWR03" H 2100 2150 50  0001 C CNN
F 1 "+3.3V" H 2115 2473 50  0000 C CNN
F 2 "" H 2100 2300 50  0001 C CNN
F 3 "" H 2100 2300 50  0001 C CNN
	1    2100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2300 2100 2300
Wire Wire Line
	2950 1100 2950 1350
Wire Wire Line
	2950 1350 3050 1350
Wire Wire Line
	3050 1350 3050 2000
Connection ~ 2950 1350
Wire Wire Line
	2950 1350 2950 1750
Wire Wire Line
	2950 1750 2950 2000
Connection ~ 2950 1750
Wire Wire Line
	3550 4200 3950 4200
Text GLabel 3950 4300 2    50   Input ~ 0
RT_CLK
Wire Wire Line
	3950 4300 3550 4300
Wire Wire Line
	3950 4700 3550 4700
$Comp
L power:GND #PWR011
U 1 1 5DD18035
P 8150 2400
F 0 "#PWR011" H 8150 2150 50  0001 C CNN
F 1 "GND" H 8155 2227 50  0000 C CNN
F 2 "" H 8150 2400 50  0001 C CNN
F 3 "" H 8150 2400 50  0001 C CNN
	1    8150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5550 7400 5550
Wire Wire Line
	7400 5550 7400 5300
$Comp
L Device:R R2
U 1 1 5DD166D6
P 7550 2000
F 0 "R2" V 7343 2000 50  0000 C CNN
F 1 "2.6k" V 7434 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7480 2000 50  0001 C CNN
F 3 "~" H 7550 2000 50  0001 C CNN
	1    7550 2000
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 5DD167B5
P 8150 900
F 0 "#PWR010" H 8150 750 50  0001 C CNN
F 1 "+3.3V" H 8165 1073 50  0000 C CNN
F 2 "" H 8150 900 50  0001 C CNN
F 3 "" H 8150 900 50  0001 C CNN
	1    8150 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 900  8150 1200
Wire Wire Line
	3550 4600 7400 4600
Wire Wire Line
	7400 4600 7400 2000
$Comp
L power:GND #PWR06
U 1 1 5DD1DDB3
P 2950 5300
F 0 "#PWR06" H 2950 5050 50  0001 C CNN
F 1 "GND" V 2955 5172 50  0000 R CNN
F 2 "" H 2950 5300 50  0001 C CNN
F 3 "" H 2950 5300 50  0001 C CNN
	1    2950 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1350 2650 1750
Wire Wire Line
	2650 1750 2650 1800
Connection ~ 2650 1750
Wire Wire Line
	2950 5000 2950 5300
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5DD21AE3
P 5050 2300
F 0 "J2" H 5077 2276 50  0000 L CNN
F 1 "SW2" V 5077 2185 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 5050 2300 50  0001 C CNN
F 3 "~" H 5050 2300 50  0001 C CNN
	1    5050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DD22E34
P 4850 2550
F 0 "#PWR08" H 4850 2300 50  0001 C CNN
F 1 "GND" H 4855 2377 50  0000 C CNN
F 2 "" H 4850 2550 50  0001 C CNN
F 3 "" H 4850 2550 50  0001 C CNN
	1    4850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2400 4850 2550
$Comp
L dw01a:DW01A U3
U 1 1 6212B315
P 4200 6550
F 0 "U3" H 4300 7181 50  0000 C CNN
F 1 "DW01A" H 4300 7090 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 4200 6550 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/1901091236_PUOLOP-DW01A_C351410.pdf" H 4200 6550 50  0001 C CNN
	1    4200 6550
	1    0    0    -1  
$EndComp
$Comp
L fs8205a:FS8205A U2
U 1 1 6212C7A7
P 2600 6450
F 0 "U2" H 2625 6915 50  0000 C CNN
F 1 "FS8205A" H 2625 6824 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 2750 6400 50  0001 C CNN
F 3 "https://datasheetspdf.com/pdf/976676/CanShengIndustry/FS8205A/1" H 2500 6300 50  0001 C CNN
	1    2600 6450
	0    1    1    0   
$EndComp
$Comp
L tp4056:TP4056 IC1
U 1 1 6212BDE6
P 1200 7500
F 0 "IC1" H 1325 8365 50  0000 C CNN
F 1 "TP4056" H 1325 8274 50  0000 C CNN
F 2 "tp4056:TP4056_SOP-8-PP" H 950 7400 50  0001 C CNN
F 3 "" H 1200 7500 50  0001 C CNN
	1    1200 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6900 1000 7000
Text GLabel 800  7250 0    50   Input ~ 0
CHRG
Text GLabel 800  7350 0    50   Input ~ 0
STDBY
Wire Wire Line
	1000 7250 800  7250
Wire Wire Line
	800  7350 1000 7350
Wire Wire Line
	1400 7550 1650 7550
$Comp
L Device:R R7
U 1 1 621504B9
P 1650 7400
F 0 "R7" H 1720 7446 50  0000 L CNN
F 1 "2k" H 1720 7355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1580 7400 50  0001 C CNN
F 3 "~" H 1650 7400 50  0001 C CNN
	1    1650 7400
	1    0    0    -1  
$EndComp
Connection ~ 1650 7550
Wire Wire Line
	1650 7550 1850 7550
Wire Wire Line
	1650 7150 1650 7250
Wire Wire Line
	1650 7050 1850 7050
Wire Wire Line
	1850 7050 1850 7550
$Comp
L Device:C C4
U 1 1 6215486F
P 650 6750
F 0 "C4" H 765 6796 50  0000 L CNN
F 1 "10µF" H 765 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 688 6600 50  0001 C CNN
F 3 "~" H 650 6750 50  0001 C CNN
	1    650  6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 62154FDC
P 1950 7050
F 0 "C5" H 2065 7096 50  0000 L CNN
F 1 "10µF" H 2065 7005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1988 6900 50  0001 C CNN
F 3 "~" H 1950 7050 50  0001 C CNN
	1    1950 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6900 1950 6900
Wire Wire Line
	1950 7200 1950 7550
Wire Wire Line
	1950 7550 1850 7550
Connection ~ 1850 7550
$Comp
L Device:C C6
U 1 1 621648BC
P 3550 6250
F 0 "C6" H 3665 6296 50  0000 L CNN
F 1 "100nF" H 3665 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3588 6100 50  0001 C CNN
F 3 "~" H 3550 6250 50  0001 C CNN
	1    3550 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 6216B3DE
P 3850 6100
F 0 "R8" V 3643 6100 50  0000 C CNN
F 1 "100" V 3734 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3780 6100 50  0001 C CNN
F 3 "~" H 3850 6100 50  0001 C CNN
	1    3850 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 621753FD
P 4000 7200
F 0 "R9" H 4070 7246 50  0000 L CNN
F 1 "1k" H 4070 7155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3930 7200 50  0001 C CNN
F 3 "~" H 4000 7200 50  0001 C CNN
	1    4000 7200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 62175CF8
P 650 5900
F 0 "J6" V 712 5944 50  0000 L CNN
F 1 "USB IN" V 803 5944 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 650 5900 50  0001 C CNN
F 3 "~" H 650 5900 50  0001 C CNN
	1    650  5900
	0    1    1    0   
$EndComp
Wire Wire Line
	650  6900 650  7000
Wire Wire Line
	650  7550 1400 7550
Connection ~ 1400 7550
Wire Wire Line
	2600 6200 2500 6200
Wire Wire Line
	2800 6200 2700 6200
Wire Wire Line
	550  6100 550  7000
Wire Wire Line
	550  7000 650  7000
Connection ~ 650  7000
Wire Wire Line
	650  7000 650  7550
Wire Wire Line
	2800 6750 2700 6750
Wire Wire Line
	1850 6150 1950 6150
Wire Wire Line
	1950 6150 1950 6900
Connection ~ 1950 6900
Text Label 1950 6750 1    50   ~ 0
BATT+
Wire Wire Line
	2500 6050 2500 6200
Connection ~ 2500 6200
Wire Wire Line
	2700 6750 2700 7350
Wire Wire Line
	2700 7550 1950 7550
Connection ~ 2700 6750
Connection ~ 1950 7550
$Comp
L power:GND #PWR0101
U 1 1 62203E3C
P 2900 7550
F 0 "#PWR0101" H 2900 7300 50  0001 C CNN
F 1 "GND" H 2905 7377 50  0000 C CNN
F 2 "" H 2900 7550 50  0001 C CNN
F 3 "" H 2900 7550 50  0001 C CNN
	1    2900 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 7550 2700 7550
Connection ~ 2700 7550
Wire Wire Line
	4250 6100 4000 6100
Wire Wire Line
	3700 6100 3550 6100
Wire Wire Line
	2500 6050 3300 6050
Wire Wire Line
	3300 6050 3300 6400
Wire Wire Line
	3300 6400 3550 6400
Wire Wire Line
	3550 6100 3550 5900
Wire Wire Line
	3550 5900 1950 5900
Connection ~ 3550 6100
Wire Wire Line
	3550 6400 3550 6900
Wire Wire Line
	3550 6900 4300 6900
Connection ~ 3550 6400
NoConn ~ 4000 6450
Wire Wire Line
	4000 7350 2700 7350
Connection ~ 2700 7350
Wire Wire Line
	2700 7350 2700 7550
Wire Wire Line
	4000 7050 4000 6650
Wire Wire Line
	2500 6750 2500 7200
Wire Wire Line
	2500 7200 4950 7200
Wire Wire Line
	4950 7200 4950 6450
Wire Wire Line
	4950 6450 4600 6450
Wire Wire Line
	4600 6650 4900 6650
Wire Wire Line
	4900 6650 4900 7000
Wire Wire Line
	4900 7000 2600 7000
Wire Wire Line
	2600 7000 2600 6750
$Comp
L Device:R R11
U 1 1 6222C8F3
P 10600 4200
F 0 "R11" H 10670 4246 50  0000 L CNN
F 1 "4,7k" H 10670 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10530 4200 50  0001 C CNN
F 3 "~" H 10600 4200 50  0001 C CNN
	1    10600 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 6222DBEE
P 10300 4100
F 0 "R10" H 10370 4146 50  0000 L CNN
F 1 "4,7k" H 10370 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10230 4100 50  0001 C CNN
F 3 "~" H 10300 4100 50  0001 C CNN
	1    10300 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 5DB4EDC0
P 10900 4550
F 0 "J4" H 10873 4430 50  0000 R CNN
F 1 "LCD" H 10873 4521 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 10900 4550 50  0001 C CNN
F 3 "~" H 10900 4550 50  0001 C CNN
	1    10900 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	10700 4650 10550 4650
Wire Wire Line
	10700 4550 10050 4550
Wire Wire Line
	10050 4550 10050 4000
Wire Wire Line
	10050 3400 10050 3450
Wire Wire Line
	10600 4050 10600 3950
Wire Wire Line
	10600 3950 10300 3950
Wire Wire Line
	10300 3950 10300 3450
Wire Wire Line
	10300 3450 10050 3450
Connection ~ 10300 3950
Connection ~ 10050 3450
Wire Wire Line
	10050 3450 10050 3600
Wire Wire Line
	10700 4350 10600 4350
Wire Wire Line
	10700 4450 10300 4450
Wire Wire Line
	10300 4450 10300 4250
Text GLabel 3600 3600 2    50   Input ~ 0
SDA
Text GLabel 3600 3700 2    50   Input ~ 0
SCL
Wire Wire Line
	3600 3600 3550 3600
Wire Wire Line
	3600 3700 3550 3700
Connection ~ 3550 5900
Wire Wire Line
	1000 6900 1000 6600
Wire Wire Line
	1000 6600 650  6600
Connection ~ 1000 6900
Text GLabel 3650 3400 2    50   Input ~ 0
CHRG
Text GLabel 3650 3500 2    50   Input ~ 0
STDBY
$Comp
L power:+3.3V #PWR0102
U 1 1 622A2144
P 3550 5600
F 0 "#PWR0102" H 3550 5450 50  0001 C CNN
F 1 "+3.3V" H 3565 5773 50  0000 C CNN
F 2 "" H 3550 5600 50  0001 C CNN
F 3 "" H 3550 5600 50  0001 C CNN
	1    3550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5600 3550 5900
Connection ~ 1950 6150
Wire Wire Line
	1950 5900 1950 6150
Text Label 2150 6050 0    50   ~ 0
BATT-
Connection ~ 2500 6050
Wire Wire Line
	1850 6050 2500 6050
$Comp
L Device:R R5
U 1 1 62158793
P 650 6350
F 0 "R5" H 720 6396 50  0000 L CNN
F 1 "0.4" H 720 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 580 6350 50  0001 C CNN
F 3 "~" H 650 6350 50  0001 C CNN
	1    650  6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  6100 650  6150
Wire Wire Line
	650  6500 650  6600
Connection ~ 650  6600
Text Label 800  6600 0    50   ~ 0
5V
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 6216C32E
P 5500 5550
F 0 "J5" H 5392 5225 50  0000 C CNN
F 1 "RTC" H 5392 5316 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 5500 5550 50  0001 C CNN
F 3 "~" H 5500 5550 50  0001 C CNN
	1    5500 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 6216C7E3
P 5900 5550
F 0 "#PWR0103" H 5900 5300 50  0001 C CNN
F 1 "GND" H 5905 5377 50  0000 C CNN
F 2 "" H 5900 5550 50  0001 C CNN
F 3 "" H 5900 5550 50  0001 C CNN
	1    5900 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0104
U 1 1 6216CB05
P 5900 5450
F 0 "#PWR0104" H 5900 5300 50  0001 C CNN
F 1 "+3V3" H 5915 5623 50  0000 C CNN
F 2 "" H 5900 5450 50  0001 C CNN
F 3 "" H 5900 5450 50  0001 C CNN
	1    5900 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5450 5700 5450
Wire Wire Line
	5700 5550 5900 5550
Wire Wire Line
	3650 3400 3550 3400
Wire Wire Line
	3550 3500 3650 3500
$Comp
L Transistor_BJT:BC817 Q1
U 1 1 6216DA2D
P 8050 2000
F 0 "Q1" H 8241 2046 50  0000 L CNN
F 1 "BC817" H 8241 1955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8250 1925 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC818-D.pdf" H 8050 2000 50  0001 L CNN
	1    8050 2000
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC817 Q2
U 1 1 6217B359
P 9100 3850
F 0 "Q2" H 9291 3896 50  0000 L CNN
F 1 "BC817" H 9291 3805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9300 3775 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC818-D.pdf" H 9100 3850 50  0001 L CNN
	1    9100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3550 9200 3550
Wire Wire Line
	9200 3550 9200 3650
Wire Wire Line
	9200 4050 9200 4300
Wire Wire Line
	8900 3850 8700 3850
$Comp
L Transistor_BJT:BC807 Q3
U 1 1 621886E1
P 10150 3800
F 0 "Q3" H 10341 3754 50  0000 L CNN
F 1 "BC807" H 10341 3845 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10350 3725 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC808-D.pdf" H 10150 3800 50  0001 L CNN
	1    10150 3800
	-1   0    0    1   
$EndComp
Text Label 3650 3800 0    50   ~ 0
RST
Text Label 5500 4600 0    50   ~ 0
BUZ
Wire Wire Line
	10300 4450 9550 4450
Connection ~ 10300 4450
Wire Wire Line
	9550 4350 10600 4350
Connection ~ 10600 4350
Wire Wire Line
	8150 1400 8150 1800
Wire Wire Line
	7850 2000 7700 2000
Wire Wire Line
	8150 2200 8150 2400
Wire Wire Line
	4850 2300 3550 2300
Wire Wire Line
	3850 4500 3550 4500
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 62201DFF
P 9900 5000
F 0 "J7" H 9872 4882 50  0000 R CNN
F 1 "Conn_01x02_Male" H 9872 4973 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 9900 5000 50  0001 C CNN
F 3 "~" H 9900 5000 50  0001 C CNN
	1    9900 5000
	-1   0    0    1   
$EndComp
Text GLabel 9550 4900 0    50   Input ~ 0
SCL
Text GLabel 9550 5000 0    50   Input ~ 0
SDA
Wire Wire Line
	9700 4900 9550 4900
Wire Wire Line
	9550 5000 9700 5000
$Comp
L Mechanical:MountingHole H1
U 1 1 626484AA
P 5950 6500
F 0 "H1" H 6050 6546 50  0000 L CNN
F 1 "MountingHole" H 6050 6455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5950 6500 50  0001 C CNN
F 3 "~" H 5950 6500 50  0001 C CNN
	1    5950 6500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 626486EF
P 5950 6700
F 0 "H2" H 6050 6746 50  0000 L CNN
F 1 "MountingHole" H 6050 6655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5950 6700 50  0001 C CNN
F 3 "~" H 5950 6700 50  0001 C CNN
	1    5950 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:R 20k1
U 1 1 62656B01
P 1350 4900
F 0 "20k1" H 1420 4946 50  0000 L CNN
F 1 "R" H 1420 4855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1280 4900 50  0001 C CNN
F 3 "~" H 1350 4900 50  0001 C CNN
	1    1350 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R 10k1
U 1 1 62656BB2
P 1350 5350
F 0 "10k1" H 1420 5396 50  0000 L CNN
F 1 "R" H 1420 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1280 5350 50  0001 C CNN
F 3 "~" H 1350 5350 50  0001 C CNN
	1    1350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  6150 1100 6150
Wire Wire Line
	1100 6150 1100 4750
Wire Wire Line
	1100 4750 1350 4750
Connection ~ 650  6150
Wire Wire Line
	650  6150 650  6200
Wire Wire Line
	1350 5050 1350 5100
$Comp
L power:GND #PWR0105
U 1 1 6265FCF4
P 1350 5550
F 0 "#PWR0105" H 1350 5300 50  0001 C CNN
F 1 "GND" H 1355 5377 50  0000 C CNN
F 2 "" H 1350 5550 50  0001 C CNN
F 3 "" H 1350 5550 50  0001 C CNN
	1    1350 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5500 1350 5550
Wire Wire Line
	1350 5100 5150 5100
Wire Wire Line
	5150 5100 5150 3200
Wire Wire Line
	5150 3200 3550 3200
Connection ~ 1350 5100
Wire Wire Line
	1350 5100 1350 5200
$EndSCHEMATC
