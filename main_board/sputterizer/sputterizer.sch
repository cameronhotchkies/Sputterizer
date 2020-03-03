EESchema Schematic File Version 4
LIBS:sputterizer-cache
EELAYER 29 0
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
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5CDEC8C4
P 4500 2900
F 0 "A1" H 4331 1811 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4500 1720 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4650 1950 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4500 1900 50  0001 C CNN
F 4 "1050-1001-ND" H 4500 2900 50  0001 C CNN "Digi-Key Part"
	1    4500 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_US RV1
U 1 1 5CDED4B8
P 5850 2900
F 0 "RV1" H 5782 2854 50  0000 R CNN
F 1 "10K" H 5782 2945 50  0000 R CNN
F 2 "panel:Potentiometer_Bourns_PTD901_Single_Horizontal" H 5850 2900 50  0001 C CNN
F 3 "~" H 5850 2900 50  0001 C CNN
F 4 "PTD901-1015K-B103-ND" H 5850 2900 50  0001 C CNN "Digi-Key Part"
	1    5850 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT_US RV2
U 1 1 5CDF01D7
P 6550 2900
F 0 "RV2" H 6482 2854 50  0000 R CNN
F 1 "10K" H 6482 2945 50  0000 R CNN
F 2 "panel:Potentiometer_Bourns_PTD901_Single_Horizontal" H 6550 2900 50  0001 C CNN
F 3 "~" H 6550 2900 50  0001 C CNN
F 4 "PTD901-1015K-B103-ND" H 6550 2900 50  0001 C CNN "Digi-Key Part"
	1    6550 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT_US RV3
U 1 1 5CDF0A3B
P 7250 2900
F 0 "RV3" H 7182 2854 50  0000 R CNN
F 1 "10K" H 7182 2945 50  0000 R CNN
F 2 "panel:Potentiometer_Bourns_PTD901_Single_Horizontal" H 7250 2900 50  0001 C CNN
F 3 "~" H 7250 2900 50  0001 C CNN
F 4 "PTD901-1015K-B103-ND" H 7250 2900 50  0001 C CNN "Digi-Key Part"
	1    7250 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 2900 5700 2900
$Comp
L power:GND #PWR0101
U 1 1 5CDF1C71
P 5300 4100
F 0 "#PWR0101" H 5300 3850 50  0001 C CNN
F 1 "GND" H 5305 3927 50  0000 C CNN
F 2 "" H 5300 4100 50  0001 C CNN
F 3 "" H 5300 4100 50  0001 C CNN
	1    5300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3050 6550 3150
Wire Wire Line
	6550 3150 7250 3150
Connection ~ 7250 3150
Wire Wire Line
	7250 3150 7250 3050
Wire Wire Line
	5850 3050 5850 3150
Wire Wire Line
	5850 3150 6550 3150
Connection ~ 6550 3150
Wire Wire Line
	4500 3900 4500 3950
Wire Wire Line
	4500 3950 4600 3950
Connection ~ 7250 3950
Wire Wire Line
	7250 3950 7250 3150
Wire Wire Line
	4600 3900 4600 3950
Connection ~ 4600 3950
Wire Wire Line
	4600 3950 5300 3950
Wire Wire Line
	5850 2750 5850 1800
Wire Wire Line
	5850 1800 5100 1800
Wire Wire Line
	4700 1800 4700 1900
Wire Wire Line
	6550 2750 6550 1800
Wire Wire Line
	6550 1800 5850 1800
Connection ~ 5850 1800
Wire Wire Line
	7250 1800 6550 1800
Connection ~ 6550 1800
Wire Wire Line
	7250 1800 7250 2750
Wire Wire Line
	6400 2900 6250 2900
Wire Wire Line
	6250 2900 6250 3300
Wire Wire Line
	6250 3300 5000 3300
Wire Wire Line
	7100 2900 6800 2900
Wire Wire Line
	6800 2900 6800 3400
Wire Wire Line
	6800 3400 5000 3400
$Comp
L Device:R_Small_US R1
U 1 1 5CE0A0B6
P 1500 5100
F 0 "R1" V 1300 5100 50  0000 C CNN
F 1 "10K" V 1386 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 1500 5100 50  0001 C CNN
F 3 "~" H 1500 5100 50  0001 C CNN
F 4 "CF14JT10K0CT-ND" V 1500 5100 50  0001 C CNN "Digi-Key Part"
	1    1500 5100
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D1
U 1 1 5CE0DE0C
P 1650 4750
F 0 "D1" V 1550 4600 50  0000 L CNN
F 1 "SB120" V 1650 4450 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 1650 4575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 1650 4750 50  0001 C CNN
F 4 "1N4148-TPMSCT-ND" V 1650 4750 50  0001 C CNN "Digi-Key Part"
	1    1650 4750
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D2
U 1 1 5CE0FA7F
P 1650 5400
F 0 "D2" V 1550 5200 50  0000 L CNN
F 1 "SB120" V 1650 5100 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 1650 5225 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 1650 5400 50  0001 C CNN
F 4 "1N4148-TPMSCT-ND" V 1650 5400 50  0001 C CNN "Digi-Key Part"
	1    1650 5400
	0    1    1    0   
$EndComp
Connection ~ 4500 3950
Text Notes 5100 2900 0    50   ~ 0
Length
Text Notes 5100 3300 0    50   ~ 0
Decay
Text Notes 5100 3400 0    50   ~ 0
Randomness
Text Notes 1600 2700 0    50   ~ 0
Trig In
$Comp
L Device:R_Small_US R2
U 1 1 5CE176A7
P 9050 2450
F 0 "R2" V 8845 2450 50  0000 C CNN
F 1 "470" V 8936 2450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 9050 2450 50  0001 C CNN
F 3 "~" H 9050 2450 50  0001 C CNN
F 4 "CF14JT470RCT-ND" V 9050 2450 50  0001 C CNN "Digi-Key Part"
	1    9050 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 1400 7650 1400
