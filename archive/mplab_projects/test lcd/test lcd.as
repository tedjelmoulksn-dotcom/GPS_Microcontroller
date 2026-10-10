opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 5239"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 17 "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\test lcd.c"
	psect config,class=CONFIG,delta=2 ;#
# 17 "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\test lcd.c"
	dw 0x3FFE & 0x3FFB & 0x3FFF & 0x3F7F ;#
;BANK0:	_main->_print_string
;COMMON:	_print_string->_print_char
;COMMON:	_print_char->_attente_bf
;COMMON:	_attente_bf->_lecture_commande
;BANK0:	_lecture_commande->_tempo_N_ms
;BANK0:	_attente_bf->_lecture_commande
;BANK0:	_lecture_commande->_tempo_N_ms
;BANK0:	_print_string->_print_char
;COMMON:	_print_char->_attente_bf
;COMMON:	_attente_bf->_lecture_commande
;BANK0:	_lecture_commande->_tempo_N_ms
;BANK0:	_attente_bf->_lecture_commande
;BANK0:	_lecture_commande->_tempo_N_ms
;COMMON:	_main->_print_char
;COMMON:	_print_char->_attente_bf
;COMMON:	_attente_bf->_lecture_commande
;BANK0:	_lecture_commande->_tempo_N_ms
;BANK0:	_attente_bf->_lecture_commande
;BANK0:	_lecture_commande->_tempo_N_ms
	FNCALL	_main,_init_PORTD
	FNCALL	_main,_allume_LCD
	FNCALL	_main,_init_LCD
	FNCALL	_main,_print_string
	FNCALL	_main,_goto_ligne_2
	FNCALL	_main,_tempo_N_ms
	FNCALL	_main,_efface
	FNCALL	_main,_go_to
	FNCALL	_main,_print_char
	FNCALL	_efface,_ecriture_commande
	FNCALL	_goto_ligne_2,_ecriture_commande
	FNCALL	_print_string,_print_char
	FNCALL	_go_to,_ecriture_commande
	FNCALL	_allume_LCD,_init_PORTD
	FNCALL	_init_LCD,_tempo_N_ms
	FNCALL	_init_LCD,_ecriture_commande
	FNCALL	_print_char,_attente_bf
	FNCALL	_ecriture_commande,_attente_bf
	FNCALL	_attente_bf,_lecture_commande
	FNCALL	_lecture_commande,_tempo_N_ms
	FNCALL	_tempo_N_ms,_tempo_1_ms
	FNROOT	_main
	FNCALL	intlevel1,_timer1_it
	global	intlevel1
	FNROOT	intlevel1
	global	_dpowers
psect	strings,class=CODE,delta=2,reloc=256
global __pstrings
__pstrings:
	global	stringdir,stringtab,__stringbase,stringjmp
stringtab:
;	String table - string pointers are 1 byte each
	movwf	(btemp)&07Fh
	btfss	(btemp)&07Fh,7
	goto	stringcode
	bcf	status,7
	btfsc	btemp&7Fh,0
	bsf	status,7
	movf	indf,w
	return
stringcode:
	movf	fsr,w
stringdir:
movwf btemp&07Fh
movlw high(stringdir)
movwf pclath
movf btemp&07Fh,w
stringjmp:
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\lib\doprnt.c"
	line	354
_dpowers:
	retlw	01h
	retlw	0
	retlw	0
	retlw	0

	retlw	0Ah
	retlw	0
	retlw	0
	retlw	0

	retlw	064h
	retlw	0
	retlw	0
	retlw	0

	retlw	0E8h
	retlw	03h
	retlw	0
	retlw	0

	retlw	010h
	retlw	027h
	retlw	0
	retlw	0

	retlw	0A0h
	retlw	086h
	retlw	01h
	retlw	0

	retlw	040h
	retlw	042h
	retlw	0Fh
	retlw	0

	retlw	080h
	retlw	096h
	retlw	098h
	retlw	0

	retlw	0
	retlw	0E1h
	retlw	0F5h
	retlw	05h

	retlw	0
	retlw	0CAh
	retlw	09Ah
	retlw	03Bh

	global	__npowers_
psect	strings
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\powers.c"
	line	39
__npowers_:
	retlw	0x0
	retlw	0x80
	retlw	0x3f

	retlw	0xcd
	retlw	0xcc
	retlw	0x3d

	retlw	0xd7
	retlw	0x23
	retlw	0x3c

	retlw	0x12
	retlw	0x83
	retlw	0x3a

	retlw	0xb7
	retlw	0xd1
	retlw	0x38

	retlw	0xc6
	retlw	0x27
	retlw	0x37

	retlw	0x38
	retlw	0x86
	retlw	0x35

	retlw	0xc0
	retlw	0xd6
	retlw	0x33

	retlw	0xcc
	retlw	0x2b
	retlw	0x32

	retlw	0x70
	retlw	0x89
	retlw	0x30

	retlw	0xe7
	retlw	0xdb
	retlw	0x2e

	retlw	0xe5
	retlw	0x3c
	retlw	0x1e

	retlw	0x42
	retlw	0xa2
	retlw	0xd

	global	__powers_
psect	strings
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\powers.c"
	line	7
__powers_:
	retlw	0x0
	retlw	0x80
	retlw	0x3f

	retlw	0x0
	retlw	0x20
	retlw	0x41

	retlw	0x0
	retlw	0xc8
	retlw	0x42

	retlw	0x0
	retlw	0x7a
	retlw	0x44

	retlw	0x40
	retlw	0x1c
	retlw	0x46

	retlw	0x50
	retlw	0xc3
	retlw	0x47

	retlw	0x24
	retlw	0x74
	retlw	0x49

	retlw	0x97
	retlw	0x18
	retlw	0x4b

	retlw	0xbc
	retlw	0xbe
	retlw	0x4c

	retlw	0x6b
	retlw	0x6e
	retlw	0x4e

	retlw	0x3
	retlw	0x15
	retlw	0x50

	retlw	0x79
	retlw	0xad
	retlw	0x60

	retlw	0xf3
	retlw	0x49
	retlw	0x71

	global	_dpowers
	global	__npowers_
	global	__powers_
	global	_minute
	global	_seconde
	global	_COUNT
	global	_heure
	global	_i
	global	_debug
_debug  equ     112
	DABS	1,112,1	;_debug

	global	_ADCON0
_ADCON0  equ     31
	global	_ADRESH
_ADRESH  equ     30
	global	_CCP1CON
_CCP1CON  equ     23
	global	_CCP2CON
_CCP2CON  equ     29
	global	_CCPR1H
_CCPR1H  equ     22
	global	_CCPR1L
_CCPR1L  equ     21
	global	_CCPR2H
_CCPR2H  equ     28
	global	_CCPR2L
_CCPR2L  equ     27
	global	_FSR
_FSR  equ     4
	global	_INDF
_INDF  equ     0
	global	_INTCON
_INTCON  equ     11
	global	_PCL
_PCL  equ     2
	global	_PCLATH
_PCLATH  equ     10
	global	_PIR1
_PIR1  equ     12
	global	_PIR2
_PIR2  equ     13
	global	_PORTA
_PORTA  equ     5
	global	_PORTB
_PORTB  equ     6
	global	_PORTC
_PORTC  equ     7
	global	_PORTD
_PORTD  equ     8
	global	_PORTE
_PORTE  equ     9
	global	_RCREG
_RCREG  equ     26
	global	_RCSTA