Wire Wire Line
	7650 1400 7650 2450
Wire Wire Line
	7650 2450 8300 2450
Wire Wire Line
	9150 2450 9500 2450
Wire Wire Line
	9500 2650 9350 2650
Wire Wire Line
	9350 2650 9350 3950
Wire Wire Line
	9350 3950 8300 3950
$Comp
L Diode:1N4148 D3
U 1 1 5CE2C30E
P 8300 2150
F 0 "D3" V 8254 2229 50  0000 L CNN
F 1 "SB120" V 8345 2229 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8300 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8300 2150 50  0001 C CNN
F 4 "1N4148-TPMSCT-ND" V 8300 2150 50  0001 C CNN "Digi-Key Part"
	1    8300 2150
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D4
U 1 1 5CE2DC02
P 8300 2750
F 0 "D4" V 8254 2829 50  0000 L CNN
F 1 "SB120" V 8345 2829 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8300 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8300 2750 50  0001 C CNN
F 4 "1N4148-TPMSCT-ND" V 8300 2750 50  0001 C CNN "Digi-Key Part"
	1    8300 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 1800 8300 2000
Wire Wire Line
	8300 2300 8300 2450
Connection ~ 8300 2450
Wire Wire Line
	8300 2450 8950 2450
Wire Wire Line
	8300 2600 8300 2450
Wire Wire Line
	8300 2900 8300 3950
Connection ~ 8300 3950
Wire Wire Line
	8300 3950 7250 3950
$Comp
L Device:R_Small_US R3
U 1 1 5CE381ED
P 9150 4850
F 0 "R3" V 8945 4850 50  0000 C CNN
F 1 "470" V 9036 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 9150 4850 50  0001 C CNN
F 3 "~" H 9150 4850 50  0001 C CNN
F 4 "CF14JT470RCT-ND" V 9150 4850 50  0001 C CNN "Digi-Key Part"
	1    9150 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 5050 9400 5550
$Comp
L Amplifier_Operational:NE5532 U1
U 1 1 5CE45136
P 6700 4850
F 0 "U1" H 6700 4550 50  0000 C CNN
F 1 "NE5532" H 6750 4650 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6700 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 6700 4850 50  0001 C CNN
F 4 "296-16995-5-ND" H 6700 4850 50  0001 C CNN "Digi-Key Part"
	1    6700 4850
	1    0    0    1   
$EndComp
Wire Wire Line
	7000 4850 7150 4850
Wire Wire Line
	6400 4750 6250 4750
Wire Wire Line
	6250 4300 7150 4300
Wire Wire Line
	7150 4300 7150 4850
$Comp
L Device:R_Small_US R6
U 1 1 5CE4FA2C
P 6000 4950
F 0 "R6" V 5795 4950 50  0000 C CNN
F 1 "15.8K" V 5886 4950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 6000 4950 50  0001 C CNN
F 3 "~" H 6000 4950 50  0001 C CNN
F 4 "BC4574CT-ND" V 6000 4950 50  0001 C CNN "Digi-Key Part"
	1    6000 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 4950 6250 4950
Wire Wire Line
	5700 4950 5750 4950
Wire Wire Line
	6250 5150 6250 4950
Connection ~ 6250 4950
Wire Wire Line
	6250 4950 6400 4950
$Comp
L Device:C_Small C9
U 1 1 5CE5830E
P 4500 4650
F 0 "C9" H 4592 4696 50  0000 L CNN
F 1 "100nF" H 4592 4605 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W2.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 4500 4650 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_F3101_R82.pdf" H 4500 4650 50  0001 C CNN
F 4 "399-5444-1-ND" H 4500 4650 50  0001 C CNN "Digi-Key Part"
	1    4500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5050 4900 5050
Wire Wire Line
	4900 5050 4900 5200
$Comp
L Device:R_Small_US R5
U 1 1 5CE602D5
P 4700 5050
F 0 "R5" V 4495 5050 50  0000 C CNN
F 1 "140K" V 4586 5050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4700 5050 50  0001 C CNN
F 3 "~" H 4700 5050 50  0001 C CNN
F 4 "BC3995CT-ND" V 4700 5050 50  0001 C CNN "Digi-Key Part"
	1    4700 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R4
U 1 1 5CE60DE5
P 4300 5050
F 0 "R4" V 4095 5050 50  0000 C CNN
F 1 "17.8K" V 4186 5050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 5050 50  0001 C CNN
F 3 "~" H 4300 5050 50  0001 C CNN
F 4 "PPC17.8KXCT-ND" V 4300 5050 50  0001 C CNN "Digi-Key Part"
	1    4300 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 4950 5750 4450
Wire Wire Line
	5750 4450 5000 4450
Wire Wire Line
	5000 4450 5000 4850
Wire Wire Line
	5000 4850 5100 4850
Connection ~ 5750 4950
Wire Wire Line
	5750 4950 5900 4950
Wire Wire Line
	4500 4550 4500 4450
Wire Wire Line
	4500 4450 5000 4450
Connection ~ 5000 4450
Wire Wire Line
	4400 5050 4500 5050
Wire Wire Line
	4500 4750 4500 5050
Connection ~ 4500 5050
Wire Wire Line
	4500 5050 4600 5050
Wire Wire Line
	4800 5050 4900 5050
Connection ~ 4900 5050
Wire Wire Line
	3950 5050 4200 5050
Wire Wire Line
	4900 5550 4900 5400
Wire Wire Line
	4900 5550 6250 5550
Wire Wire Line
	6250 5350 6250 5550
Connection ~ 6250 5550
$Comp
L Transistor_FET:BS170 Q1
U 1 1 5CE19859
P 8850 1400
F 0 "Q1" H 9056 1446 50  0000 L CNN
F 1 "BS170" H 9056 1355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9050 1325 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BS/BS170.pdf" H 8850 1400 50  0001 L CNN
F 4 "BS170-D75ZCT-ND" H 8850 1400 50  0001 C CNN "Digi-Key Part"
	1    8850 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1400 8650 1400