_RCSTA  equ     24
	global	_SSPBUF
_SSPBUF  equ     19
	global	_SSPCON
_SSPCON  equ     20
	global	_STATUS
_STATUS  equ     3
	global	_T1CON
_T1CON  equ     16
	global	_T2CON
_T2CON  equ     18
	global	_TMR0
_TMR0  equ     1
	global	_TMR1H
_TMR1H  equ     15
	global	_TMR1L
_TMR1L  equ     14
	global	_TMR2
_TMR2  equ     17
	global	_TXREG
_TXREG  equ     25
	global	_ADCS0
_ADCS0  equ     254
	global	_ADCS1
_ADCS1  equ     255
	global	_ADDEN
_ADDEN  equ     195
	global	_ADGO
_ADGO  equ     250
	global	_ADIF
_ADIF  equ     102
	global	_ADON
_ADON  equ     248
	global	_BCLIF
_BCLIF  equ     107
	global	_CARRY
_CARRY  equ     24
	global	_CCP1IF
_CCP1IF  equ     98
	global	_CCP1M0
_CCP1M0  equ     184
	global	_CCP1M1
_CCP1M1  equ     185
	global	_CCP1M2
_CCP1M2  equ     186
	global	_CCP1M3
_CCP1M3  equ     187
	global	_CCP1X
_CCP1X  equ     189
	global	_CCP1Y
_CCP1Y  equ     188
	global	_CCP2IF
_CCP2IF  equ     104
	global	_CCP2M0
_CCP2M0  equ     232
	global	_CCP2M1
_CCP2M1  equ     233
	global	_CCP2M2
_CCP2M2  equ     234
	global	_CCP2M3
_CCP2M3  equ     235
	global	_CCP2X
_CCP2X  equ     237
	global	_CCP2Y
_CCP2Y  equ     236
	global	_CHS0
_CHS0  equ     251
	global	_CHS1
_CHS1  equ     252
	global	_CHS2
_CHS2  equ     253
	global	_CKP
_CKP  equ     164
	global	_CMIF
_CMIF  equ     110
	global	_CREN
_CREN  equ     196
	global	_DC
_DC  equ     25
	global	_EEIF
_EEIF  equ     108
	global	_FERR
_FERR  equ     194
	global	_GIE
_GIE  equ     95
	global	_GODONE
_GODONE  equ     250
	global	_INTE
_INTE  equ     92
	global	_INTF
_INTF  equ     89
	global	_IRP
_IRP  equ     31
	global	_OERR
_OERR  equ     193
	global	_PD
_PD  equ     27
	global	_PEIE
_PEIE  equ     94
	global	_PSPIF
_PSPIF  equ     103
	global	_RA0
_RA0  equ     40
	global	_RA1
_RA1  equ     41
	global	_RA2
_RA2  equ     42
	global	_RA3
_RA3  equ     43
	global	_RA4
_RA4  equ     44
	global	_RA5
_RA5  equ     45
	global	_RB0
_RB0  equ     48
	global	_RB1
_RB1  equ     49
	global	_RB2
_RB2  equ     50
	global	_RB3
_RB3  equ     51
	global	_RB4
_RB4  equ     52
	global	_RB5
_RB5  equ     53
	global	_RB6
_RB6  equ     54
	global	_RB7
_RB7  equ     55
	global	_RBIE
_RBIE  equ     91
	global	_RBIF
_RBIF  equ     88
	global	_RC0
_RC0  equ     56
	global	_RC1
_RC1  equ     57
	global	_RC2
_RC2  equ     58
	global	_RC3
_RC3  equ     59
	global	_RC4
_RC4  equ     60
	global	_RC5
_RC5  equ     61
	global	_RC6
_RC6  equ     62
	global	_RC7
_RC7  equ     63
	global	_RCIF
_RCIF  equ     101
	global	_RD0
_RD0  equ     64
	global	_RD1
_RD1  equ     65
	global	_RD2
_RD2  equ     66
	global	_RD3
_RD3  equ     67
	global	_RD4
_RD4  equ     68
	global	_RD5
_RD5  equ     69
	global	_RD6
_RD6  equ     70
	global	_RD7
_RD7  equ     71
	global	_RE0
_RE0  equ     72
	global	_RE1
_RE1  equ     73
	global	_RE2
_RE2  equ     74
	global	_RP0
_RP0  equ     29
	global	_RP1
_RP1  equ     30
	global	_RX9
_RX9  equ     198
	global	_RX9D
_RX9D  equ     192
	global	_SPEN
_SPEN  equ     199
	global	_SREN
_SREN  equ     197
	global	_SSPEN
_SSPEN  equ     165
	global	_SSPIF
_SSPIF  equ     99
	global	_SSPM0
_SSPM0  equ     160
	global	_SSPM1
_SSPM1  equ     161
	global	_SSPM2
_SSPM2  equ     162
	global	_SSPM3
_SSPM3  equ     163
	global	_SSPOV
_SSPOV  equ     166
	global	_T0IE
_T0IE  equ     93
	global	_T0IF
_T0IF  equ     90
	global	_T1CKPS0
_T1CKPS0  equ     132
	global	_T1CKPS1
_T1CKPS1  equ     133
	global	_T1OSCEN
_T1OSCEN  equ     131
	global	_T1SYNC
_T1SYNC  equ     130
	global	_T2CKPS0
_T2CKPS0  equ     144
	global	_T2CKPS1
_T2CKPS1  equ     145
	global	_TMR0IE
_TMR0IE  equ     93
	global	_TMR0IF
_TMR0IF  equ     90
	global	_TMR1CS
_TMR1CS  equ     129
	global	_TMR1IF
_TMR1IF  equ     96
	global	_TMR1ON
_TMR1ON  equ     128
	global	_TMR2IF
_TMR2IF  equ     97
	global	_TMR2ON
_TMR2ON  equ     146
	global	_TO
_TO  equ     28
	global	_TOUTPS0
_TOUTPS0  equ     147
	global	_TOUTPS1
_TOUTPS1  equ     148
	global	_TOUTPS2
_TOUTPS2  equ     149
	global	_TOUTPS3
_TOUTPS3  equ     150
	global	_TXIF
_TXIF  equ     100
	global	_WCOL
_WCOL  equ     167
	global	_ZERO
_ZERO  equ     26
	global	_ADCON1
_ADCON1  equ     159
	global	_ADRESL
_ADRESL  equ     158
	global	_CMCON
_CMCON  equ     156
	global	_CVRCON
_CVRCON  equ     157
	global	_OPTION
_OPTION  equ     129
	global	_PCON
_PCON  equ     142
	global	_PIE1
_PIE1  equ     140
	global	_PIE2
_PIE2  equ     141
	global	_PR2
_PR2  equ     146
	global	_SPBRG
_SPBRG  equ     153
	global	_SSPADD
_SSPADD  equ     147
	global	_SSPCON2
_SSPCON2  equ     145
	global	_SSPSTAT
_SSPSTAT  equ     148
	global	_TRISA
_TRISA  equ     133
	global	_TRISB
_TRISB  equ     134
	global	_TRISC
_TRISC  equ     135
	global	_TRISD
_TRISD  equ     136
	global	_TRISE
_TRISE  equ     137
	global	_TXSTA
_TXSTA  equ     152
	global	_ACKDT
_ACKDT  equ     1165
	global	_ACKEN
_ACKEN  equ     1164
	global	_ACKSTAT
_ACKSTAT  equ     1166
	global	_ADCS2
_ADCS2  equ     1278
	global	_ADFM
_ADFM  equ     1279
	global	_ADIE
_ADIE  equ     1126
	global	_BCLIE
_BCLIE  equ     1131
	global	_BF
_BF  equ     1184
	global	_BOR
_BOR  equ     1136
	global	_BRGH
_BRGH  equ     1218
	global	_C1INV
_C1INV  equ     1252
	global	_C1OUT
_C1OUT  equ     1254
	global	_C2INV
_C2INV  equ     1253
	global	_C2OUT
_C2OUT  equ     1255
	global	_CCP1IE
_CCP1IE  equ     1122
	global	_CCP2IE
_CCP2IE  equ     1128
	global	_CIS
_CIS  equ     1251
	global	_CKE
_CKE  equ     1190
	global	_CM0
_CM0  equ     1248
	global	_CM1
_CM1  equ     1249
	global	_CM2
_CM2  equ     1250
	global	_CMIE
_CMIE  equ     1134
	global	_CSRC
_CSRC  equ     1223
	global	_CVR0
_CVR0  equ     1256
	global	_CVR1
_CVR1  equ     1257
	global	_CVR2
_CVR2  equ     1258
	global	_CVR3
_CVR3  equ     1259
	global	_CVREN
_CVREN  equ     1263
	global	_CVROE
_CVROE  equ     1262
	global	_CVRR
_CVRR  equ     1261
	global	_DA
_DA  equ     1189
	global	_EEIE
_EEIE  equ     1132
	global	_GCEN
_GCEN  equ     1167
	global	_IBF
_IBF  equ     1103
	global	_IBOV
_IBOV  equ     1101
	global	_INTEDG
_INTEDG  equ     1038
	global	_OBF
_OBF  equ     1102
	global	_PCFG0
_PCFG0  equ     1272
	global	_PCFG1
_PCFG1  equ     1273
	global	_PCFG2
_PCFG2  equ     1274
	global	_PCFG3
_PCFG3  equ     1275
	global	_PEN
_PEN  equ     1162
	global	_POR
_POR  equ     1137
	global	_PS0
_PS0  equ     1032
	global	_PS1
_PS1  equ     1033
	global	_PS2
_PS2  equ     1034
	global	_PSA
_PSA  equ     1035
	global	_PSPIE
_PSPIE  equ     1127
	global	_PSPMODE
_PSPMODE  equ     1100
	global	_RBPU
_RBPU  equ     1039
	global	_RCEN
_RCEN  equ     1163
	global	_RCIE
_RCIE  equ     1125
	global	_RSEN
_RSEN  equ     1161
	global	_RW
_RW  equ     1186
	global	_SEN
_SEN  equ     1160
	global	_SMP
_SMP  equ     1191
	global	_SSPIE
_SSPIE  equ     1123
	global	_START
_START  equ     1187
	global	_STOP
_STOP  equ     1188
	global	_SYNC
_SYNC  equ     1220
	global	_T0CS
_T0CS  equ     1037
	global	_T0SE
_T0SE  equ     1036
	global	_TMR1IE
_TMR1IE  equ     1120
	global	_TMR2IE
_TMR2IE  equ     1121
	global	_TRISA0
_TRISA0  equ     1064
	global	_TRISA1
_TRISA1  equ     1065
	global	_TRISA2
_TRISA2  equ     1066
	global	_TRISA3
_TRISA3  equ     1067
	global	_TRISA4
_TRISA4  equ     1068
	global	_TRISA5
_TRISA5  equ     1069
	global	_TRISB0
_TRISB0  equ     1072
	global	_TRISB1
_TRISB1  equ     1073
	global	_TRISB2
_TRISB2  equ     1074
	global	_TRISB3
_TRISB3  equ     1075
	global	_TRISB4
_TRISB4  equ     1076
	global	_TRISB5
_TRISB5  equ     1077
	global	_TRISB6
_TRISB6  equ     1078
	global	_TRISB7
_TRISB7  equ     1079
	global	_TRISC0
_TRISC0  equ     1080
	global	_TRISC1
_TRISC1  equ     1081
	global	_TRISC2
_TRISC2  equ     1082
	global	_TRISC3
_TRISC3  equ     1083
	global	_TRISC4
_TRISC4  equ     1084
	global	_TRISC5
_TRISC5  equ     1085
	global	_TRISC6
_TRISC6  equ     1086
	global	_TRISC7
_TRISC7  equ     1087
	global	_TRISD0
_TRISD0  equ     1088
	global	_TRISD1
_TRISD1  equ     1089
	global	_TRISD2
_TRISD2  equ     1090
	global	_TRISD3
_TRISD3  equ     1091
	global	_TRISD4
_TRISD4  equ     1092
	global	_TRISD5
_TRISD5  equ     1093
	global	_TRISD6
_TRISD6  equ     1094
	global	_TRISD7
_TRISD7  equ     1095
	global	_TRISE0
_TRISE0  equ     1096
	global	_TRISE1
_TRISE1  equ     1097
	global	_TRISE2
_TRISE2  equ     1098
	global	_TRMT
_TRMT  equ     1217
	global	_TX9
_TX9  equ     1222
	global	_TX9D
_TX9D  equ     1216
	global	_TXEN
_TXEN  equ     1221
	global	_TXIE
_TXIE  equ     1124
	global	_UA
_UA  equ     1185
	global	_EEADR
_EEADR  equ     269
	global	_EEADRH
_EEADRH  equ     271
	global	_EEADRL
_EEADRL  equ     269
	global	_EEDATA
_EEDATA  equ     268
	global	_EEDATH
_EEDATH  equ     270
	global	_EECON1
_EECON1  equ     396
	global	_EECON2
_EECON2  equ     397
	global	_EEPGD
_EEPGD  equ     3175
	global	_RD
_RD  equ     3168
	global	_WR
_WR  equ     3169
	global	_WREN
_WREN  equ     3170
	global	_WRERR
_WRERR  equ     3171
	