Connection ~ 7650 1400
$Comp
L power:GND #PWR0105
U 1 1 5CE1F751
P 8950 1700
F 0 "#PWR0105" H 8950 1450 50  0001 C CNN
F 1 "GND" H 8955 1527 50  0000 C CNN
F 2 "" H 8950 1700 50  0001 C CNN
F 3 "" H 8950 1700 50  0001 C CNN
	1    8950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1700 8950 1600
$Comp
L Device:LED D7
U 1 1 5CE270EB
P 8950 950
F 0 "D7" V 8989 833 50  0000 R CNN
F 1 "GREEN LED" V 8898 833 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 8950 950 50  0001 C CNN
F 3 "https://katalog.we-online.de/led/datasheet/151031SS04000.pdf" H 8950 950 50  0001 C CNN
F 4 "732-5008-ND" V 8950 950 50  0001 C CNN "Digi-Key Part"
	1    8950 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R7
U 1 1 5CE28EA8
P 8550 750
F 0 "R7" V 8345 750 50  0000 C CNN
F 1 "1K" V 8436 750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8550 750 50  0001 C CNN
F 3 "~" H 8550 750 50  0001 C CNN
F 4 "CF14JT1K00CT-ND" V 8550 750 50  0001 C CNN "Digi-Key Part"
	1    8550 750 
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5CE2A2A2
P 8150 700
F 0 "#PWR0106" H 8150 550 50  0001 C CNN
F 1 "+5V" H 8165 873 50  0000 C CNN
F 2 "" H 8150 700 50  0001 C CNN
F 3 "" H 8150 700 50  0001 C CNN
	1    8150 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 700  8150 750 
Wire Wire Line
	8150 750  8450 750 
Wire Wire Line
	8650 750  8950 750 
Wire Wire Line
	8950 750  8950 800 
Wire Wire Line
	8950 1100 8950 1200
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J4
U 1 1 5CE4CAA3
P 2850 6650
F 0 "J4" V 2946 6162 50  0000 R CNN
F 1 "2X8 Header" V 2855 6162 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 2850 6650 50  0001 C CNN
F 3 "~" H 2850 6650 50  0001 C CNN
F 4 "S2011EC-08-ND" V 2850 6650 50  0001 C CNN "Digi-Key Part"
	1    2850 6650
	0    -1   -1   0   
$EndComp
$Comp
L power:-12V #PWR0107
U 1 1 5CE5916D
P 2550 7200
F 0 "#PWR0107" H 2550 7300 50  0001 C CNN
F 1 "-12V" H 2565 7373 50  0000 C CNN
F 2 "" H 2550 7200 50  0001 C CNN
F 3 "" H 2550 7200 50  0001 C CNN
	1    2550 7200
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 5CE59BC5
P 2950 6050
F 0 "#PWR0108" H 2950 5900 50  0001 C CNN
F 1 "+12V" H 2965 6223 50  0000 C CNN
F 2 "" H 2950 6050 50  0001 C CNN
F 3 "" H 2950 6050 50  0001 C CNN
	1    2950 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6850 2550 6900
Wire Wire Line
	2550 6350 2400 6350
Wire Wire Line
	2400 6350 2400 6900
Wire Wire Line
	2400 6900 2550 6900
Connection ~ 2550 6900
Wire Wire Line
	2550 6900 2550 7150
Wire Wire Line
	2950 6350 2950 6200
Wire Wire Line
	2950 6850 2950 7000
Wire Wire Line
	2950 7000 2200 7000
Wire Wire Line
	2200 7000 2200 6200
Wire Wire Line
	2200 6200 2950 6200
Connection ~ 2950 6200
Wire Wire Line
	2950 6200 2950 6050
Wire Wire Line
	2850 6350 2850 6300
Wire Wire Line
	2850 6300 2750 6300
Wire Wire Line
	2750 6300 2750 6350
Wire Wire Line
	2750 6300 2650 6300
Wire Wire Line
	2650 6300 2650 6350
Connection ~ 2750 6300
Wire Wire Line
	2650 6300 2300 6300
Wire Wire Line
	2300 6300 2300 6550
Wire Wire Line
	2300 6950 2650 6950
Connection ~ 2650 6300
$Comp
L power:GND #PWR0109
U 1 1 5CE9AD0B
P 2750 7200
F 0 "#PWR0109" H 2750 6950 50  0001 C CNN
F 1 "GND" H 2755 7027 50  0000 C CNN
F 2 "" H 2750 7200 50  0001 C CNN
F 3 "" H 2750 7200 50  0001 C CNN
	1    2750 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 6850 2850 6950
Wire Wire Line
	2750 6850 2750 6950
Connection ~ 2750 6950
Wire Wire Line
	2850 6950 2750 6950
Wire Wire Line
	2650 6850 2650 6950
Connection ~ 2650 6950
Wire Wire Line
	2650 6950 2750 6950
$Comp
L Device:C_Small C2
U 1 1 5CECA0CE
P 1700 6350
F 0 "C2" H 1792 6396 50  0000 L CNN
F 1 "100nF" H 1792 6305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W3.5mm_P5.00mm" H 1700 6350 50  0001 C CNN
F 3 "http://datasheets.avx.com/SR-Series.pdf" H 1700 6350 50  0001 C CNN
F 4 "478-2472-ND" H 1700 6350 50  0001 C CNN "Digi-Key Part"
	1    1700 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C6
U 1 1 5CECC3A3
P 4050 6800
F 0 "C6" H 4141 6846 50  0000 L CNN
F 1 "100uF" H 4141 6755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 4050 6800 50  0001 C CNN
F 3 "~" H 4050 6800 50  0001 C CNN
F 4 "1189-3982-ND" H 4050 6800 50  0001 C CNN "Digi-Key Part"
	1    4050 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C1