STR_1:	
	retlw	72	;'H'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	77	;'M'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	83	;'S'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_4:	
	retlw	99	;'c'
	retlw	39	;'''
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	102	;'f'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_3:	
	retlw	76	;'L'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	73	;'I'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	54	;'6'
	retlw	70	;'F'
	retlw	56	;'8'
	retlw	55	;'7'
	retlw	55	;'7'
	retlw	0
psect	strings
	
STR_5:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	82	;'R'
	retlw	69	;'E'
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	89	;'Y'
	retlw	32	;' '
	retlw	33	;'!'
	retlw	33	;'!'
	retlw	33	;'!'
	retlw	0
psect	strings
	
STR_2:	
	retlw	86	;'V'
	retlw	61	;'='
	retlw	37	;'%'
	retlw	46	;'.'
	retlw	50	;'2'
	retlw	102	;'f'
	retlw	32	;' '
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	0
psect	strings
	file	"test lcd.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_COUNT:
       ds      2

_heure:
       ds      2

_i:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_minute:
       ds      2

_seconde:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_init_PORTD
??_init_PORTD: ;@ 0x0
	global	??_lecture_commande
??_lecture_commande: ;@ 0x0
	global	??_tempo_N_ms
??_tempo_N_ms: ;@ 0x0
	global	??_allume_LCD
??_allume_LCD: ;@ 0x0
	global	?_allume_LCD
?_allume_LCD: ;@ 0x0
	global	?_init_PORTD
?_init_PORTD: ;@ 0x0
	global	??_tempo_1_ms
??_tempo_1_ms: ;@ 0x0
	ds	1
	global	??_attente_bf
??_attente_bf: ;@ 0x1
	ds	1
	global	??_ecriture_commande
??_ecriture_commande: ;@ 0x2
	global	??_print_char
??_print_char: ;@ 0x2
	ds	1
	global	?_init_LCD
?_init_LCD: ;@ 0x3
	global	??_goto_ligne_2
??_goto_ligne_2: ;@ 0x3
	global	?_ecriture_commande
?_ecriture_commande: ;@ 0x3
	global	??_init_LCD
??_init_LCD: ;@ 0x3
	global	?_efface
?_efface: ;@ 0x3
	global	??_efface
??_efface: ;@ 0x3
	global	?_goto_ligne_2
?_goto_ligne_2: ;@ 0x3
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_tempo_N_ms
?_tempo_N_ms: ;@ 0x0
	global	?_tempo_1_ms
?_tempo_1_ms: ;@ 0x0
	global	tempo_N_ms@N
tempo_N_ms@N:	; 2 bytes @ 0x0
	ds	2
	global	lecture_commande@quartet_commande
lecture_commande@quartet_commande:	; 1 bytes @ 0x2
	ds	1
	global	lecture_commande@commande
lecture_commande@commande:	; 1 bytes @ 0x3
	ds	1
	global	?_attente_bf
?_attente_bf: ;@ 0x4
	global	?_lecture_commande
?_lecture_commande: ;@ 0x4
	global	ecriture_commande@commande
ecriture_commande@commande:	; 1 bytes @ 0x4
	global	print_char@car
print_char@car:	; 1 bytes @ 0x4
	ds	1
	global	??_print_string
??_print_string: ;@ 0x5
	global	??_go_to
??_go_to: ;@ 0x5
	global	?_print_char
?_print_char: ;@ 0x5
	ds	1
	global	?_go_to
?_go_to: ;@ 0x6
	global	go_to@x
go_to@x:	; 2 bytes @ 0x6
	ds	1
	global	print_string@i
print_string@i:	; 2 bytes @ 0x7
	ds	2
	global	?_print_string
?_print_string: ;@ 0x9
	global	print_string@s
print_string@s:	; 2 bytes @ 0x9
	ds	2
	global	??_main
??_main: ;@ 0xB
	ds	1
	global	??_timer1_it
??_timer1_it: ;@ 0xC
	global	?_main
?_main: ;@ 0xC
	ds	4
	global	?_timer1_it
?_timer1_it: ;@ 0x10
;Data sizes: Strings 67, constant 118, data 0, bss 10, persistent 0 stack 0
;Auto spaces:   Size  Autos    Used
; COMMON          13      4      10
; BANK0           80     16      20
; BANK1           80      0       0
; BANK3           96      0       0
; BANK2           96      0       0


;Pointer list with targets:

;print_string@s	PTR unsigned char  size(2); Largest target is 50
;		 -> STR_5(CODE[13]), montre@buff(BANK0[50]), millivoltmetre@buffer(BANK0[50]), STR_3(CODE[14]), 
;		 -> STR_4(CODE[15]), 
;S691$_cp	PTR const unsigned char  size(1); Largest target is 0
;_val._str._cp	PTR const unsigned char  size(1); Largest target is 0


;Main: autosize = 0, tempsize = 1, incstack = 0, save=0


;Call graph:                      Base Space Used Autos Args Refs Density
;_main                                                1    0 1302   0.00
;                                   11 BANK0    1
;         _init_PORTD
;         _allume_LCD
;           _init_LCD
;       _print_string
;       _goto_ligne_2
;         _tempo_N_ms
;             _efface
;              _go_to
;         _print_char
;  _efface                                            0    0  180   0.00
;  _ecriture_commande
;  _goto_ligne_2                                      0    0  180   0.00
;  _ecriture_commande
;  _print_string                                      4    2  282   0.00
;                                    5 BANK0    6
;         _print_char
;  _go_to                                             1    2  252   0.00
;                                    5 BANK0    3
;  _ecriture_commande
;  _allume_LCD                                        0    0    0   0.00
;         _init_PORTD
;  _init_LCD                                          0    0  204   0.00
;         _tempo_N_ms
;  _ecriture_commande
;    _print_char                                      3    0  180   0.00
;                                    2 COMMO    2
;                                    4 BANK0    1
;         _attente_bf
;    _ecriture_commande                               2    0  180   0.00
;                                    2 COMMO    1
;                                    4 BANK0    1
;         _attente_bf
;    _init_PORTD                                      0    0    0   0.00
;      _attente_bf                                    1    0  132   0.00
;                                    1 COMMO    1
;   _lecture_commande
;        _lecture_commande                            3    0  132   0.00
;                                    0 COMMO    1
;                                    2 BANK0    2
;         _tempo_N_ms
;          _tempo_N_ms                                0    2   24   0.00
;                                    0 BANK0    2
;         _tempo_1_ms
;            _tempo_1_ms                              0    0    0   0.00
; Estimated maximum call depth 6
;_timer1_it                                           4    0    0   0.00
;                                   12 BANK0    4
; Estimated maximum call depth 0
; Address spaces:

;Name               Size   Autos  Total    Cost      Usage
;BITCOMMON            D      0       0       0        0.0%
;CODE                 0      0       0       0        0.0%
;NULL                 0      0       0       0        0.0%
;COMMON               D      4       A       1       76.9%
;SFR0                 0      0       0       1        0.0%
;BITSFR0              0      0       0       1        0.0%
;BITSFR1              0      0       0       2        0.0%
;SFR1                 0      0       0       2        0.0%
;ABS                  0      0      1E       2        0.0%
;STACK                0      0       0       3        0.0%
;BITBANK0            50      0       0       4        0.0%
;SFR3                 0      0       0       4        0.0%
;BITSFR3              0      0       0       4        0.0%
;BANK0               50     10      14       5       25.0%
;BITSFR2              0      0       0       5        0.0%
;SFR2                 0      0       0       5        0.0%
;BITBANK1            50      0       0       6        0.0%
;BANK1               50      0       0       7        0.0%
;BITBANK3            60      0       0       8        0.0%
;BANK3               60      0       0       9        0.0%
;BITBANK2            60      0       0      10        0.0%
;BANK2               60      0       0      11        0.0%
;DATA                 0      0      1E      12        0.0%
;EEDATA             100      0       0    1000        0.0%

	global	_main
psect	maintext,local,class=CODE,delta=2
global __pmaintext
__pmaintext:

; *************** function _main *****************
; Defined at:
;		line 219 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\test lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 17F/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       1       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		_init_PORTD
;		_allume_LCD
;		_init_LCD
;		_print_string
;		_goto_ligne_2
;		_tempo_N_ms
;		_efface
;		_go_to
;		_print_char
; This function is called by:
;		Startup code after reset
; This function uses a non-reentrant model
; 
psect	maintext
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\test lcd.c"
	line	219
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
;test lcd.c: 150: int i;
;test lcd.c: 218: void main(void)
;test lcd.c: 219: {
	
_main:	
	opt stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	220
	
l30001184:	
;test lcd.c: 220: init_PORTD();
	fcall	_init_PORTD
	line	221
;test lcd.c: 221: allume_LCD();
	fcall	_allume_LCD
	
l30001185:	
	line	222
;test lcd.c: 222: init_LCD();
	fcall	_init_LCD
	
l30001186:	
	line	223
;test lcd.c: 223: print_string("Le PIC 16F877");
	movlw	((STR_3-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_print_string)
	movlw	00h
	movwf	(?_print_string+1)
	fcall	_print_string
	
l30001187:	
	line	225
;test lcd.c: 225: goto_ligne_2();
	fcall	_goto_ligne_2
	
l30001188:	
	line	226
;test lcd.c: 226: print_string("c'est fastoche");
	movlw	((STR_4-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_print_string)
	movlw	00h
	movwf	(?_print_string+1)
	fcall	_print_string
	
l30001189:	
	line	228
;test lcd.c: 228: tempo_N_ms(5000);
	movlw	low(01388h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(01388h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001190:	
	line	229
;test lcd.c: 229: efface();
	fcall	_efface
	
l30001191:	
	line	230
;test lcd.c: 230: for(i=1;i<17;i++)
	movlw	low(01h)
	movwf	(_i)
	movlw	high(01h)
	movwf	((_i))+1
	
l30001194:	
	line	232
;test lcd.c: 231: {
;test lcd.c: 232: go_to(i);
	movf	(_i+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_go_to+1)
	addwf	(?_go_to+1)
	movf	(_i),w
	clrf	(?_go_to)
	addwf	(?_go_to)

	fcall	_go_to
	line	233
;test lcd.c: 233: print_char(0xFF);
	movlw	(0FFh)
	fcall	_print_char
	line	234
;test lcd.c: 234: tempo_N_ms(100);
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(064h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001195:	
	line	230
	movlw	low(01h)
	addwf	(_i),f
	skipnc
	incf	(_i+1),f
	movlw	high(01h)
	addwf	(_i+1),f
	
l30001196:	
	movf	(_i+1),w
	xorlw	80h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movlw	(high(011h))^80h
	subwf	(??_main+0+0),w
	skipz
	goto	u205
	movlw	low(011h)
	subwf	(_i),w
u205:

	skipc
	goto	u201
	goto	u200
u201:
	goto	l30001194
u200:
	
l30001197:	
	line	236
;test lcd.c: 235: }
;test lcd.c: 236: go_to(17);
	movlw	low(011h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_go_to)
	movlw	high(011h)
	movwf	((?_go_to))+1
	fcall	_go_to
	
l30001198:	
	line	237
;test lcd.c: 237: print_string("   READY !!!");
	movlw	((STR_5-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_print_string)
	movlw	00h
	movwf	(?_print_string+1)
	fcall	_print_string
	
l73:	
	goto	l73
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
; =============== function _main ends ============

psect	maintext
	line	240
	signat	_main,88
	global	_efface
psect	text105,local,class=CODE,delta=2
global __ptext105
__ptext105:

; *************** function _efface *****************
; Defined at:
;		line 292 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		_ecriture_commande
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text105
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	292
	global	__size_of_efface
	__size_of_efface	equ	__end_of_efface-_efface
;lcdbt.c: 291: void efface(void)
;lcdbt.c: 292: {
	
_efface:	
	opt stack 5
; Regs used in _efface: [wreg+status,2+status,0+pclath+cstack]
	line	295
	
l30001235:	
;lcdbt.c: 295: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	
l32:	
	return
	opt stack 0
GLOBAL	__end_of_efface
	__end_of_efface:
; =============== function _efface ends ============

psect	text106,local,class=CODE,delta=2
global __ptext106
__ptext106:
	line	296
	signat	_efface,88
	global	_goto_ligne_2

; *************** function _goto_ligne_2 *****************
; Defined at:
;		line 219 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		_ecriture_commande
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text106
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	219
	global	__size_of_goto_ligne_2
	__size_of_goto_ligne_2	equ	__end_of_goto_ligne_2-_goto_ligne_2
;lcdbt.c: 218: void goto_ligne_2(void)
;lcdbt.c: 219: {
	
_goto_ligne_2:	
	opt stack 5
; Regs used in _goto_ligne_2: [wreg+status,2+status,0+pclath+cstack]
	line	222
	
l30001234:	
;lcdbt.c: 222: ecriture_commande(0xC0);
	movlw	(0C0h)
	fcall	_ecriture_commande
	
l24:	
	return
	opt stack 0
GLOBAL	__end_of_goto_ligne_2
	__end_of_goto_ligne_2:
; =============== function _goto_ligne_2 ends ============

psect	text107,local,class=CODE,delta=2
global __ptext107
__ptext107:
	line	224
	signat	_goto_ligne_2,88
	global	_print_string

; *************** function _print_string *****************
; Defined at:
;		line 189 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;  s               2    9[BANK0 ] PTR unsigned char 
;		 -> STR_5(13), montre@buff(50), millivoltmetre@buffer(50), STR_3(14), 
;		 -> STR_4(15), 
; Auto vars:     Size  Location     Type
;  i               2    7[BANK0 ] int 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       6       0       0       0
;      Temp:     2
;      Total:    6
; This function calls:
;		_print_char
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text107
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	189
	global	__size_of_print_string
	__size_of_print_string	equ	__end_of_print_string-_print_string
;lcdbt.c: 188: void print_string(char * s)
;lcdbt.c: 189: {
	
_print_string:	
	opt stack 5
; Regs used in _print_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	192
	
l30001199:	
;lcdbt.c: 192: int i=0;
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(print_string@i)
	movlw	high(0)
	movwf	((print_string@i))+1
	goto	l30001202
	
l30001200:	
	line	195
;lcdbt.c: 194: {
;lcdbt.c: 195: print_char(s[i]);
	movf	(print_string@s+1),w
	movwf	(??_print_string+0+0+1)
	movf	(print_string@s),w
	movwf	(??_print_string+0+0)
	movf	(print_string@i),w
	addwf	(??_print_string+0+0),w
	movwf	fsr0
	movf	(??_print_string+0+1),w
	skipnc
	incf	(??_print_string+0+1),w
	FNCALL _print_string,stringtab
	fcall	stringtab
	fcall	_print_char
	
l30001201:	
	line	196
;lcdbt.c: 196: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(print_string@i),f
	skipnc
	incf	(print_string@i+1),f
	movlw	high(01h)
	addwf	(print_string@i+1),f
	
l30001202:	
	line	193
	movf	(print_string@s+1),w
	movwf	(??_print_string+0+0+1)
	movf	(print_string@s),w
	movwf	(??_print_string+0+0)
	movf	(print_string@i),w
	addwf	(??_print_string+0+0),w
	movwf	fsr0
	movf	(??_print_string+0+1),w
	skipnc
	incf	(??_print_string+0+1),w
	FNCALL _print_string,stringtab
	fcall	stringtab
	iorlw	0
	skipz
	goto	u211
	goto	u210
u211:
	goto	l30001200
u210:
	
l19:	
	return
	opt stack 0
GLOBAL	__end_of_print_string
	__end_of_print_string:
; =============== function _print_string ends ============

psect	text108,local,class=CODE,delta=2
global __ptext108
__ptext108:
	line	199
	signat	_print_string,4216
	global	_go_to

; *************** function _go_to *****************
; Defined at:
;		line 275 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;  x               2    6[BANK0 ] int 
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       3       0       0       0
;      Temp:     1
;      Total:    3
; This function calls:
;		_ecriture_commande
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text108
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	275
	global	__size_of_go_to
	__size_of_go_to	equ	__end_of_go_to-_go_to
;lcdbt.c: 274: void go_to (int x)
;lcdbt.c: 275: {
	
_go_to:	
	opt stack 5
; Regs used in _go_to: [wreg+status,2+status,0+pclath+cstack]
	line	278
	
l30001181:	
;lcdbt.c: 278: if(x<=0x10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(go_to@x+1),w
	xorlw	80h
	movwf	(??_go_to+0+0)
	movlw	(high(011h))^80h
	subwf	(??_go_to+0+0),w
	skipz
	goto	u195
	movlw	low(011h)
	subwf	(go_to@x),w
u195:

	skipnc
	goto	u191
	goto	u190
u191:
	goto	l30001183
u190:
	
l30001182:	
	line	279
;lcdbt.c: 279: ecriture_commande((x-1)|0x80);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(go_to@x),w
	addlw	0FFh
	iorlw	080h
	fcall	_ecriture_commande
	goto	l29
	
l30001183:	
	line	283
;lcdbt.c: 282: else
;lcdbt.c: 283: ecriture_commande(((x-1)&0x0F)|0xC0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(go_to@x),w
	addlw	0FFh
	andlw	0Fh
	iorlw	0C0h
	fcall	_ecriture_commande
	
l29:	
	return
	opt stack 0
GLOBAL	__end_of_go_to
	__end_of_go_to:
; =============== function _go_to ends ============

psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:
	line	286
	signat	_go_to,4216
	global	_allume_LCD

; *************** function _allume_LCD *****************
; Defined at:
;		line 48 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		_init_PORTD
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text109
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	48
	global	__size_of_allume_LCD
	__size_of_allume_LCD	equ	__end_of_allume_LCD-_allume_LCD
;lcdbt.c: 47: void allume_LCD(void)
;lcdbt.c: 48: {
	
_allume_LCD:	
	opt stack 5
; Regs used in _allume_LCD: [status,2+status,0+pclath+cstack]
	line	51
	
l30001009:	
;lcdbt.c: 51: init_PORTD();
	fcall	_init_PORTD
	
l30001010:	
	line	52
;lcdbt.c: 52: RD7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(71/8),(71)&7
	
l10:	
	return
	opt stack 0
GLOBAL	__end_of_allume_LCD
	__end_of_allume_LCD:
; =============== function _allume_LCD ends ============

psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:
	line	54
	signat	_allume_LCD,88
	global	_init_LCD

; *************** function _init_LCD *****************
; Defined at:
;		line 115 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		_tempo_N_ms
;		_ecriture_commande
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text110
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	115
	global	__size_of_init_LCD
	__size_of_init_LCD	equ	__end_of_init_LCD-_init_LCD
;lcdbt.c: 114: void init_LCD(void)
;lcdbt.c: 115: {
	
_init_LCD:	
	opt stack 5
; Regs used in _init_LCD: [wreg+status,2+status,0+pclath+cstack]
	line	116
	
l30001212:	
;lcdbt.c: 116: tempo_N_ms(30);
	movlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001213:	
	line	117
;lcdbt.c: 117: TRISD=0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	
l30001214:	
	line	118
;lcdbt.c: 118: RD7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(71/8),(71)&7
	
l30001215:	
	line	119
;lcdbt.c: 119: RD4=0;
	bcf	(68/8),(68)&7
	
l30001216:	
	line	120
;lcdbt.c: 120: RD6=0;
	bcf	(70/8),(70)&7
	
l30001217:	
	line	121
;lcdbt.c: 121: RD5=0;
	bcf	(69/8),(69)&7
	
l30001218:	
	line	123
;lcdbt.c: 123: PORTD=PORTD|0x03;
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	
l30001219:	
	line	124
;lcdbt.c: 124: RD6=1;
	bsf	(70/8),(70)&7
	
l30001220:	
	line	125
;lcdbt.c: 125: RD6=0;
	bcf	(70/8),(70)&7
	
l30001221:	
	line	126
;lcdbt.c: 126: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001222:	
	line	129
;lcdbt.c: 129: PORTD=PORTD|0x03;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	
l30001223:	
	line	130
;lcdbt.c: 130: RD6=1;
	bsf	(70/8),(70)&7
	
l30001224:	
	line	131
;lcdbt.c: 131: RD6=0;
	bcf	(70/8),(70)&7
	
l30001225:	
	line	132
;lcdbt.c: 132: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001226:	
	line	135
;lcdbt.c: 135: PORTD=PORTD|0x03;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	
l30001227:	
	line	136
;lcdbt.c: 136: RD6=1;
	bsf	(70/8),(70)&7
	
l30001228:	
	line	137
;lcdbt.c: 137: RD6=0;
	bcf	(70/8),(70)&7
	
l30001229:	
	line	138
;lcdbt.c: 138: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001230:	
	line	143
;lcdbt.c: 143: ecriture_commande(0x28);
	movlw	(028h)
	fcall	_ecriture_commande
	
l30001231:	
	line	146
;lcdbt.c: 146: ecriture_commande(0x0F);
	movlw	(0Fh)
	fcall	_ecriture_commande
	
l30001232:	
	line	150
;lcdbt.c: 150: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	
l30001233:	
	line	155
;lcdbt.c: 155: ecriture_commande(0x06);
	movlw	(06h)
	fcall	_ecriture_commande
	
l17:	
	return
	opt stack 0
GLOBAL	__end_of_init_LCD
	__end_of_init_LCD:
; =============== function _init_LCD ends ============

psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:
	line	156
	signat	_init_LCD,88
	global	_print_char

; *************** function _print_char *****************
; Defined at:
;		line 163 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;  car             1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  car             1    4[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       1       0       0       0
;      Temp:     2
;      Total:    3
; This function calls:
;		_attente_bf
; This function is called by:
;		_print_string
;		_main
; This function uses a non-reentrant model
; 
psect	text111
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	163
	global	__size_of_print_char
	__size_of_print_char	equ	__end_of_print_char-_print_char
;lcdbt.c: 162: void print_char( char car)
;lcdbt.c: 163: {
	
_print_char:	
	opt stack 4
; Regs used in _print_char: [wreg+status,2+status,0+pclath+cstack]
;print_char@car stored from wreg
	line	166
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(print_char@car)
	
l30001238:	
;lcdbt.c: 166: attente_bf();
	fcall	_attente_bf
	
l30001239:	
	line	168
;lcdbt.c: 168: PORTD=0xD0;
	movlw	(0D0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l30001240:	
	line	169
;lcdbt.c: 169: PORTD|=((car>>4)&0x0F);
	movf	(print_char@car),w
	movwf	(??_print_char+0+0)
	movlw	04h
u245:
	clrc
	rrf	(??_print_char+0+0),f
	addlw	-1
	skipz
	goto	u245
	movf	0+(??_print_char+0+0),w
	andlw	0Fh
	movwf	(??_print_char+1+0)
	movf	(??_print_char+1+0),w
	iorwf	(8),f	;volatile
	
l30001241:	
	line	171
;lcdbt.c: 171: RD6=0;
	bcf	(70/8),(70)&7
	
l30001242:	
	line	173
;lcdbt.c: 173: PORTD=0xD0;
	movlw	(0D0h)
	movwf	(8)	;volatile
	
l30001243:	
	line	174
;lcdbt.c: 174: PORTD|=(car & 0x0F);
	movf	(print_char@car),w
	andlw	0Fh
	movwf	(??_print_char+0+0)
	movf	(??_print_char+0+0),w
	iorwf	(8),f	;volatile
	
l30001244:	
	line	178
;lcdbt.c: 178: RD6=0;
	bcf	(70/8),(70)&7
	
l18:	
	return
	opt stack 0
GLOBAL	__end_of_print_char
	__end_of_print_char:
; =============== function _print_char ends ============

psect	text112,local,class=CODE,delta=2
global __ptext112
__ptext112:
	line	182
	signat	_print_char,4216
	global	_ecriture_commande

; *************** function _ecriture_commande *****************
; Defined at:
;		line 95 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;  commande        1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  commande        1    4[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       1       0       0       0
;      Temp:     1
;      Total:    2
; This function calls:
;		_attente_bf
; This function is called by:
;		_init_LCD
;		_goto_ligne_2
;		_go_to
;		_efface
; This function uses a non-reentrant model
; 
psect	text112
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	95
	global	__size_of_ecriture_commande
	__size_of_ecriture_commande	equ	__end_of_ecriture_commande-_ecriture_commande
;lcdbt.c: 94: void ecriture_commande(char commande)
;lcdbt.c: 95: {
	
_ecriture_commande:	
	opt stack 4
; Regs used in _ecriture_commande: [wreg+status,2+status,0+pclath+cstack]
;ecriture_commande@commande stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ecriture_commande@commande)
	
l30001203:	
	line	96
;lcdbt.c: 96: attente_bf();
	fcall	_attente_bf
	
l30001204:	
	line	97
;lcdbt.c: 97: RD5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(69/8),(69)&7
	
l30001205:	
	line	98
;lcdbt.c: 98: RD4=0;
	bcf	(68/8),(68)&7
	
l30001206:	
	line	99
;lcdbt.c: 99: PORTD=((commande>>4)&0x0F)|0x80;
	movf	(ecriture_commande@commande),w
	movwf	(??_ecriture_commande+0+0)
	movlw	04h
u225:
	clrc
	rrf	(??_ecriture_commande+0+0),f
	addlw	-1
	skipz
	goto	u225
	movf	0+(??_ecriture_commande+0+0),w
	andlw	0Fh
	iorlw	080h
	movwf	(8)	;volatile
	
l30001207:	
	line	101
;lcdbt.c: 101: RD6=1;
	bsf	(70/8),(70)&7
	
l30001208:	
	line	102
;lcdbt.c: 102: RD6=0;
	bcf	(70/8),(70)&7
	
l30001209:	
	line	104
;lcdbt.c: 104: PORTD=(commande&0x0F)|0x80;
	movf	(ecriture_commande@commande),w
	andlw	0Fh
	iorlw	080h
	movwf	(8)	;volatile
	
l30001210:	
	line	106
;lcdbt.c: 106: RD6=1;
	bsf	(70/8),(70)&7
	
l30001211:	
	line	107
;lcdbt.c: 107: RD6=0;
	bcf	(70/8),(70)&7
	
l16:	
	return
	opt stack 0
GLOBAL	__end_of_ecriture_commande
	__end_of_ecriture_commande:
; =============== function _ecriture_commande ends ============

psect	text113,local,class=CODE,delta=2
global __ptext113
__ptext113:
	line	108
	signat	_ecriture_commande,4216
	global	_init_PORTD

; *************** function _init_PORTD *****************
; Defined at:
;		line 34 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		None
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		_allume_LCD
;		_main
; This function uses a non-reentrant model
; 
psect	text113
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	34
	global	__size_of_init_PORTD
	__size_of_init_PORTD	equ	__end_of_init_PORTD-_init_PORTD
;lcdbt.c: 33: void init_PORTD(void)
;lcdbt.c: 34: {
	
_init_PORTD:	
	opt stack 4
; Regs used in _init_PORTD: []
	line	37
	
l30001008:	
;lcdbt.c: 37: TRISD4=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1092/8)^080h,(1092)&7
	line	38
;lcdbt.c: 38: TRISD5=0;
	bcf	(1093/8)^080h,(1093)&7
	line	39
;lcdbt.c: 39: TRISD6=0;
	bcf	(1094/8)^080h,(1094)&7
	line	40
;lcdbt.c: 40: TRISD7=1;
	bsf	(1095/8)^080h,(1095)&7
	
l9:	
	return
	opt stack 0
GLOBAL	__end_of_init_PORTD
	__end_of_init_PORTD:
; =============== function _init_PORTD ends ============

psect	text114,local,class=CODE,delta=2
global __ptext114
__ptext114:
	line	42
	signat	_init_PORTD,88
	global	_attente_bf

; *************** function _attente_bf *****************
; Defined at:
;		line 86 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		_lecture_commande
; This function is called by:
;		_ecriture_commande
;		_print_char
; This function uses a non-reentrant model
; 
psect	text114
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	86
	global	__size_of_attente_bf
	__size_of_attente_bf	equ	__end_of_attente_bf-_attente_bf
;lcdbt.c: 85: void attente_bf(void)
;lcdbt.c: 86: {
	
_attente_bf:	
	opt stack 3
; Regs used in _attente_bf: [wreg+status,2+status,0+pclath+cstack]
	
l30001236:	
	
l30001237:	
	line	87
	fcall	_lecture_commande
	movwf	(??_attente_bf+0+0)
	btfsc	0+(??_attente_bf+0+0),(7)&7
	goto	u231
	goto	u230
u231:
	goto	l30001237
u230:
	
l12:	
	return
	opt stack 0
GLOBAL	__end_of_attente_bf
	__end_of_attente_bf:
; =============== function _attente_bf ends ============

psect	text115,local,class=CODE,delta=2
global __ptext115
__ptext115:
	line	88
	signat	_attente_bf,88
	global	_lecture_commande

; *************** function _lecture_commande *****************
; Defined at:
;		line 62 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;  quartet_comm    1    2[BANK0 ] unsigned char 
;  commande        1    3[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       2       0       0       0
;      Temp:     1
;      Total:    3
; This function calls:
;		_tempo_N_ms
; This function is called by:
;		_attente_bf
; This function uses a non-reentrant model
; 
psect	text115
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	62
	global	__size_of_lecture_commande
	__size_of_lecture_commande	equ	__end_of_lecture_commande-_lecture_commande
;lcdbt.c: 61: unsigned char lecture_commande (void)
;lcdbt.c: 62: {
	
_lecture_commande:	
	opt stack 2
; Regs used in _lecture_commande: [wreg+status,2+status,0+pclath+cstack]
	line	64
	
l30001245:	
;lcdbt.c: 63: unsigned char commande, quartet_commande;
;lcdbt.c: 64: TRISD=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	
l30001246:	
	line	65
;lcdbt.c: 65: RD5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(69/8),(69)&7
	
l30001247:	
	line	66
;lcdbt.c: 66: RD4=0;
	bcf	(68/8),(68)&7
	
l30001248:	
	line	67
;lcdbt.c: 67: tempo_N_ms(2);
	movlw	low(02h)
	movwf	(?_tempo_N_ms)
	movlw	high(02h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001249:	
	line	68
;lcdbt.c: 68: RD6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(70/8),(70)&7
	
l30001250:	
	line	69
;lcdbt.c: 69: quartet_commande=PORTD;
	movf	(8),w	;volatile
	movwf	(lecture_commande@quartet_commande)
	
l30001251:	
	line	70
;lcdbt.c: 70: commande=((quartet_commande<<4)& 0xF0);
	movf	(lecture_commande@quartet_commande),w
	movwf	(??_lecture_commande+0+0)
	movlw	(04h)-1
u255:
	clrc
	rlf	(??_lecture_commande+0+0),f
	addlw	-1
	skipz
	goto	u255
	clrc
	rlf	(??_lecture_commande+0+0),w
	andlw	0F0h
	movwf	(lecture_commande@commande)
	
l30001252:	
	line	71
;lcdbt.c: 71: RD6=0;
	bcf	(70/8),(70)&7
	
l30001253:	
	line	72
;lcdbt.c: 72: RD6=1;
	bsf	(70/8),(70)&7
	
l30001254:	
	line	73
;lcdbt.c: 73: quartet_commande=PORTD;
	movf	(8),w	;volatile
	movwf	(lecture_commande@quartet_commande)
	
l30001255:	
	line	74
;lcdbt.c: 74: commande=commande|(quartet_commande & 0x0F);
	movf	(lecture_commande@quartet_commande),w
	andlw	0Fh
	iorwf	(lecture_commande@commande),w
	movwf	(lecture_commande@commande)
	
l30001256:	
	line	75
;lcdbt.c: 75: RD6=0;
	bcf	(70/8),(70)&7
	
l30001257:	
	line	76
;lcdbt.c: 76: RD5=0;
	bcf	(69/8),(69)&7
	
l30001258:	
	line	77
;lcdbt.c: 77: TRISD=0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	
l30001259:	
	line	78
;lcdbt.c: 78: return(commande);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lecture_commande@commande),w
	
l11:	
	return
	opt stack 0
GLOBAL	__end_of_lecture_commande
	__end_of_lecture_commande:
; =============== function _lecture_commande ends ============

psect	text116,local,class=CODE,delta=2
global __ptext116
__ptext116:
	line	79
	signat	_lecture_commande,89
	global	_tempo_N_ms

; *************** function _tempo_N_ms *****************
; Defined at:
;		line 17 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;  N               2    0[BANK0 ] int 
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       2       0       0       0
;      Temp:     0
;      Total:    2
; This function calls:
;		_tempo_1_ms
; This function is called by:
;		_lecture_commande
;		_init_LCD
;		_main
; This function uses a non-reentrant model
; 
psect	text116
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	17
	global	__size_of_tempo_N_ms
	__size_of_tempo_N_ms	equ	__end_of_tempo_N_ms-_tempo_N_ms
;lcdbt.c: 16: void tempo_N_ms(int N)
;lcdbt.c: 17: {
	
_tempo_N_ms:	
	opt stack 1
; Regs used in _tempo_N_ms: [wreg+status,2+status,0+pclath+cstack]
	line	19
	
l30001261:	
;lcdbt.c: 19: OPTION=OPTION & 0b11000001;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(129)^080h,w
	andlw	0C1h
	movwf	(129)^080h
	
l30001262:	
	line	20
;lcdbt.c: 20: TMR0=6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	
l30001263:	
	line	21
;lcdbt.c: 21: T0IF=0;
	bcf	(90/8),(90)&7
	goto	l30001265
	
l30001264:	
	line	23
	fcall	_tempo_1_ms
	
l30001265:	
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(tempo_N_ms@N),f
	skipnc
	incf	(tempo_N_ms@N+1),f
	movlw	high(-1)
	addwf	(tempo_N_ms@N+1),f
	movlw	high(-1)
	xorwf	((tempo_N_ms@N+1))&07fh,w
	skipz
	goto	u265
	movlw	low(-1)
	xorwf	((tempo_N_ms@N))&07fh,w
u265:

	skipz
	goto	u261
	goto	u260
u261:
	goto	l30001264
u260:
	
l5:	
	return
	opt stack 0
GLOBAL	__end_of_tempo_N_ms
	__end_of_tempo_N_ms:
; =============== function _tempo_N_ms ends ============

psect	text117,local,class=CODE,delta=2
global __ptext117
__ptext117:
	line	24
	signat	_tempo_N_ms,4216
	global	_tempo_1_ms

; *************** function _tempo_1_ms *****************
; Defined at:
;		line 12 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		None
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		_tempo_N_ms
; This function uses a non-reentrant model
; 
psect	text117
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\lcdbt.c"
	line	12
	global	__size_of_tempo_1_ms
	__size_of_tempo_1_ms	equ	__end_of_tempo_1_ms-_tempo_1_ms
;lcdbt.c: 11: void tempo_1_ms(void)
;lcdbt.c: 12: { while(!T0IF);
	
_tempo_1_ms:	
	opt stack 0
; Regs used in _tempo_1_ms: []
	
l30001266:	
	
l2:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(90/8),(90)&7
	goto	u271
	goto	u270
u271:
	goto	l2
u270:
	
l4:	
	line	13
;lcdbt.c: 13: T0IF=0;
	bcf	(90/8),(90)&7
	
l1:	
	return
	opt stack 0
GLOBAL	__end_of_tempo_1_ms
	__end_of_tempo_1_ms:
; =============== function _tempo_1_ms ends ============

psect	text118,local,class=CODE,delta=2
global __ptext118
__ptext118:
	line	14
	signat	_tempo_1_ms,88
	global	_timer1_it

; *************** function _timer1_it *****************
; Defined at:
;		line 80 in file "C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\test lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       4       0       0       0
;      Temp:     4
;      Total:    4
; This function calls:
;		Nothing
; This function is called by:
;		Interrupt level 1
; This function uses a non-reentrant model
; 
psect	text118
	file	"C:\Users\ACER\Desktop\TP microcontroller000\d_pic_ii\prog_c\test lcd\test lcd.c"
	line	80
	global	__size_of_timer1_it
	__size_of_timer1_it	equ	__end_of_timer1_it-_timer1_it
;test lcd.c: 77: volatile int COUNT=0;
;test lcd.c: 78: int seconde=0,minute=0,heure=0;
;test lcd.c: 79: void interrupt timer1_it (void)
;test lcd.c: 80: {
	
_timer1_it:	
	opt stack 1
; Regs used in _timer1_it: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+1
	movwf	saved_w
	movf	status,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_timer1_it+0)
	movf	fsr0,w
	movwf	(??_timer1_it+1)
	movf	pclath,w
	movwf	(??_timer1_it+2)
	movf	btemp+0,w
	movwf	(??_timer1_it+3)
	ljmp	_timer1_it
psect	text118
	line	82
	
i1l30001179:	
;test lcd.c: 82: TMR1IF = 0;
	bcf	(96/8),(96)&7
	
i1l30001180:	
	line	83
;test lcd.c: 83: TMR1H=0x3C;
	movlw	(03Ch)
	movwf	(15)	;volatile
	line	84
;test lcd.c: 84: TMR1L=0xC6;
	movlw	(0C6h)
	movwf	(14)	;volatile
	line	85
;test lcd.c: 85: COUNT++;
	movlw	low(01h)
	addwf	(_COUNT),f	;volatile
	skipnc
	incf	(_COUNT+1),f	;volatile
	movlw	high(01h)
	addwf	(_COUNT+1),f	;volatile
	
i1l53:	
	movf	(??_timer1_it+3),w
	movwf	btemp+0
	movf	(??_timer1_it+2),w
	movwf	pclath
	movf	(??_timer1_it+1),w
	movwf	fsr0
	movf	(??_timer1_it+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_timer1_it
	__end_of_timer1_it:
; =============== function _timer1_it ends ============

psect	text119,local,class=CODE,delta=2
global __ptext119
__ptext119:
	line	87
	signat	_timer1_it,88
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	end