U 1 1 5CEE41D1
P 1250 6350
F 0 "C1" H 1341 6396 50  0000 L CNN
F 1 "100uF" H 1341 6305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 1250 6350 50  0001 C CNN
F 3 "http://www.rubycon.co.jp/en/catalog/e_pdfs/aluminum/e_ml.pdf" H 1250 6350 50  0001 C CNN
F 4 "1189-3982-ND" H 1250 6350 50  0001 C CNN "Digi-Key Part"
	1    1250 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C3
U 1 1 5CEE5092
P 1250 6700
F 0 "C3" H 1341 6746 50  0000 L CNN
F 1 "100uF" H 1341 6655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 1250 6700 50  0001 C CNN
F 3 "~" H 1250 6700 50  0001 C CNN
F 4 "1189-3982-ND" H 1250 6700 50  0001 C CNN "Digi-Key Part"
	1    1250 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6250 1250 6200
Wire Wire Line
	1250 6200 1700 6200
Connection ~ 2200 6200
Wire Wire Line
	1700 6250 1700 6200
Connection ~ 1700 6200
Wire Wire Line
	1700 6200 2200 6200
Wire Wire Line
	1250 6450 1250 6550
Wire Wire Line
	1700 6450 1700 6550
Wire Wire Line
	1250 6800 1250 7150
Wire Wire Line
	1250 7150 1700 7150
Connection ~ 2550 7150
Wire Wire Line
	2550 7150 2550 7200
Wire Wire Line
	1700 6800 1700 7150
Connection ~ 1700 7150
Wire Wire Line
	1700 7150 2550 7150
Wire Wire Line
	1250 6550 1700 6550
Connection ~ 1250 6550
Wire Wire Line
	1250 6550 1250 6600
Connection ~ 1700 6550
Wire Wire Line
	1700 6550 1700 6600
Wire Wire Line
	2300 6550 1700 6550
Connection ~ 2300 6550
Wire Wire Line
	2300 6550 2300 6950
Wire Wire Line
	3550 6550 3550 6700
Wire Wire Line
	3550 6550 4050 6550
Wire Wire Line
	4050 6550 4050 6700
Wire Wire Line
	3550 7150 3550 6900
Wire Wire Line
	3550 7150 4050 7150
Wire Wire Line
	4050 7150 4050 6900
$Comp
L Device:R_Small_US R8
U 1 1 5CFBFDE0
P 3350 3650
F 0 "R8" H 3500 3650 50  0000 C CNN
F 1 "20K" H 3200 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3350 3650 50  0001 C CNN
F 3 "~" H 3350 3650 50  0001 C CNN
F 4 "CF14JT20K0CT-ND" V 3350 3650 50  0001 C CNN "Digi-Key Part"
	1    3350 3650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J5
U 1 1 5D1B699A
P 1300 3350
F 0 "J5" H 1350 3675 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 1350 3676 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 1300 3350 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/67996.pdf" H 1300 3350 50  0001 C CNN
F 4 "609-3236-ND" H 1300 3350 50  0001 C CNN "Digi-Key Part"
	1    1300 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5D1B7DF3
P 1100 3150
F 0 "#PWR0104" H 1100 3000 50  0001 C CNN
F 1 "+5V" H 1115 3323 50  0000 C CNN
F 2 "" H 1100 3150 50  0001 C CNN
F 3 "" H 1100 3150 50  0001 C CNN
	1    1100 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3950 1600 3550
Wire Wire Line
	1100 3450 800  3450
Wire Wire Line
	1600 3450 2850 3450
Wire Wire Line
	4000 2600 2850 2600
Wire Wire Line
	2850 2600 2850 3450
Wire Wire Line
	650  3550 1100 3550
Wire Wire Line
	800  3450 800  2500
Wire Wire Line
	1100 3350 900  3350
Wire Wire Line
	900  3350 900  2800
Wire Wire Line
	900  2800 4000 2800
Wire Wire Line
	1100 3250 1000 3250
Wire Wire Line
	1000 3250 1000 2900
Wire Wire Line
	1000 2900 4000 2900
Wire Wire Line
	1600 3150 2200 3150
Wire Wire Line
	2200 3150 2200 3000
Wire Wire Line
	2200 3000 4000 3000
Wire Wire Line
	1600 3250 2300 3250
Wire Wire Line
	2300 3250 2300 3100
Wire Wire Line
	2300 3100 4000 3100
Wire Wire Line
	3900 1400 3900 3600
Wire Wire Line
	3900 3600 4000 3600
Wire Wire Line
	1600 3350 2400 3350
Wire Wire Line
	2400 3350 2400 3200
Wire Wire Line
	2400 3200 4000 3200
Wire Wire Line
	3950 3400 3950 5050
Wire Wire Line
	800  2500 4000 2500
$Comp
L Device:C_Small C4
U 1 1 5D2F9F59
P 1700 6700
F 0 "C4" H 1792 6746 50  0000 L CNN
F 1 "100nF" H 1792 6655 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W3.5mm_P5.00mm" H 1700 6700 50  0001 C CNN
F 3 "http://datasheets.avx.com/SR-Series.pdf" H 1700 6700 50  0001 C CNN
F 4 "478-2472-ND" H 1700 6700 50  0001 C CNN "Digi-Key Part"
	1    1700 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5D306F44
P 3550 6800
F 0 "C5" H 3642 6846 50  0000 L CNN
F 1 "100nF" H 3642 6755 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W3.5mm_P5.00mm" H 3550 6800 50  0001 C CNN
F 3 "http://datasheets.avx.com/SR-Series.pdf" H 3550 6800 50  0001 C CNN
F 4 "478-2472-ND" H 3550 6800 50  0001 C CNN "Digi-Key Part"
	1    3550 6800
	1    0    0    -1  
$EndComp
Text Notes 1600 3150 0    50   ~ 0
SDI
Text Notes 1600 3250 0    50   ~ 0
LE
Text Notes 1600 3350 0    50   ~ 0
SDO
Text Notes 1600 3450 0    50   ~ 0
A
Text Notes 1600 2500 0    50   ~ 0
B
Text Notes 1600 2800 0    50   ~ 0
OE
Text Notes 1600 2900 0    50   ~ 0
CLK
$Comp
L Device:C_Small C7
U 1 1 5D30DA53
P 4900 5300
F 0 "C7" H 4992 5346 50  0000 L CNN
F 1 "10nF" H 4992 5255 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W2.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 4900 5300 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_F3101_R82.pdf" H 4900 5300 50  0001 C CNN
F 4 "399-5450-1-ND" H 4900 5300 50  0001 C CNN "Digi-Key Part"
	1    4900 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5D30E24E
P 6250 5250
F 0 "C8" H 6342 5296 50  0000 L CNN
F 1 "100nF" H 6342 5205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W2.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 6250 5250 50  0001 C CNN
F 3 "https://content.kemet.com/datasheets/KEM_F3101_R82.pdf" H 6250 5250 50  0001 C CNN
F 4 "399-5444-1-ND" H 6250 5250 50  0001 C CNN "Digi-Key Part"
	1    6250 5250
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:NE5532 U1
U 2 1 5CE31F97
P 5400 4950
F 0 "U1" H 5400 4583 50  0000 C CNN
F 1 "NE5532" H 5400 4674 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5400 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 5400 4950 50  0001 C CNN
F 4 "296-16995-5-ND" H 5400 4950 50  0001 C CNN "Digi-Key Part"
	2    5400 4950
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:NE5532 U1
U 3 1 5CE75E37
P 6700 4850
F 0 "U1" H 6800 4750 50  0001 L CNN
F 1 "NE5532" H 6850 4600 50  0001 L CNN
F 2 "" H 6700 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 6700 4850 50  0001 C CNN
	3    6700 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0112
U 1 1 5CE81436
P 6600 4550
F 0 "#PWR0112" H 6600 4400 50  0001 C CNN
F 1 "+12V" H 6615 4723 50  0000 C CNN
F 2 "" H 6600 4550 50  0001 C CNN
F 3 "" H 6600 4550 50  0001 C CNN
	1    6600 4550
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR0113
U 1 1 5CE826B0
P 6600 5150
F 0 "#PWR0113" H 6600 5250 50  0001 C CNN
F 1 "-12V" H 6600 5350 50  0000 C CNN
F 2 "" H 6600 5150 50  0001 C CNN
F 3 "" H 6600 5150 50  0001 C CNN
	1    6600 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 4300 6250 4750
$Comp
L Device:R_Small_US R10
U 1 1 5CF2AFAF
P 8250 4300
F 0 "R10" V 8455 4300 50  0000 C CNN
F 1 "10.0K" V 8364 4300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8250 4300 50  0001 C CNN
F 3 "~" H 8250 4300 50  0001 C CNN
F 4 "BC3326CT-ND" V 8250 4300 50  0001 C CNN "Digi-Key Part"
	1    8250 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small_US R9
U 1 1 5CF2C8C5
P 7500 4300
F 0 "R9" V 7705 4300 50  0000 C CNN
F 1 "10.0K" V 7614 4300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7500 4300 50  0001 C CNN
F 3 "~" H 7500 4300 50  0001 C CNN
F 4 "BC3326CT-ND" V 7500 4300 50  0001 C CNN "Digi-Key Part"
	1    7500 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 4300 7700 4300
Wire Wire Line
	8350 4300 8500 4300
Wire Wire Line
	8500 4300 8500 4850
Wire Wire Line
	8500 4850 8350 4850
Connection ~ 8500 4850
Wire Wire Line
	7150 4850 7150 4950
Wire Wire Line
	7150 4950 7750 4950
Connection ~ 7150 4850
Wire Wire Line
	7750 4750 7700 4750
Wire Wire Line
	7700 4750 7700 4300
Connection ~ 7700 4300
Wire Wire Line
	7700 4300 8150 4300
$Comp
L power:+5V #PWR01
U 1 1 5CF6D43C
P 7400 4300
F 0 "#PWR01" H 7400 4150 50  0001 C CNN
F 1 "+5V" H 7415 4473 50  0000 C CNN
F 2 "" H 7400 4300 50  0001 C CNN
F 3 "" H 7400 4300 50  0001 C CNN
	1    7400 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 4100 5300 3950
Connection ~ 5300 3950
Wire Wire Line
	5300 3950 7250 3950
$Comp
L Amplifier_Operational:NE5532 U2
U 3 1 5CF9A4D6
P 8050 4850
F 0 "U2" H 8008 4896 50  0001 L CNN
F 1 "NE5532" H 8008 4850 50  0001 L CNN
F 2 "" H 8050 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 8050 4850 50  0001 C CNN
F 4 "" H 8050 4850 50  0001 C CNN "Digi-Key Part"
	3    8050 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0114
U 1 1 5CF9D91F
P 7950 4550
F 0 "#PWR0114" H 7950 4400 50  0001 C CNN
F 1 "+12V" H 7965 4723 50  0000 C CNN
F 2 "" H 7950 4550 50  0001 C CNN
F 3 "" H 7950 4550 50  0001 C CNN
	1    7950 4550
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR0115
U 1 1 5CF9EC40
P 7950 5150
F 0 "#PWR0115" H 7950 5250 50  0001 C CNN
F 1 "-12V" H 7965 5323 50  0000 C CNN
F 2 "" H 7950 5150 50  0001 C CNN
F 3 "" H 7950 5150 50  0001 C CNN
	1    7950 5150
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:NE5532 U2
U 2 1 5CFB1A8E
P 6350 7300
F 0 "U2" H 6400 7500 50  0000 C CNN
F 1 "NE5532" H 6500 7600 50  0000 C CNN
F 2 "" H 6350 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 6350 7300 50  0001 C CNN
	2    6350 7300
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:NE5532 U2
U 1 1 5CF1C098
P 8050 4850
F 0 "U2" H 8050 4550 50  0000 C CNN
F 1 "NE5532" H 8100 4650 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 8050 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne5532.pdf" H 8050 4850 50  0001 C CNN
F 4 "296-16995-5-ND" H 8050 4850 50  0001 C CNN "Digi-Key Part"
	1    8050 4850
	1    0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male JP1
U 1 1 5CFD18BE
P 7350 6150
F 0 "JP1" V 7504 5962 50  0000 R CNN
F 1 "Conn_01x02_Male" V 7413 5962 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7350 6150 50  0001 C CNN
F 3 "~" H 7350 6150 50  0001 C CNN
F 4 "952-2261-ND" V 7350 6150 50  0001 C CNN "Digi-Key Part"
	1    7350 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7450 5950 7450 5900
Wire Wire Line
	7450 5900 8500 5900
Wire Wire Line
	8500 5900 8500 4850
$Comp
L Connector:Conn_01x02_Male JP2
U 1 1 5D010D47
P 7650 3200
F 0 "JP2" V 7804 3012 50  0000 R CNN
F 1 "Conn_01x02_Male" V 7713 3012 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7650 3200 50  0001 C CNN
F 3 "~" H 7650 3200 50  0001 C CNN
F 4 "952-2261-ND" V 7650 3200 50  0001 C CNN "Digi-Key Part"
	1    7650 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 2450 7650 3000
Connection ~ 7650 2450
Wire Wire Line
	7750 2850 7750 3000
Text Label 7750 2850 0    50   ~ 0
Gate
Text Label 3250 6350 0    50   ~ 0
Gate
Text Label 3250 6850 0    50   ~ 0
Gate
Text Label 3650 5900 0    50   ~ 0
CV
Text Label 3150 6350 0    50   ~ 0
CV
Wire Wire Line
	3950 3400 4000 3400
$Comp
L Connector:TestPoint TP1
U 1 1 5D129D3E
P 750 6450
F 0 "TP1" H 808 6568 50  0000 L CNN
F 1 "TestPoint" H 808 6477 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5005-5009_Compact" H 950 6450 50  0001 C CNN
F 3 "~" H 950 6450 50  0001 C CNN
F 4 "36-5006-ND" H 750 6450 50  0001 C CNN "Digi-Key Part"
	1    750  6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  6450 750  6550
Wire Wire Line
	750  6550 1250 6550
$Comp
L Connector:Conn_01x02_Male JP3
U 1 1 5D04B7B1
P 5350 2300
F 0 "JP3" V 5504 2112 50  0000 R CNN
F 1 "Conn_01x02_Male" V 5413 2112 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5350 2300 50  0001 C CNN
F 3 "~" H 5350 2300 50  0001 C CNN
F 4 "952-2261-ND" V 5350 2300 50  0001 C CNN "Digi-Key Part"
	1    5350 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 1800 5100 2200
Wire Wire Line
	5100 2200 5150 2200
Text Notes 5150 2500 0    50   ~ 0
short to prevent \nprogramming
$Comp
L power:+12V #PWR02
U 1 1 5D093104
P 4400 1650
F 0 "#PWR02" H 4400 1500 50  0001 C CNN
F 1 "+12V" H 4415 1823 50  0000 C CNN
F 2 "" H 4400 1650 50  0001 C CNN
F 3 "" H 4400 1650 50  0001 C CNN
	1    4400 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 5D12A401
P 4050 6400
F 0 "#PWR0116" H 4050 6250 50  0001 C CNN
F 1 "+5V" H 4065 6573 50  0000 C CNN
F 2 "" H 4050 6400 50  0001 C CNN
F 3 "" H 4050 6400 50  0001 C CNN
	1    4050 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6400 4050 6550
Connection ~ 4050 6550
Wire Wire Line
	5000 2300 5150 2300
Wire Wire Line
	6250 5550 9400 5550
Wire Wire Line
	8500 4850 9050 4850
Wire Wire Line
	4400 1650 4400 1900
Text Notes 4300 4700 0    50   ~ 0
5%
Text Notes 4700 5350 0    50   ~ 0
5%
Text Notes 6050 5300 0    50   ~ 0
5%
Text Notes 7100 6700 0    50   ~ 0
R4,R5,R6,R9 and R10 are all 1%
$Comp
L power:GND #PWR07
U 1 1 5D6D08B4
P 4900 5650
F 0 "#PWR07" H 4900 5400 50  0001 C CNN
F 1 "GND" H 4905 5477 50  0000 C CNN
F 2 "" H 4900 5650 50  0001 C CNN
F 3 "" H 4900 5650 50  0001 C CNN
	1    4900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5650 4900 5550
Connection ~ 4900 5550
Wire Wire Line
	1600 3950 3350 3950
Wire Wire Line
	3750 4250 3750 3450
Wire Wire Line
	1250 5200 1300 5200
Wire Wire Line
	1250 5300 1300 5300
Wire Wire Line
	1300 5300 1300 5200
Connection ~ 1300 5200
Wire Wire Line
	1250 4900 1300 4900
Wire Wire Line
	1300 4900 1300 5000
Wire Wire Line
	1250 5000 1300 5000
Connection ~ 1300 5000
Wire Wire Line
	1300 5000 1300 5200
$Comp
L power:GND #PWR03
U 1 1 5DB4F9A6
P 1300 5750
F 0 "#PWR03" H 1300 5500 50  0001 C CNN
F 1 "GND" H 1305 5577 50  0001 C CNN
F 2 "" H 1300 5750 50  0001 C CNN
F 3 "" H 1300 5750 50  0001 C CNN
	1    1300 5750
	1    0    0    -1  
$EndComp
Connection ~ 3750 2700
Wire Wire Line
	3750 2700 4000 2700
Wire Wire Line
	650  2700 2250 2700
Wire Wire Line
	1250 5100 1400 5100
Wire Wire Line
	1600 5100 1650 5100
Wire Wire Line
	1300 5300 1300 5650
Connection ~ 1300 5300
Wire Wire Line
	1650 4900 1650 5100
Connection ~ 1650 5100
Wire Wire Line
	1650 4450 1650 4500
Wire Wire Line
	1650 5250 1650 5100
Wire Wire Line
	1650 5550 1650 5650
Wire Wire Line
	1650 5650 1300 5650
Connection ~ 1300 5650
Wire Wire Line
	1300 5650 1300 5750
$Comp
L power:+5V #PWR04
U 1 1 5E24169D
P 1650 4450
F 0 "#PWR04" H 1650 4300 50  0001 C CNN
F 1 "+5V" H 1665 4623 50  0000 C CNN
F 2 "" H 1650 4450 50  0001 C CNN
F 3 "" H 1650 4450 50  0001 C CNN
	1    1650 4450
	1    0    0    -1  
$EndComp
$Comp
L 4xxx_IEEE:4013 U3
U 1 1 5E241D9F
P 2600 5150
F 0 "U3" H 2750 5550 50  0000 C CNN
F 1 "CD4013BE" H 2750 5450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2600 5150 50  0001 C CNN
F 3 "" H 2600 5150 50  0001 C CNN
F 4 "296-2033-5-ND" H 2600 5150 50  0001 C CNN "Digi-Key Part"
	1    2600 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4500 2600 4900
Connection ~ 1650 4500
Wire Wire Line
	1650 4500 1650 4600
Wire Wire Line
	1650 5650 1900 5650
Wire Wire Line
	2600 5650 2600 5400
Connection ~ 1650 5650
Wire Wire Line
	2000 5000 2000 4500
Wire Wire Line
	1650 4500 2000 4500
Connection ~ 2000 4500
Wire Wire Line
	2000 4500 2600 4500
Wire Wire Line
	2000 5100 1650 5100
Wire Wire Line
	2000 5200 1900 5200
Wire Wire Line
	1900 5200 1900 3550
Wire Wire Line
	1900 3550 2950 3550
Wire Wire Line
	2950 3550 2950 3300
Wire Wire Line
	2950 3300 4000 3300
Wire Wire Line
	2000 5300 1900 5300
Wire Wire Line
	1900 5300 1900 5650
Connection ~ 1900 5650
Wire Wire Line
	1900 5650 2600 5650
Wire Wire Line
	3200 5050 3750 5050
Wire Wire Line
	3750 5050 3750 4550
$Comp
L 4xxx_IEEE:4013 U3
U 2 1 5E2C31DF
P 6200 6700
F 0 "U3" H 6200 7166 50  0000 C CNN
F 1 "CD4013BE" H 6200 7075 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6200 6700 50  0001 C CNN
F 3 "" H 6200 6700 50  0001 C CNN
	2    6200 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6350 3150 6250
Wire Wire Line
	3150 5900 7350 5900
Wire Wire Line
	7350 5900 7350 5950
Wire Wire Line
	2750 6950 2750 7150
Wire Wire Line
	2750 7150 3550 7150
Connection ~ 2750 7150
Wire Wire Line
	2750 7150 2750 7200
Connection ~ 3550 7150
$Comp
L Regulator_Linear:L78L05_TO92 U4
U 1 1 5E38C95C
P 4700 6550
F 0 "U4" H 4700 6792 50  0000 C CNN
F 1 "L78L05_TO92" H 4700 6701 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 4700 6775 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4700 6500 50  0001 C CNN
F 4 "MC78L05BP-APMSCT-ND" H 4700 6550 50  0001 C CNN "Digi-Key Part"
	1    4700 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 3550 3350 3450
Wire Wire Line
	3350 3450 3750 3450
Connection ~ 3750 3450
Wire Wire Line
	3750 3450 3750 2700
Wire Wire Line
	3350 3750 3350 3950
Connection ~ 3350 3950
Wire Wire Line
	3350 3950 4500 3950
Wire Wire Line
	2550 2700 3750 2700
Wire Wire Line
	650  2700 650  3550
Wire Wire Line
	4400 6550 4050 6550
Wire Wire Line
	4700 6850 4700 7150
Wire Wire Line
	4700 7150 4050 7150
Connection ~ 4050 7150
$Comp
L power:+12V #PWR05
U 1 1 5E3F5744
P 5100 6400
F 0 "#PWR05" H 5100 6250 50  0001 C CNN
F 1 "+12V" H 5115 6573 50  0000 C CNN
F 2 "" H 5100 6400 50  0001 C CNN
F 3 "" H 5100 6400 50  0001 C CNN
	1    5100 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6400 5100 6550
Wire Wire Line
	5100 6550 5000 6550
$Comp
L power:+5V #PWR06
U 1 1 5E4066E3
P 5100 1700
F 0 "#PWR06" H 5100 1550 50  0001 C CNN
F 1 "+5V" H 5115 1873 50  0000 C CNN
F 2 "" H 5100 1700 50  0001 C CNN
F 3 "" H 5100 1700 50  0001 C CNN
	1    5100 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 7300 6750 7300
Wire Wire Line
	6750 7300 6750 7050
Wire Wire Line
	6750 7050 6000 7050
Wire Wire Line
	6000 7050 6000 7200
Wire Wire Line
	6000 7200 6050 7200
Wire Wire Line
	4700 7150 5600 7150
Wire Wire Line
	5600 7150 5600 6850
Connection ~ 4700 7150
Wire Wire Line
	5600 6850 5600 6750
Connection ~ 5600 6850
Wire Wire Line
	5600 6650 5600 6550
Wire Wire Line
	5600 7150 5600 7400
Wire Wire Line
	5600 7400 6050 7400
Connection ~ 5600 7150
Wire Wire Line
	5600 6750 5600 6650
Connection ~ 5600 6750
Connection ~ 5600 6650
Wire Wire Line
	9350 2250 9500 2250
Connection ~ 9350 2650
Wire Wire Line
	9500 2350 9350 2350
Connection ~ 9350 2350
Wire Wire Line
	9350 2350 9350 2250
Wire Wire Line
	9350 2350 9350 2650
Wire Wire Line
	9400 5050 9500 5050
Wire Wire Line
	9250 4850 9500 4850
Wire Wire Line
	9500 4650 9400 4650
Wire Wire Line
	9400 4650 9400 4750
Connection ~ 9400 5050
Wire Wire Line
	9500 4750 9400 4750
Connection ~ 9400 4750
Wire Wire Line
	9400 4750 9400 5050
$Comp
L sputterizer-rescue:SJ1-3535-sputterer J1
U 1 1 5E5810A4
P 850 5100
F 0 "J1" H 908 5547 60  0000 C CNN
F 1 "SJ1-3535" H 908 5441 60  0000 C CNN
F 2 "sputterizer:Jack_3.5mm_CUI_SJ1-3535NG_Horizontal_RectangularHoles" H 1050 5300 60  0001 L CNN
F 3 "http://www.switchcraft.com/Drawings/ra49b_Series_cd.pdf" H 1050 5400 60  0001 L CNN
F 4 "CP1-3535-ND" H 1050 5500 60  0001 L CNN "Digi-Key Part"
F 5 "SJ1-3535" H 1050 5600 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 1050 5700 60  0001 L CNN "Category"
F 7 "Barrel - Audio Connectors" H 1050 5800 60  0001 L CNN "Family"
F 8 "http://www.switchcraft.com/Drawings/ra49b_Series_cd.pdf" H 1050 5900 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/switchcraft-inc/RA49B14B/SC2030-ND/1288995" H 1050 6000 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN JACK STEREO 3.5MM R/A SW" H 1050 6100 60  0001 L CNN "Description"
F 11 "CUI" H 1050 6200 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1050 6300 60  0001 L CNN "Status"
	1    850  5100
	1    0    0    -1  
$EndComp
$Comp
L sputterizer-rescue:SJ1-3535-sputterer J2
U 1 1 5E582D9D
P 9900 2450
F 0 "J2" H 9572 2508 60  0000 R CNN
F 1 "SJ1-3535" H 9572 2402 60  0000 R CNN
F 2 "sputterizer:Jack_3.5mm_CUI_SJ1-3535NG_Horizontal_RectangularHoles" H 10100 2650 60  0001 L CNN
F 3 "http://www.switchcraft.com/Drawings/ra49b_Series_cd.pdf" H 10100 2750 60  0001 L CNN
F 4 "CP1-3535-ND" H 10100 2850 60  0001 L CNN "Digi-Key Part"
F 5 "SJ1-3535" H 10100 2950 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10100 3050 60  0001 L CNN "Category"
F 7 "Barrel - Audio Connectors" H 10100 3150 60  0001 L CNN "Family"
F 8 "http://www.switchcraft.com/Drawings/ra49b_Series_cd.pdf" H 10100 3250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/switchcraft-inc/RA49B14B/SC2030-ND/1288995" H 10100 3350 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN JACK STEREO 3.5MM R/A SW" H 10100 3450 60  0001 L CNN "Description"
F 11 "CUI" H 10100 3550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10100 3650 60  0001 L CNN "Status"
	1    9900 2450
	-1   0    0    -1  
$EndComp
$Comp
L sputterizer-rescue:SJ1-3535-sputterer J3
U 1 1 5E5855B5
P 9900 4850
F 0 "J3" H 9572 4908 60  0000 R CNN
F 1 "SJ1-3535" H 9572 4802 60  0000 R CNN
F 2 "sputterizer:Jack_3.5mm_CUI_SJ1-3535NG_Horizontal_RectangularHoles" H 10100 5050 60  0001 L CNN
F 3 "http://www.switchcraft.com/Drawings/ra49b_Series_cd.pdf" H 10100 5150 60  0001 L CNN
F 4 "CP1-3535-ND" H 10100 5250 60  0001 L CNN "Digi-Key Part"
F 5 "SJ1-3535" H 10100 5350 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 10100 5450 60  0001 L CNN "Category"
F 7 "Barrel - Audio Connectors" H 10100 5550 60  0001 L CNN "Family"
F 8 "http://www.switchcraft.com/Drawings/ra49b_Series_cd.pdf" H 10100 5650 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/switchcraft-inc/RA49B14B/SC2030-ND/1288995" H 10100 5750 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN JACK STEREO 3.5MM R/A SW" H 10100 5850 60  0001 L CNN "Description"
F 11 "CUI" H 10100 5950 60  0001 L CNN "Manufacturer"
F 12 "Active" H 10100 6050 60  0001 L CNN "Status"
	1    9900 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8300 1800 7250 1800
Connection ~ 7250 1800
Wire Wire Line
	5100 1700 5100 1800
Connection ~ 5100 1800
Wire Wire Line
	3150 6850 3150 6950
Wire Wire Line
	3150 6950 3450 6950
Wire Wire Line
	3450 6950 3450 6250
Wire Wire Line
	3450 6250 3150 6250
Connection ~ 3150 6250
Wire Wire Line
	3150 6250 3150 5900
$Comp
L Diode:1N4148 D5
U 1 1 5DA38D5D
P 2400 2700
F 0 "D5" H 2350 2600 50  0000 L CNN
F 1 "1N4148" H 2050 2750 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 2525 50  0001 C CNN
F 3 "http://www.vishay.com/docs/81857/1n4148.pdf" H 2400 2700 50  0001 C CNN
F 4 "1N4148VSCT-ND" V 2400 2700 50  0001 C CNN "Digi-Key Part"
	1    2400 2700
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D6
U 1 1 5DA37CB8
P 3750 4400
F 0 "D6" H 3700 4550 50  0000 L CNN
F 1 "1N4148" H 3600 4250 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3750 4225 50  0001 C CNN
F 3 "http://www.vishay.com/docs/81857/1n4148.pdf" H 3750 4400 50  0001 C CNN
F 4 "1N4148VSCT-ND" V 3750 4400 50  0001 C CNN "Digi-Key Part"
	1    3750 4400
	0    1    1    0   
$EndComp
$EndSCHEMATC
