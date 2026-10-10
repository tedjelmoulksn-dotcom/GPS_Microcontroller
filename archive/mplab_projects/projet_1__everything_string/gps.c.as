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
# 8 "E:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
	psect config,class=CONFIG,delta=2 ;#
# 8 "E:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
	dw 0x3FFE & 0x3FFB & 0x3FFF & 0x3F7F ;#
;BANK0:	_main->_print_string
;BANK0:	_print_string->_print_char
;COMMON:	_print_char->_attente_bf
;COMMON:	_attente_bf->_lecture_commande
;COMMON:	_lecture_commande->_tempo_N_ms
;BANK0:	_lecture_commande->_tempo_N_ms
;BANK0:	_attente_bf->_lecture_commande
;COMMON:	_lecture_commande->_tempo_N_ms
;BANK0:	_lecture_commande->_tempo_N_ms
	FNCALL	_main,_init_PORTD
	FNCALL	_main,_allume_LCD
	FNCALL	_main,_init_LCD
	FNCALL	_main,_init_gps_mode_smart
	FNCALL	_main,_init_liaison_serie
	FNCALL	_main,_efface
	FNCALL	_main,_goto_ligne_1
	FNCALL	_main,_print_string
	FNCALL	_main,_tempo_N_ms
	FNCALL	_main,_request_gps
	FNCALL	_main,___awdiv
	FNCALL	_main,_print_char
	FNCALL	_main,___awmod
	FNCALL	_main,_goto_ligne_2
	FNCALL	_main,___lwdiv
	FNCALL	_main,___lwmod
	FNCALL	_print_string,_print_char
	FNCALL	_request_gps,_emet_string
	FNCALL	_request_gps,_emet_car
	FNCALL	_request_gps,_tempo_N_ms
	FNCALL	_request_gps,_recoit_car
	FNCALL	_efface,_ecriture_commande
	FNCALL	_goto_ligne_1,_ecriture_commande
	FNCALL	_goto_ligne_2,_ecriture_commande
	FNCALL	_allume_LCD,_init_PORTD
	FNCALL	_init_LCD,_tempo_N_ms
	FNCALL	_init_LCD,_ecriture_commande
	FNCALL	_init_gps_mode_smart,_tempo_N_ms
	FNCALL	_emet_string,_emet_car
	FNCALL	_print_char,_attente_bf
	FNCALL	_ecriture_commande,_attente_bf
	FNCALL	_attente_bf,_lecture_commande
	FNCALL	_lecture_commande,_tempo_N_ms
	FNCALL	_tempo_N_ms,_tempo_1_ms
	FNROOT	_main
	global	_workVal
	global	_message
	global	_car
	global	_commande
	global	_day
	global	_dir
	global	_month
	global	_tmHrs
	global	_tmMins
	global	_minutesD
	global	_degrees
	global	_minutes
	global	_tmSecs
	global	_year
	global	_debug
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:
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
	
STR_1:	
	retlw	68	;'D'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_2:	
	retlw	84	;'T'
	retlw	105	;'i'
	retlw	109	;'m'
	retlw	101	;'e'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_4:	
	retlw	76	;'L'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_3:	
	retlw	76	;'L'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_5:	
	retlw	33	;'!'
	retlw	71	;'G'
	retlw	80	;'P'
	retlw	83	;'S'
	retlw	0
psect	strings
	file	"gps.c.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_minutesD:
       ds      2

_degrees:
       ds      1

_minutes:
       ds      1

_tmSecs:
       ds      1

_year:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_workVal:
       ds      4

_message:
       ds      2

_car:
       ds      1

_commande:
       ds      1

_day:
       ds      1

_dir:
       ds      1

_month:
       ds      1

_tmHrs:
       ds      1

_tmMins:
       ds      1

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
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
	clrf	((__pbssBANK0)+12)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init_liaison_serie
?_init_liaison_serie: ;@ 0x0
	global	??_init_liaison_serie
??_init_liaison_serie: ;@ 0x0
	global	?_allume_LCD
?_allume_LCD: ;@ 0x0
	global	??___awdiv
??___awdiv: ;@ 0x0
	global	??___lwdiv
??___lwdiv: ;@ 0x0
	global	??___awmod
??___awmod: ;@ 0x0
	global	??_allume_LCD
??_allume_LCD: ;@ 0x0
	global	??_emet_car
??_emet_car: ;@ 0x0
	global	??_tempo_N_ms
??_tempo_N_ms: ;@ 0x0
	global	??_tempo_1_ms
??_tempo_1_ms: ;@ 0x0
	global	??_recoit_car
??_recoit_car: ;@ 0x0
	global	?_init_PORTD
?_init_PORTD: ;@ 0x0
	global	??_init_PORTD
??_init_PORTD: ;@ 0x0
	global	?_recoit_car
?_recoit_car: ;@ 0x0
	global	emet_car@car
emet_car@car:	; 1 bytes @ 0x0
	ds	1
	global	??_init_gps_mode_smart
??_init_gps_mode_smart: ;@ 0x1
	global	??_lecture_commande
??_lecture_commande: ;@ 0x1
	global	??_emet_string
??_emet_string: ;@ 0x1
	global	??___lwmod
??___lwmod: ;@ 0x1
	global	?_init_gps_mode_smart
?_init_gps_mode_smart: ;@ 0x1
	global	?_emet_car
?_emet_car: ;@ 0x1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x1
	ds	1
	global	??_attente_bf
??_attente_bf: ;@ 0x2
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x2
	global	emet_string@message
emet_string@message:	; 1 bytes @ 0x2
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x2
	ds	1
	global	?_emet_string
?_emet_string: ;@ 0x3
	global	??_ecriture_commande
??_ecriture_commande: ;@ 0x3
	global	??_print_string
??_print_string: ;@ 0x3
	global	?_request_gps
?_request_gps: ;@ 0x3
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_goto_ligne_2
??_goto_ligne_2: ;@ 0x0
	global	??_goto_ligne_1
??_goto_ligne_1: ;@ 0x0
	global	??_init_LCD
??_init_LCD: ;@ 0x0
	global	?_tempo_1_ms
?_tempo_1_ms: ;@ 0x0
	global	??_efface
??_efface: ;@ 0x0
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x0
	global	?___awmod
?___awmod: ;@ 0x0
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x0
	global	tempo_N_ms@i
tempo_N_ms@i:	; 2 bytes @ 0x0
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x0
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	?_tempo_N_ms
?_tempo_N_ms: ;@ 0x2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x2
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x2
	global	tempo_N_ms@N
tempo_N_ms@N:	; 2 bytes @ 0x2
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x2
	ds	1
	global	?___lwdiv
?___lwdiv: ;@ 0x3
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x3
	ds	1
	global	??_request_gps
??_request_gps: ;@ 0x4
	global	lecture_commande@quartet_commande
lecture_commande@quartet_commande:	; 1 bytes @ 0x4
	global	?___awdiv
?___awdiv: ;@ 0x4
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x4
	ds	1
	global	lecture_commande@commande
lecture_commande@commande:	; 1 bytes @ 0x5
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x5
	ds	1
	global	?_attente_bf
?_attente_bf: ;@ 0x6
	global	??_print_char
??_print_char: ;@ 0x6
	global	?_lecture_commande
?_lecture_commande: ;@ 0x6
	global	ecriture_commande@commande
ecriture_commande@commande:	; 1 bytes @ 0x6
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?_goto_ligne_1
?_goto_ligne_1: ;@ 0x7
	global	?_ecriture_commande
?_ecriture_commande: ;@ 0x7
	global	?_efface
?_efface: ;@ 0x7
	global	?_init_LCD
?_init_LCD: ;@ 0x7
	global	?_goto_ligne_2
?_goto_ligne_2: ;@ 0x7
	global	?___lwmod
?___lwmod: ;@ 0x7
	global	request_gps@commande
request_gps@commande:	; 1 bytes @ 0x7
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x7
	ds	1
	global	request_gps@low_byte
request_gps@low_byte:	; 1 bytes @ 0x8
	global	print_char@car
print_char@car:	; 1 bytes @ 0x8
	ds	1
	global	?_print_char
?_print_char: ;@ 0x9
	global	request_gps@high_byte
request_gps@high_byte:	; 1 bytes @ 0x9
	global	print_string@s
print_string@s:	; 1 bytes @ 0x9
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x9
	ds	1
	global	print_string@i
print_string@i:	; 2 bytes @ 0xA
	ds	2
	global	??_main
??_main: ;@ 0xC
	global	?_print_string
?_print_string: ;@ 0xC
	ds	2
	global	?_main
?_main: ;@ 0xE
;Data sizes: Strings 32, constant 0, data 0, bss 19, persistent 0 stack 0
;Auto spaces:   Size  Autos    Used
; COMMON          13      4      10
; BANK0           80     14      27
; BANK1           80      0       0
; BANK3           96      0       0
; BANK2           96      0       0


;Pointer list with targets:

;print_string@s	PTR unsigned char  size(1); Largest target is 7
;		 -> STR_1(CODE[7]), STR_3(CODE[6]), STR_2(CODE[7]), STR_4(CODE[7]), 
;emet_string@message	PTR unsigned char  size(1); Largest target is 5
;		 -> STR_5(CODE[5]), 
;?___lwmod	unsigned int  size(1); Largest target is 0
;?___lwdiv	unsigned int  size(1); Largest target is 0
;?___awmod	int  size(1); Largest target is 0
;?___awdiv	int  size(1); Largest target is 0


;Main: autosize = 0, tempsize = 2, incstack = 0, save=0


;Call graph:                      Base Space Used Autos Args Refs Density
;_main                                                2    0 2190   0.00
;                                   12 BANK0    2
;         _init_PORTD
;         _allume_LCD
;           _init_LCD
;_init_gps_mode_smart
; _init_liaison_serie
;             _efface
;       _goto_ligne_1
;       _print_string
;         _tempo_N_ms
;        _request_gps
;            ___awdiv
;         _print_char
;            ___awmod
;       _goto_ligne_2
;            ___lwdiv
;            ___lwmod
;  _print_string                                      3    0  252   0.00
;                                    9 BANK0    3
;         _print_char
;  _request_gps                                       6    0  289   0.00
;                                    4 BANK0    6
;        _emet_string
;           _emet_car
;         _tempo_N_ms
;         _recoit_car
;  _efface                                            0    0  150   0.00
;  _ecriture_commande
;  _goto_ligne_1                                      0    0  150   0.00
;  _ecriture_commande
;  ___awdiv                                           5    4  222   0.00
;                                    0 COMMO    1
;                                    0 BANK0    8
;  ___lwdiv                                           4    4  120   0.00
;                                    0 COMMO    1
;                                    0 BANK0    7
;  ___lwmod                                           2    4  237   0.00
;                                    1 COMMO    2
;                                    7 BANK0    4
;            ___lwdiv (ARG)
;  ___awmod                                           3    4  218   0.00
;                                    0 COMMO    3
;                                    0 BANK0    4
;  _goto_ligne_2                                      0    0  150   0.00
;  _ecriture_commande
;  _init_liaison_serie                                0    0    0   0.00
;  _allume_LCD                                        0    0    0   0.00
;         _init_PORTD
;  _init_LCD                                          0    0  184   0.00
;         _tempo_N_ms
;  _ecriture_commande
;  _init_gps_mode_smart                               0    0   34   0.00
;         _tempo_N_ms
;    _emet_string                                     2    0   75   0.00
;                                    1 COMMO    2
;           _emet_car
;    _recoit_car                                      0    0    0   0.00
;    _init_PORTD                                      0    0    0   0.00
;    _print_char                                      3    0  150   0.00
;                                    6 BANK0    3
;         _attente_bf
;    _ecriture_commande                               2    0  150   0.00
;                                    3 COMMO    1
;                                    6 BANK0    1
;         _attente_bf
;      _emet_car                                      1    0   24   0.00
;                                    0 COMMO    1
;      _attente_bf                                    1    0  102   0.00
;                                    2 COMMO    1
;   _lecture_commande
;        _lecture_commande                            3    0  102   0.00
;                                    1 COMMO    1
;                                    4 BANK0    2
;         _tempo_N_ms
;          _tempo_N_ms                                3    2   34   0.00
;                                    0 COMMO    1
;                                    0 BANK0    4
;         _tempo_1_ms
;            _tempo_1_ms                              0    0    0   0.00
; Estimated maximum call depth 6
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
;ABS                  0      0      25       2        0.0%
;STACK                0      0       0       3        0.0%
;BITBANK0            50      0       0       4        0.0%
;SFR3                 0      0       0       4        0.0%
;BITSFR3              0      0       0       4        0.0%
;BANK0               50      E      1B       5       33.8%
;BITSFR2              0      0       0       5        0.0%
;SFR2                 0      0       0       5        0.0%
;BITBANK1            50      0       0       6        0.0%
;BANK1               50      0       0       7        0.0%
;BITBANK3            60      0       0       8        0.0%
;BANK3               60      0       0       9        0.0%
;BITBANK2            60      0       0      10        0.0%
;BANK2               60      0       0      11        0.0%
;DATA                 0      0      25      12        0.0%
;EEDATA             100      0       0    1000        0.0%

	global	_main
psect	maintext,local,class=CODE,delta=2
global __pmaintext
__pmaintext:

; *************** function _main *****************
; Defined at:
;		line 32 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
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
;      Locals:         0       2       0       0       0
;      Temp:     2
;      Total:    2
; This function calls:
;		_init_PORTD
;		_allume_LCD
;		_init_LCD
;		_init_gps_mode_smart
;		_init_liaison_serie
;		_efface
;		_goto_ligne_1
;		_print_string
;		_tempo_N_ms
;		_request_gps
;		___awdiv
;		_print_char
;		___awmod
;		_goto_ligne_2
;		___lwdiv
;		___lwmod
; This function is called by:
;		Startup code after reset
; This function uses a non-reentrant model
; 
psect	maintext
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
	line	32
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
;gps.c: 8: asm("\tpsect config,class=CONFIG,delta=2"); asm("\tdw ""0x3FFE & 0x3FFB & 0x3FFF & 0x3F7F");
;gps.c: 17: char debug @0x70;
;gps.c: 18: unsigned char tmHrs;
;gps.c: 19: unsigned char tmMins;
;gps.c: 20: unsigned char tmSecs;
;gps.c: 21: unsigned char day;
;gps.c: 22: unsigned char month;
;gps.c: 23: unsigned char year;
;gps.c: 24: unsigned char degrees;
;gps.c: 25: unsigned char minutes;
;gps.c: 26: unsigned char dir;
;gps.c: 27: unsigned int minutesD;
;gps.c: 28: unsigned long workVal;
;gps.c: 32: void main(void) {
	
_main:	
	opt stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	36
	
l30001674:	
;gps.c: 36: init_PORTD();
	fcall	_init_PORTD
	line	37
;gps.c: 37: allume_LCD();
	fcall	_allume_LCD
	
l30001675:	
	line	38
;gps.c: 38: init_LCD();
	fcall	_init_LCD
	
l30001676:	
	line	41
;gps.c: 41: init_gps_mode_smart();
	fcall	_init_gps_mode_smart
	
l30001677:	
	line	45
;gps.c: 45: init_liaison_serie();
	fcall	_init_liaison_serie
	
l30001678:	
	line	52
;gps.c: 50: {
;gps.c: 52: efface();
	fcall	_efface
	
l30001679:	
	line	53
;gps.c: 53: goto_ligne_1();
	fcall	_goto_ligne_1
	
l30001680:	
	line	54
;gps.c: 54: print_string("Date: ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_print_string
	
l30001681:	
	line	55
;gps.c: 55: tempo_N_ms(160);
	movlw	low(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001682:	
	line	56
;gps.c: 56: request_gps(0x04);
	movlw	(04h)
	fcall	_request_gps
	
l30001683:	
	line	58
;gps.c: 58: tempo_N_ms(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001684:	
	line	59
;gps.c: 59: tempo_N_ms(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001685:	
	line	60
;gps.c: 60: print_char(day / 100 + '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_day),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(064h)
	movwf	0+(?___awdiv)+02h
	movlw	high(064h)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001686:	
	line	61
;gps.c: 61: print_char(day % 100 + '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_day),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(064h)
	movwf	0+(?___awmod)+02h
	movlw	high(064h)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001687:	
	line	62
;gps.c: 62: print_char('/');
	movlw	(02Fh)
	fcall	_print_char
	
l30001688:	
	line	63
;gps.c: 63: print_char(month / 100+ '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_month),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(064h)
	movwf	0+(?___awdiv)+02h
	movlw	high(064h)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001689:	
	line	64
;gps.c: 64: print_char(month % 100+ '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_month),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(064h)
	movwf	0+(?___awmod)+02h
	movlw	high(064h)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001690:	
	line	65
;gps.c: 65: print_char('/');
	movlw	(02Fh)
	fcall	_print_char
	
l30001691:	
	line	66
;gps.c: 66: print_char(year / 100+'0');
	movf	(_year),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(064h)
	movwf	0+(?___awdiv)+02h
	movlw	high(064h)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001692:	
	line	67
;gps.c: 67: print_char(year % 100+'0');
	movf	(_year),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(064h)
	movwf	0+(?___awmod)+02h
	movlw	high(064h)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001693:	
	line	69
;gps.c: 69: tempo_N_ms(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001694:	
	line	72
;gps.c: 72: goto_ligne_2();
	fcall	_goto_ligne_2
	
l30001695:	
	line	73
;gps.c: 73: print_string("Time: ");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_print_string
	
l30001696:	
	line	75
;gps.c: 75: tempo_N_ms(160);
	movlw	low(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001697:	
	line	76
;gps.c: 76: request_gps(0x03);
	movlw	(03h)
	fcall	_request_gps
	
l30001698:	
	line	77
;gps.c: 77: print_char(tmHrs / 10 + '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmHrs),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001699:	
	line	78
;gps.c: 78: print_char(tmHrs % 10 + '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmHrs),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001700:	
	line	79
;gps.c: 79: print_char(':');
	movlw	(03Ah)
	fcall	_print_char
	
l30001701:	
	line	80
;gps.c: 80: print_char(tmMins / 10 + '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmMins),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001702:	
	line	81
;gps.c: 81: print_char(tmMins % 10 + '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmMins),w
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001703:	
	line	82
;gps.c: 82: print_char(':');
	movlw	(03Ah)
	fcall	_print_char
	
l30001704:	
	line	83
;gps.c: 83: print_char(tmSecs / 10 + '0');
	movf	(_tmSecs),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001705:	
	line	84
;gps.c: 84: print_char(tmSecs % 10 + '0');
	movf	(_tmSecs),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001706:	
	line	87
;gps.c: 87: tempo_N_ms(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001707:	
	line	91
;gps.c: 91: efface();
	fcall	_efface
	
l30001708:	
	line	92
;gps.c: 92: goto_ligne_1();
	fcall	_goto_ligne_1
	
l30001709:	
	line	93
;gps.c: 93: print_string("Lat: ");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_print_string
	
l30001710:	
	line	95
;gps.c: 95: tempo_N_ms(160);
	movlw	low(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001711:	
	line	96
;gps.c: 96: request_gps(0x05);
	movlw	(05h)
	fcall	_request_gps
	
l30001712:	
	line	97
;gps.c: 97: print_char(degrees / 10 + '0');
	movf	(_degrees),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001713:	
	line	98
;gps.c: 98: print_char(degrees % 10 + '0');
	movf	(_degrees),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001714:	
	line	99
;gps.c: 99: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	
l30001715:	
	line	100
;gps.c: 100: print_char(minutes / 10 + '0');
	movf	(_minutes),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001716:	
	line	101
;gps.c: 101: print_char(minutes % 10 + '0');
	movf	(_minutes),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001717:	
	line	102
;gps.c: 102: print_char('.');
	movlw	(02Eh)
	fcall	_print_char
	
l30001718:	
	line	103
;gps.c: 103: print_char((minutesD / 1000) % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(_minutesD),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movlw	low(03E8h)
	movwf	0+(?___lwdiv)+02h
	movlw	high(03E8h)
	movwf	(0+(?___lwdiv)+02h)+1
	fcall	___lwdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(0+(?___lwdiv)),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001719:	
	line	104
;gps.c: 104: print_char((minutesD / 100) % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(_minutesD),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movlw	low(064h)
	movwf	0+(?___lwdiv)+02h
	movlw	high(064h)
	movwf	(0+(?___lwdiv)+02h)+1
	fcall	___lwdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(0+(?___lwdiv)),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001720:	
	line	105
;gps.c: 105: print_char((minutesD / 10) % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(_minutesD),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movlw	low(0Ah)
	movwf	0+(?___lwdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwdiv)+02h)+1
	fcall	___lwdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(0+(?___lwdiv)),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001721:	
	line	106
;gps.c: 106: print_char(minutesD % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(_minutesD),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001722:	
	line	107
;gps.c: 107: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	
l30001723:	
	line	108
;gps.c: 108: print_char(dir);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_dir),w
	fcall	_print_char
	
l30001724:	
	line	109
;gps.c: 109: tempo_N_ms(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001725:	
	line	114
;gps.c: 114: goto_ligne_2();
	fcall	_goto_ligne_2
	
l30001726:	
	line	115
;gps.c: 115: print_string("Long: ");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_print_string
	
l30001727:	
	line	117
;gps.c: 117: tempo_N_ms(160);
	movlw	low(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001728:	
	line	118
;gps.c: 118: request_gps(0x06);
	movlw	(06h)
	fcall	_request_gps
	
l30001729:	
	line	119
;gps.c: 119: print_char(degrees / 10 + '0');
	movf	(_degrees),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001730:	
	line	120
;gps.c: 120: print_char(degrees % 10 + '0');
	movf	(_degrees),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001731:	
	line	121
;gps.c: 121: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	
l30001732:	
	line	122
;gps.c: 122: print_char(minutes / 10 + '0');
	movf	(_minutes),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awdiv)
	movf	1+(??_main+0+0),w
	movwf	(?___awdiv+1)
	movlw	low(0Ah)
	movwf	0+(?___awdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	
l30001733:	
	line	123
;gps.c: 123: print_char(minutes % 10 + '0');
	movf	(_minutes),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	clrf	(??_main+0+0+1)
	movf	0+(??_main+0+0),w
	movwf	(?___awmod)
	movf	1+(??_main+0+0),w
	movwf	(?___awmod+1)
	movlw	low(0Ah)
	movwf	0+(?___awmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___awmod)+02h)+1
	fcall	___awmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	
l30001734:	
	line	124
;gps.c: 124: print_char('.');
	movlw	(02Eh)
	fcall	_print_char
	
l30001735:	
	line	125
;gps.c: 125: print_char((minutesD / 1000) % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(_minutesD),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movlw	low(03E8h)
	movwf	0+(?___lwdiv)+02h
	movlw	high(03E8h)
	movwf	(0+(?___lwdiv)+02h)+1
	fcall	___lwdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(0+(?___lwdiv)),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001736:	
	line	126
;gps.c: 126: print_char((minutesD / 100) % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(_minutesD),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movlw	low(064h)
	movwf	0+(?___lwdiv)+02h
	movlw	high(064h)
	movwf	(0+(?___lwdiv)+02h)+1
	fcall	___lwdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(0+(?___lwdiv)),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001737:	
	line	127
;gps.c: 127: print_char((minutesD / 10) % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(_minutesD),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movlw	low(0Ah)
	movwf	0+(?___lwdiv)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwdiv)+02h)+1
	fcall	___lwdiv
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(0+(?___lwdiv)),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001738:	
	line	128
;gps.c: 128: print_char(minutesD % 10 + '0');
	movf	(_minutesD+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(_minutesD),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	movlw	low(0Ah)
	movwf	0+(?___lwmod)+02h
	movlw	high(0Ah)
	movwf	(0+(?___lwmod)+02h)+1
	fcall	___lwmod
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	
l30001739:	
	line	129
;gps.c: 129: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	
l30001740:	
	line	130
;gps.c: 130: print_char(dir);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_dir),w
	fcall	_print_char
	
l30001741:	
	line	131
;gps.c: 131: tempo_N_ms(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001742:	
	line	134
;gps.c: 134: tempo_N_ms(30);
	movlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	goto	l30001678
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
; =============== function _main ends ============

psect	maintext
	line	136
	signat	_main,88
	global	_print_string
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:

; *************** function _print_string *****************
; Defined at:
;		line 191 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
; Parameters:    Size  Location     Type
;  s               1    wreg     PTR unsigned char 
;		 -> STR_1(7), STR_3(6), STR_2(7), STR_4(7), 
; Auto vars:     Size  Location     Type
;  s               1    9[BANK0 ] PTR unsigned char 
;		 -> STR_1(7), STR_3(6), STR_2(7), STR_4(7), 
;  i               2   10[BANK0 ] int 
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
;      Temp:     0
;      Total:    3
; This function calls:
;		_print_char
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text162
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	191
	global	__size_of_print_string
	__size_of_print_string	equ	__end_of_print_string-_print_string
;lcdbt.c: 190: void print_string(char * s)
;lcdbt.c: 191: {
	
_print_string:	
	opt stack 6
; Regs used in _print_string: [wreg+status,2+status,0+pclath+cstack]
;print_string@s stored from wreg
	line	194
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(print_string@s)
	
l30001743:	
;lcdbt.c: 194: int i=0;
	movlw	low(0)
	movwf	(print_string@i)
	movlw	high(0)
	movwf	((print_string@i))+1
	goto	l30001746
	
l30001744:	
	line	197
;lcdbt.c: 196: {
;lcdbt.c: 197: print_char(s[i]);
	movf	(print_string@s),w
	addwf	(print_string@i),w
	FNCALL _print_string,stringtab
	fcall	stringdir
	fcall	_print_char
	
l30001745:	
	line	198
;lcdbt.c: 198: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(print_string@i),f
	skipnc
	incf	(print_string@i+1),f
	movlw	high(01h)
	addwf	(print_string@i+1),f
	
l30001746:	
	line	195
	movf	(print_string@s),w
	addwf	(print_string@i),w
	FNCALL _print_string,stringtab
	fcall	stringdir
	iorlw	0
	skipz
	goto	u881
	goto	u880
u881:
	goto	l30001744
u880:
	
l24:	
	return
	opt stack 0
GLOBAL	__end_of_print_string
	__end_of_print_string:
; =============== function _print_string ends ============

psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:
	line	201
	signat	_print_string,4216
	global	_request_gps

; *************** function _request_gps *****************
; Defined at:
;		line 122 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
; Parameters:    Size  Location     Type
;  commande        1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  commande        1    7[BANK0 ] unsigned char 
;  low_byte        1    8[BANK0 ] unsigned char 
;  high_byte       1    9[BANK0 ] unsigned char 
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
;      Temp:     3
;      Total:    6
; This function calls:
;		_emet_string
;		_emet_car
;		_tempo_N_ms
;		_recoit_car
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text163
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	122
	global	__size_of_request_gps
	__size_of_request_gps	equ	__end_of_request_gps-_request_gps
;functions .c: 122: void request_gps(unsigned char commande) {
	
_request_gps:	
	opt stack 6
; Regs used in _request_gps: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;request_gps@commande stored from wreg
	line	125
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(request_gps@commande)
	
l30001748:	
;functions .c: 125: emet_string((unsigned char *)"!GPS");
	movlw	((STR_5-__stringbase))&0ffh
	fcall	_emet_string
	line	127
;functions .c: 127: emet_car(commande);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(request_gps@commande),w
	fcall	_emet_car
	line	130
;functions .c: 130: tempo_N_ms(100);
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(064h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001749:	
	line	131
;functions .c: 131: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	l30001759
	
l30001750:	
	line	135
;functions .c: 135: tmHrs = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_tmHrs)
	line	136
;functions .c: 136: tmMins = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_tmMins)
	line	137
;functions .c: 137: tmSecs = recoit_car();
	fcall	_recoit_car
	movwf	(_tmSecs)
	goto	l52
	
l30001751:	
	line	141
;functions .c: 141: day = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_day)
	line	142
;functions .c: 142: month = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_month)
	line	143
;functions .c: 143: year = recoit_car();
	fcall	_recoit_car
	movwf	(_year)
	goto	l52
	
l30001752:	
	line	147
;functions .c: 147: degrees = recoit_car();
	fcall	_recoit_car
	movwf	(_degrees)
	line	148
;functions .c: 148: minutes = recoit_car();
	fcall	_recoit_car
	movwf	(_minutes)
	line	150
;functions .c: 150: unsigned char high_byte = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(request_gps@high_byte)
	line	151
;functions .c: 151: unsigned char low_byte = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(request_gps@low_byte)
	
l30001753:	
	line	152
;functions .c: 152: minutesD = (high_byte << 8) + low_byte;
	movf	(request_gps@high_byte),w
	movwf	(??_request_gps+0+0)
	clrf	(??_request_gps+0+0+1)
	movlw	08h
	movwf	(??_request_gps+2+0)
u895:
	clrc
	rlf	(??_request_gps+0+0),f
	rlf	(??_request_gps+0+1),f
	decfsz	(??_request_gps+2+0),f
	goto	u895
	movf	(request_gps@low_byte),w
	addwf	0+(??_request_gps+0+0),w
	movwf	(_minutesD)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_request_gps+0+0),w
	movwf	1+(_minutesD)
	
l30001754:	
	line	153
;functions .c: 153: dir = recoit_car();
	fcall	_recoit_car
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_dir)
	goto	l52
	
l30001759:	
	line	133
	movf	(request_gps@commande),w
		xorlw	3^0
	skipnz
	goto	l30001750
	xorlw	4^3
	skipnz
	goto	l30001751
	xorlw	5^4
	skipnz
	goto	l30001752
	xorlw	6^5
	skipnz
	goto	l30001752
	goto	l52

	
l52:	
	return
	opt stack 0
GLOBAL	__end_of_request_gps
	__end_of_request_gps:
; =============== function _request_gps ends ============

psect	text164,local,class=CODE,delta=2
global __ptext164
__ptext164:
	line	169
	signat	_request_gps,4216
	global	_efface

; *************** function _efface *****************
; Defined at:
;		line 294 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text164
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	294
	global	__size_of_efface
	__size_of_efface	equ	__end_of_efface-_efface
;lcdbt.c: 293: void efface(void)
;lcdbt.c: 294: {
	
_efface:	
	opt stack 6
; Regs used in _efface: [wreg+status,2+status,0+pclath+cstack]
	line	297
	
l30001782:	
;lcdbt.c: 297: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	
l37:	
	return
	opt stack 0
GLOBAL	__end_of_efface
	__end_of_efface:
; =============== function _efface ends ============

psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:
	line	298
	signat	_efface,88
	global	_goto_ligne_1

; *************** function _goto_ligne_1 *****************
; Defined at:
;		line 209 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text165
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	209
	global	__size_of_goto_ligne_1
	__size_of_goto_ligne_1	equ	__end_of_goto_ligne_1-_goto_ligne_1
;lcdbt.c: 208: void goto_ligne_1(void)
;lcdbt.c: 209: {
	
_goto_ligne_1:	
	opt stack 6
; Regs used in _goto_ligne_1: [wreg+status,2+status,0+pclath+cstack]
	line	212
	
l30001781:	
;lcdbt.c: 212: ecriture_commande(0x80);
	movlw	(080h)
	fcall	_ecriture_commande
	
l28:	
	return
	opt stack 0
GLOBAL	__end_of_goto_ligne_1
	__end_of_goto_ligne_1:
; =============== function _goto_ligne_1 ends ============

psect	text166,local,class=CODE,delta=2
global __ptext166
__ptext166:
	line	215
	signat	_goto_ligne_1,88
	global	___awdiv

; *************** function ___awdiv *****************
; Defined at:
;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\awdiv.c"
; Parameters:    Size  Location     Type
;  dividend        2    4[BANK0 ] int 
;  divisor         2    6[BANK0 ] int 
; Auto vars:     Size  Location     Type
;  quotient        2    2[BANK0 ] int 
;  sign            1    1[BANK0 ] unsigned char 
;  counter         1    0[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;                  2    4[BANK0 ] int 
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       8       0       0       0
;      Temp:     1
;      Total:    9
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text166
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l30001595:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___awdiv@sign)
	
l30001596:	
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u761
	goto	u760
u761:
	goto	l30001598
u760:
	
l30001597:	
	line	11
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	
l30001598:	
	line	14
	btfss	(___awdiv@dividend+1),7
	goto	u771
	goto	u770
u771:
	goto	l211
u770:
	
l30001599:	
	line	15
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	
l30001600:	
	line	16
	movlw	(01h)
	movwf	(??___awdiv+0+0)
	movf	(??___awdiv+0+0),w
	xorwf	(___awdiv@sign),f
	
l211:	
	line	18
	movlw	low(0)
	movwf	(___awdiv@quotient)
	movlw	high(0)
	movwf	((___awdiv@quotient))+1
	line	19
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u781
	goto	u780
u781:
	goto	l30001610
u780:
	
l30001601:	
	line	20
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	goto	l30001604
	
l30001602:	
	line	22
	movlw	01h
u795:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u795
	
l30001603:	
	line	23
	movlw	(01h)
	movwf	(??___awdiv+0+0)
	movf	(??___awdiv+0+0),w
	addwf	(___awdiv@counter),f
	
l30001604:	
	line	21
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u801
	goto	u800
u801:
	goto	l30001602
u800:
	
l30001605:	
	line	26
	movlw	01h
u815:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u815
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u825
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u825:
	skipc
	goto	u821
	goto	u820
u821:
	goto	l30001608
u820:
	
l30001606:	
	line	28
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	
l30001607:	
	line	29
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	
l30001608:	
	line	31
	movlw	01h
u835:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u835
	
l30001609:	
	line	32
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u841
	goto	u840
u841:
	goto	l30001605
u840:
	
l30001610:	
	line	34
	movf	(___awdiv@sign),w
	skipz
	goto	u850
	goto	l30001612
u850:
	
l30001611:	
	line	35
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	
l30001612:	
	line	36
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	
l209:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
; =============== function ___awdiv ends ============

psect	text167,local,class=CODE,delta=2
global __ptext167
__ptext167:
	line	37
	signat	___awdiv,8314
	global	___lwdiv

; *************** function ___lwdiv *****************
; Defined at:
;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\lwdiv.c"
; Parameters:    Size  Location     Type
;  dividend        2    3[BANK0 ] unsigned int 
;  divisor         2    5[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  quotient        2    0[BANK0 ] unsigned int 
;  counter         1    2[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;                  2    3[BANK0 ] unsigned int 
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       7       0       0       0
;      Temp:     1
;      Total:    8
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text167
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l30001554:	
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u541
	goto	u540
u541:
	goto	l30001564
u540:
	
l30001555:	
	line	11
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	goto	l30001558
	
l30001556:	
	line	13
	movlw	01h
u555:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u555
	
l30001557:	
	line	14
	movlw	(01h)
	movwf	(??___lwdiv+0+0)
	movf	(??___lwdiv+0+0),w
	addwf	(___lwdiv@counter),f
	
l30001558:	
	line	12
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u561
	goto	u560
u561:
	goto	l30001556
u560:
	
l30001559:	
	line	17
	movlw	01h
u575:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u575
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u585
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u585:
	skipc
	goto	u581
	goto	u580
u581:
	goto	l30001562
u580:
	
l30001560:	
	line	19
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	
l30001561:	
	line	20
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	
l30001562:	
	line	22
	movlw	01h
u595:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u595
	
l30001563:	
	line	23
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u601
	goto	u600
u601:
	goto	l30001559
u600:
	
l30001564:	
	line	25
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	
l70:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
; =============== function ___lwdiv ends ============

psect	text168,local,class=CODE,delta=2
global __ptext168
__ptext168:
	line	26
	signat	___lwdiv,8314
	global	___lwmod

; *************** function ___lwmod *****************
; Defined at:
;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\lwmod.c"
; Parameters:    Size  Location     Type
;  dividend        2    7[BANK0 ] unsigned int 
;  divisor         2    9[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  counter         1    2[COMMON] unsigned char 
; Return value:  Size  Location     Type
;                  2    7[BANK0 ] unsigned int 
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       4       0       0       0
;      Temp:     1
;      Total:    6
; This function calls:
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text168
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l30001566:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u611
	goto	u610
u611:
	goto	l30001575
u610:
	
l30001567:	
	line	9
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	goto	l30001570
	
l30001568:	
	line	11
	movlw	01h
u625:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u625
	
l30001569:	
	line	12
	movlw	(01h)
	movwf	(??___lwmod+0+0)
	movf	(??___lwmod+0+0),w
	addwf	(___lwmod@counter),f
	
l30001570:	
	line	10
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u631
	goto	u630
u631:
	goto	l30001568
u630:
	
l30001571:	
	line	15
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u645
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u645:
	skipc
	goto	u641
	goto	u640
u641:
	goto	l30001573
u640:
	
l30001572:	
	line	16
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	
l30001573:	
	line	17
	movlw	01h
u655:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u655
	
l30001574:	
	line	18
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u661
	goto	u660
u661:
	goto	l30001571
u660:
	
l30001575:	
	line	20
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	
l79:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
; =============== function ___lwmod ends ============

psect	text169,local,class=CODE,delta=2
global __ptext169
__ptext169:
	line	21
	signat	___lwmod,8314
	global	___awmod

; *************** function ___awmod *****************
; Defined at:
;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\awmod.c"
; Parameters:    Size  Location     Type
;  dividend        2    0[BANK0 ] int 
;  divisor         2    2[BANK0 ] int 
; Auto vars:     Size  Location     Type
;  sign            1    1[COMMON] unsigned char 
;  counter         1    2[COMMON] unsigned char 
; Return value:  Size  Location     Type
;                  2    0[BANK0 ] int 
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       4       0       0       0
;      Temp:     1
;      Total:    7
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text169
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.70\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l30001577:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awmod@sign)
	
l30001578:	
	line	9
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___awmod@dividend+1),7
	goto	u671
	goto	u670
u671:
	goto	l30001580
u670:
	
l30001579:	
	line	10
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	
l30001580:	
	line	13
	btfss	(___awmod@divisor+1),7
	goto	u681
	goto	u680
u681:
	goto	l30001582
u680:
	
l30001581:	
	line	14
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	
l30001582:	
	line	15
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u691
	goto	u690
u691:
	goto	l30001591
u690:
	
l30001583:	
	line	16
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	goto	l30001586
	
l30001584:	
	line	18
	movlw	01h
u705:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u705
	
l30001585:	
	line	19
	movlw	(01h)
	movwf	(??___awmod+0+0)
	movf	(??___awmod+0+0),w
	addwf	(___awmod@counter),f
	
l30001586:	
	line	17
	btfss	(___awmod@divisor+1),(15)&7
	goto	u711
	goto	u710
u711:
	goto	l30001584
u710:
	
l30001587:	
	line	22
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u725
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u725:
	skipc
	goto	u721
	goto	u720
u721:
	goto	l30001589
u720:
	
l30001588:	
	line	23
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	
l30001589:	
	line	24
	movlw	01h
u735:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u735
	
l30001590:	
	line	25
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u741
	goto	u740
u741:
	goto	l30001587
u740:
	
l30001591:	
	line	27
	movf	(___awmod@sign),w
	skipz
	goto	u750
	goto	l30001593
u750:
	
l30001592:	
	line	28
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	
l30001593:	
	line	29
	
l289:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
; =============== function ___awmod ends ============

psect	text170,local,class=CODE,delta=2
global __ptext170
__ptext170:
	line	30
	signat	___awmod,8314
	global	_goto_ligne_2

; *************** function _goto_ligne_2 *****************
; Defined at:
;		line 221 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text170
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	221
	global	__size_of_goto_ligne_2
	__size_of_goto_ligne_2	equ	__end_of_goto_ligne_2-_goto_ligne_2
;lcdbt.c: 220: void goto_ligne_2(void)
;lcdbt.c: 221: {
	
_goto_ligne_2:	
	opt stack 6
; Regs used in _goto_ligne_2: [wreg+status,2+status,0+pclath+cstack]
	line	224
	
l30001747:	
;lcdbt.c: 224: ecriture_commande(0xC0);
	movlw	(0C0h)
	fcall	_ecriture_commande
	
l29:	
	return
	opt stack 0
GLOBAL	__end_of_goto_ligne_2
	__end_of_goto_ligne_2:
; =============== function _goto_ligne_2 ends ============

psect	text171,local,class=CODE,delta=2
global __ptext171
__ptext171:
	line	226
	signat	_goto_ligne_2,88
	global	_init_liaison_serie

; *************** function _init_liaison_serie *****************
; Defined at:
;		line 47 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
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
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text171
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	47
	global	__size_of_init_liaison_serie
	__size_of_init_liaison_serie	equ	__end_of_init_liaison_serie-_init_liaison_serie
;functions .c: 46: void init_liaison_serie(void)
;functions .c: 47: {
	
_init_liaison_serie:	
	opt stack 6
; Regs used in _init_liaison_serie: [wreg]
	line	49
	
l30001617:	
;functions .c: 49: BRGH = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1218/8)^080h,(1218)&7
	
l30001618:	
	line	50
;functions .c: 50: SPBRG = 51;
	movlw	(033h)
	movwf	(153)^080h	;volatile
	
l30001619:	
	line	53
;functions .c: 53: SYNC = 0;
	bcf	(1220/8)^080h,(1220)&7
	
l30001620:	
	line	54
;functions .c: 54: SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	
l30001621:	
	line	56
;functions .c: 56: TRISC6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1086/8)^080h,(1086)&7
	
l30001622:	
	line	57
;functions .c: 57: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	
l30001623:	
	line	60
;functions .c: 60: TXIE = 0;
	bcf	(1124/8)^080h,(1124)&7
	
l30001624:	
	line	61
;functions .c: 61: RCIE = 0;
	bcf	(1125/8)^080h,(1125)&7
	
l30001625:	
	line	62
;functions .c: 62: ADDEN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(195/8),(195)&7
	
l30001626:	
	line	65
;functions .c: 65: TX9 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1222/8)^080h,(1222)&7
	
l30001627:	
	line	66
;functions .c: 66: RX9 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	
l30001628:	
	line	69
;functions .c: 69: TXEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	
l30001629:	
	line	70
;functions .c: 70: CREN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	
l38:	
	return
	opt stack 0
GLOBAL	__end_of_init_liaison_serie
	__end_of_init_liaison_serie:
; =============== function _init_liaison_serie ends ============

psect	text172,local,class=CODE,delta=2
global __ptext172
__ptext172:
	line	72
	signat	_init_liaison_serie,88
	global	_allume_LCD

; *************** function _allume_LCD *****************
; Defined at:
;		line 50 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text172
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	50
	global	__size_of_allume_LCD
	__size_of_allume_LCD	equ	__end_of_allume_LCD-_allume_LCD
;lcdbt.c: 49: void allume_LCD(void)
;lcdbt.c: 50: {
	
_allume_LCD:	
	opt stack 6
; Regs used in _allume_LCD: [status,2+status,0+pclath+cstack]
	line	53
	
l30001630:	
;lcdbt.c: 53: init_PORTD();
	fcall	_init_PORTD
	
l30001631:	
	line	54
;lcdbt.c: 54: RD7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(71/8),(71)&7
	
l15:	
	return
	opt stack 0
GLOBAL	__end_of_allume_LCD
	__end_of_allume_LCD:
; =============== function _allume_LCD ends ============

psect	text173,local,class=CODE,delta=2
global __ptext173
__ptext173:
	line	56
	signat	_allume_LCD,88
	global	_init_LCD

; *************** function _init_LCD *****************
; Defined at:
;		line 117 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text173
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	117
	global	__size_of_init_LCD
	__size_of_init_LCD	equ	__end_of_init_LCD-_init_LCD
;lcdbt.c: 116: void init_LCD(void)
;lcdbt.c: 117: {
	
_init_LCD:	
	opt stack 6
; Regs used in _init_LCD: [wreg+status,2+status,0+pclath+cstack]
	line	118
	
l30001760:	
;lcdbt.c: 118: tempo_N_ms(30);
	movlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001761:	
	line	119
;lcdbt.c: 119: TRISD=0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	
l30001762:	
	line	120
;lcdbt.c: 120: RD7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(71/8),(71)&7
	
l30001763:	
	line	121
;lcdbt.c: 121: RD4=0;
	bcf	(68/8),(68)&7
	
l30001764:	
	line	122
;lcdbt.c: 122: RD6=0;
	bcf	(70/8),(70)&7
	
l30001765:	
	line	123
;lcdbt.c: 123: RD5=0;
	bcf	(69/8),(69)&7
	
l30001766:	
	line	125
;lcdbt.c: 125: PORTD=PORTD|0x03;
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	
l30001767:	
	line	126
;lcdbt.c: 126: RD6=1;
	bsf	(70/8),(70)&7
	
l30001768:	
	line	127
;lcdbt.c: 127: RD6=0;
	bcf	(70/8),(70)&7
	
l30001769:	
	line	128
;lcdbt.c: 128: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001770:	
	line	131
;lcdbt.c: 131: PORTD=PORTD|0x03;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	
l30001771:	
	line	132
;lcdbt.c: 132: RD6=1;
	bsf	(70/8),(70)&7
	
l30001772:	
	line	133
;lcdbt.c: 133: RD6=0;
	bcf	(70/8),(70)&7
	
l30001773:	
	line	137
;lcdbt.c: 137: PORTD=PORTD|0x03;
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	
l30001774:	
	line	138
;lcdbt.c: 138: RD6=1;
	bsf	(70/8),(70)&7
	
l30001775:	
	line	139
;lcdbt.c: 139: RD6=0;
	bcf	(70/8),(70)&7
	
l30001776:	
	line	140
;lcdbt.c: 140: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001777:	
	line	145
;lcdbt.c: 145: ecriture_commande(0x28);
	movlw	(028h)
	fcall	_ecriture_commande
	
l30001778:	
	line	148
;lcdbt.c: 148: ecriture_commande(0x0F);
	movlw	(0Fh)
	fcall	_ecriture_commande
	
l30001779:	
	line	152
;lcdbt.c: 152: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	
l30001780:	
	line	157
;lcdbt.c: 157: ecriture_commande(0x06);
	movlw	(06h)
	fcall	_ecriture_commande
	
l22:	
	return
	opt stack 0
GLOBAL	__end_of_init_LCD
	__end_of_init_LCD:
; =============== function _init_LCD ends ============

psect	text174,local,class=CODE,delta=2
global __ptext174
__ptext174:
	line	158
	signat	_init_LCD,88
	global	_init_gps_mode_smart

; *************** function _init_gps_mode_smart *****************
; Defined at:
;		line 104 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
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
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text174
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	104
	global	__size_of_init_gps_mode_smart
	__size_of_init_gps_mode_smart	equ	__end_of_init_gps_mode_smart-_init_gps_mode_smart
;functions .c: 104: void init_gps_mode_smart(void) {
	
_init_gps_mode_smart:	
	opt stack 6
; Regs used in _init_gps_mode_smart: [wreg+status,2+status,0+pclath+cstack]
	line	109
	
l30001534:	
;functions .c: 109: TRISC4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1084/8)^080h,(1084)&7
	line	112
;functions .c: 112: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	113
;functions .c: 113: RC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	114
;functions .c: 114: RC5=1;
	bsf	(61/8),(61)&7
	
l30001535:	
	line	119
;functions .c: 119: tempo_N_ms(10);
	movlw	low(0Ah)
	movwf	(?_tempo_N_ms)
	movlw	high(0Ah)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l51:	
	return
	opt stack 0
GLOBAL	__end_of_init_gps_mode_smart
	__end_of_init_gps_mode_smart:
; =============== function _init_gps_mode_smart ends ============

psect	text175,local,class=CODE,delta=2
global __ptext175
__ptext175:
	line	120
	signat	_init_gps_mode_smart,88
	global	_emet_string

; *************** function _emet_string *****************
; Defined at:
;		line 86 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
; Parameters:    Size  Location     Type
;  message         1    wreg     PTR unsigned char 
;		 -> STR_5(5), 
; Auto vars:     Size  Location     Type
;  message         1    2[COMMON] PTR unsigned char 
;		 -> STR_5(5), 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     1
;      Total:    2
; This function calls:
;		_emet_car
; This function is called by:
;		_request_gps
; This function uses a non-reentrant model
; 
psect	text175
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	86
	global	__size_of_emet_string
	__size_of_emet_string	equ	__end_of_emet_string-_emet_string
;functions .c: 85: void emet_string(unsigned char *message)
;functions .c: 86: {
	
_emet_string:	
	opt stack 5
; Regs used in _emet_string: [wreg+status,2+status,0+pclath+cstack]
;emet_string@message stored from wreg
	movwf	(emet_string@message)
	
l30001785:	
	goto	l30001788
	
l30001786:	
	line	90
;functions .c: 89: {
;functions .c: 90: emet_car(*message);
	movf	(emet_string@message),w
	FNCALL _emet_string,stringtab
	fcall	stringdir
	fcall	_emet_car
	
l30001787:	
	line	91
;functions .c: 91: message++;
	movlw	(01h)
	movwf	(??_emet_string+0+0)
	movf	(??_emet_string+0+0),w
	addwf	(emet_string@message),f
	
l30001788:	
	line	88
	movf	(emet_string@message),w
	FNCALL _emet_string,stringtab
	fcall	stringdir
	iorlw	0
	skipz
	goto	u911
	goto	u910
u911:
	goto	l30001786
u910:
	
l43:	
	return
	opt stack 0
GLOBAL	__end_of_emet_string
	__end_of_emet_string:
; =============== function _emet_string ends ============

psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:
	line	94
	signat	_emet_string,4216
	global	_recoit_car

; *************** function _recoit_car *****************
; Defined at:
;		line 97 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg
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
;		_request_gps
; This function uses a non-reentrant model
; 
psect	text176
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	97
	global	__size_of_recoit_car
	__size_of_recoit_car	equ	__end_of_recoit_car-_recoit_car
;functions .c: 96: unsigned char recoit_car(void)
;functions .c: 97: {
	
_recoit_car:	
	opt stack 5
; Regs used in _recoit_car: [wreg]
	line	98
	
l30001614:	
;functions .c: 98: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	
l48:	
	line	99
	btfss	(101/8),(101)&7
	goto	u861
	goto	u860
u861:
	goto	l48
u860:
	
l30001615:	
	line	100
;functions .c: 100: return RCREG;
	movf	(26),w	;volatile
	
l47:	
	return
	opt stack 0
GLOBAL	__end_of_recoit_car
	__end_of_recoit_car:
; =============== function _recoit_car ends ============

psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:
	line	102
	signat	_recoit_car,89
	global	_init_PORTD

; *************** function _init_PORTD *****************
; Defined at:
;		line 36 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
;		_main
;		_allume_LCD
; This function uses a non-reentrant model
; 
psect	text177
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	36
	global	__size_of_init_PORTD
	__size_of_init_PORTD	equ	__end_of_init_PORTD-_init_PORTD
;lcdbt.c: 35: void init_PORTD(void)
;lcdbt.c: 36: {
	
_init_PORTD:	
	opt stack 5
; Regs used in _init_PORTD: []
	line	39
	
l30001632:	
;lcdbt.c: 39: TRISD4=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1092/8)^080h,(1092)&7
	line	40
;lcdbt.c: 40: TRISD5=0;
	bcf	(1093/8)^080h,(1093)&7
	line	41
;lcdbt.c: 41: TRISD6=0;
	bcf	(1094/8)^080h,(1094)&7
	line	42
;lcdbt.c: 42: TRISD7=1;
	bsf	(1095/8)^080h,(1095)&7
	
l14:	
	return
	opt stack 0
GLOBAL	__end_of_init_PORTD
	__end_of_init_PORTD:
; =============== function _init_PORTD ends ============

psect	text178,local,class=CODE,delta=2
global __ptext178
__ptext178:
	line	44
	signat	_init_PORTD,88
	global	_print_char

; *************** function _print_char *****************
; Defined at:
;		line 165 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
; Parameters:    Size  Location     Type
;  car             1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  car             1    8[BANK0 ] unsigned char 
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
;      Temp:     2
;      Total:    3
; This function calls:
;		_attente_bf
; This function is called by:
;		_main
;		_print_string
; This function uses a non-reentrant model
; 
psect	text178
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	165
	global	__size_of_print_char
	__size_of_print_char	equ	__end_of_print_char-_print_char
;lcdbt.c: 164: void print_char( char car)
;lcdbt.c: 165: {
	
_print_char:	
	opt stack 5
; Regs used in _print_char: [wreg+status,2+status,0+pclath+cstack]
;print_char@car stored from wreg
	line	168
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(print_char@car)
	
l30001667:	
;lcdbt.c: 168: attente_bf();
	fcall	_attente_bf
	
l30001668:	
	line	170
;lcdbt.c: 170: PORTD=0xD0;
	movlw	(0D0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l30001669:	
	line	171
;lcdbt.c: 171: PORTD|=((car>>4)&0x0F);
	movf	(print_char@car),w
	movwf	(??_print_char+0+0)
	movlw	04h
u875:
	clrc
	rrf	(??_print_char+0+0),f
	addlw	-1
	skipz
	goto	u875
	movf	0+(??_print_char+0+0),w
	andlw	0Fh
	movwf	(??_print_char+1+0)
	movf	(??_print_char+1+0),w
	iorwf	(8),f	;volatile
	
l30001670:	
	line	173
;lcdbt.c: 173: RD6=0;
	bcf	(70/8),(70)&7
	
l30001671:	
	line	175
;lcdbt.c: 175: PORTD=0xD0;
	movlw	(0D0h)
	movwf	(8)	;volatile
	
l30001672:	
	line	176
;lcdbt.c: 176: PORTD|=(car & 0x0F);
	movf	(print_char@car),w
	andlw	0Fh
	movwf	(??_print_char+0+0)
	movf	(??_print_char+0+0),w
	iorwf	(8),f	;volatile
	
l30001673:	
	line	180
;lcdbt.c: 180: RD6=0;
	bcf	(70/8),(70)&7
	
l23:	
	return
	opt stack 0
GLOBAL	__end_of_print_char
	__end_of_print_char:
; =============== function _print_char ends ============

psect	text179,local,class=CODE,delta=2
global __ptext179
__ptext179:
	line	184
	signat	_print_char,4216
	global	_ecriture_commande

; *************** function _ecriture_commande *****************
; Defined at:
;		line 97 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
; Parameters:    Size  Location     Type
;  commande        1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  commande        1    6[BANK0 ] unsigned char 
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
;		_goto_ligne_1
;		_goto_ligne_2
;		_efface
; This function uses a non-reentrant model
; 
psect	text179
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	97
	global	__size_of_ecriture_commande
	__size_of_ecriture_commande	equ	__end_of_ecriture_commande-_ecriture_commande
;lcdbt.c: 96: void ecriture_commande(char commande)
;lcdbt.c: 97: {
	
_ecriture_commande:	
	opt stack 5
; Regs used in _ecriture_commande: [wreg+status,2+status,0+pclath+cstack]
;ecriture_commande@commande stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ecriture_commande@commande)
	
l30001789:	
	line	98
;lcdbt.c: 98: attente_bf();
	fcall	_attente_bf
	
l30001790:	
	line	99
;lcdbt.c: 99: RD5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(69/8),(69)&7
	
l30001791:	
	line	100
;lcdbt.c: 100: RD4=0;
	bcf	(68/8),(68)&7
	
l30001792:	
	line	101
;lcdbt.c: 101: PORTD=((commande>>4)&0x0F)|0x80;
	movf	(ecriture_commande@commande),w
	movwf	(??_ecriture_commande+0+0)
	movlw	04h
u925:
	clrc
	rrf	(??_ecriture_commande+0+0),f
	addlw	-1
	skipz
	goto	u925
	movf	0+(??_ecriture_commande+0+0),w
	andlw	0Fh
	iorlw	080h
	movwf	(8)	;volatile
	
l30001793:	
	line	103
;lcdbt.c: 103: RD6=1;
	bsf	(70/8),(70)&7
	
l30001794:	
	line	104
;lcdbt.c: 104: RD6=0;
	bcf	(70/8),(70)&7
	
l30001795:	
	line	106
;lcdbt.c: 106: PORTD=(commande&0x0F)|0x80;
	movf	(ecriture_commande@commande),w
	andlw	0Fh
	iorlw	080h
	movwf	(8)	;volatile
	
l30001796:	
	line	108
;lcdbt.c: 108: RD6=1;
	bsf	(70/8),(70)&7
	
l30001797:	
	line	109
;lcdbt.c: 109: RD6=0;
	bcf	(70/8),(70)&7
	
l21:	
	return
	opt stack 0
GLOBAL	__end_of_ecriture_commande
	__end_of_ecriture_commande:
; =============== function _ecriture_commande ends ============

psect	text180,local,class=CODE,delta=2
global __ptext180
__ptext180:
	line	110
	signat	_ecriture_commande,4216
	global	_emet_car

; *************** function _emet_car *****************
; Defined at:
;		line 76 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
; Parameters:    Size  Location     Type
;  car             1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  car             1    0[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     0
;      Total:    1
; This function calls:
;		Nothing
; This function is called by:
;		_emet_string
;		_request_gps
; This function uses a non-reentrant model
; 
psect	text180
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	76
	global	__size_of_emet_car
	__size_of_emet_car	equ	__end_of_emet_car-_emet_car
;functions .c: 75: void emet_car(unsigned char car)
;functions .c: 76: {
	
_emet_car:	
	opt stack 4
; Regs used in _emet_car: [wreg]
;emet_car@car stored from wreg
	movwf	(emet_car@car)
	
l30001783:	
	line	77
;functions .c: 77: RC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	
l40:	
	line	78
	btfss	(100/8),(100)&7
	goto	u901
	goto	u900
u901:
	goto	l40
u900:
	
l30001784:	
	line	79
;functions .c: 79: TXREG = car;
	movf	(emet_car@car),w
	movwf	(25)	;volatile
	
l39:	
	return
	opt stack 0
GLOBAL	__end_of_emet_car
	__end_of_emet_car:
; =============== function _emet_car ends ============

psect	text181,local,class=CODE,delta=2
global __ptext181
__ptext181:
	line	80
	signat	_emet_car,4216
	global	_attente_bf

; *************** function _attente_bf *****************
; Defined at:
;		line 88 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text181
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	88
	global	__size_of_attente_bf
	__size_of_attente_bf	equ	__end_of_attente_bf-_attente_bf
;lcdbt.c: 87: void attente_bf(void)
;lcdbt.c: 88: {
	
_attente_bf:	
	opt stack 4
; Regs used in _attente_bf: [wreg+status,2+status,0+pclath+cstack]
	
l30001488:	
	
l30001489:	
	line	89
	fcall	_lecture_commande
	movwf	(??_attente_bf+0+0)
	btfsc	0+(??_attente_bf+0+0),(7)&7
	goto	u471
	goto	u470
u471:
	goto	l30001489
u470:
	
l17:	
	return
	opt stack 0
GLOBAL	__end_of_attente_bf
	__end_of_attente_bf:
; =============== function _attente_bf ends ============

psect	text182,local,class=CODE,delta=2
global __ptext182
__ptext182:
	line	90
	signat	_attente_bf,88
	global	_lecture_commande

; *************** function _lecture_commande *****************
; Defined at:
;		line 64 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;  quartet_comm    1    4[BANK0 ] unsigned char 
;  commande        1    5[BANK0 ] unsigned char 
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
psect	text182
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	64
	global	__size_of_lecture_commande
	__size_of_lecture_commande	equ	__end_of_lecture_commande-_lecture_commande
;lcdbt.c: 63: unsigned char lecture_commande (void)
;lcdbt.c: 64: {
	
_lecture_commande:	
	opt stack 3
; Regs used in _lecture_commande: [wreg+status,2+status,0+pclath+cstack]
	line	66
	
l30001472:	
;lcdbt.c: 65: unsigned char commande, quartet_commande;
;lcdbt.c: 66: TRISD=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	
l30001473:	
	line	67
;lcdbt.c: 67: RD5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(69/8),(69)&7
	
l30001474:	
	line	68
;lcdbt.c: 68: RD4=0;
	bcf	(68/8),(68)&7
	
l30001475:	
	line	69
;lcdbt.c: 69: tempo_N_ms(2);
	movlw	low(02h)
	movwf	(?_tempo_N_ms)
	movlw	high(02h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	
l30001476:	
	line	70
;lcdbt.c: 70: RD6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(70/8),(70)&7
	
l30001477:	
	line	71
;lcdbt.c: 71: quartet_commande=PORTD;
	movf	(8),w	;volatile
	movwf	(lecture_commande@quartet_commande)
	
l30001478:	
	line	72
;lcdbt.c: 72: commande=((quartet_commande<<4)& 0xF0);
	movf	(lecture_commande@quartet_commande),w
	movwf	(??_lecture_commande+0+0)
	movlw	(04h)-1
u465:
	clrc
	rlf	(??_lecture_commande+0+0),f
	addlw	-1
	skipz
	goto	u465
	clrc
	rlf	(??_lecture_commande+0+0),w
	andlw	0F0h
	movwf	(lecture_commande@commande)
	
l30001479:	
	line	73
;lcdbt.c: 73: RD6=0;
	bcf	(70/8),(70)&7
	
l30001480:	
	line	74
;lcdbt.c: 74: RD6=1;
	bsf	(70/8),(70)&7
	
l30001481:	
	line	75
;lcdbt.c: 75: quartet_commande=PORTD;
	movf	(8),w	;volatile
	movwf	(lecture_commande@quartet_commande)
	
l30001482:	
	line	76
;lcdbt.c: 76: commande=commande|(quartet_commande & 0x0F);
	movf	(lecture_commande@quartet_commande),w
	andlw	0Fh
	iorwf	(lecture_commande@commande),w
	movwf	(lecture_commande@commande)
	
l30001483:	
	line	77
;lcdbt.c: 77: RD6=0;
	bcf	(70/8),(70)&7
	
l30001484:	
	line	78
;lcdbt.c: 78: RD5=0;
	bcf	(69/8),(69)&7
	
l30001485:	
	line	79
;lcdbt.c: 79: TRISD=0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	
l30001486:	
	line	80
;lcdbt.c: 80: return(commande);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lecture_commande@commande),w
	
l16:	
	return
	opt stack 0
GLOBAL	__end_of_lecture_commande
	__end_of_lecture_commande:
; =============== function _lecture_commande ends ============

psect	text183,local,class=CODE,delta=2
global __ptext183
__ptext183:
	line	81
	signat	_lecture_commande,89
	global	_tempo_N_ms

; *************** function _tempo_N_ms *****************
; Defined at:
;		line 17 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
; Parameters:    Size  Location     Type
;  N               2    2[BANK0 ] int 
; Auto vars:     Size  Location     Type
;  i               2    0[BANK0 ] int 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       4       0       0       0
;      Temp:     1
;      Total:    5
; This function calls:
;		_tempo_1_ms
; This function is called by:
;		_main
;		_lecture_commande
;		_init_LCD
;		_init_gps_mode_smart
;		_request_gps
; This function uses a non-reentrant model
; 
psect	text183
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	17
	global	__size_of_tempo_N_ms
	__size_of_tempo_N_ms	equ	__end_of_tempo_N_ms-_tempo_N_ms
;lcdbt.c: 16: void tempo_N_ms(int N)
;lcdbt.c: 17: {
	
_tempo_N_ms:	
	opt stack 2
; Regs used in _tempo_N_ms: [wreg+status,2+status,0+pclath+cstack]
	line	20
	
l30001396:	
;lcdbt.c: 18: int i;
;lcdbt.c: 20: OPTION=OPTION & 0b11000001;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(129)^080h,w
	andlw	0C1h
	movwf	(129)^080h
	
l30001397:	
	line	21
;lcdbt.c: 21: TMR0=6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	
l30001398:	
	line	22
;lcdbt.c: 22: T0IF=0;
	bcf	(90/8),(90)&7
	
l30001399:	
	line	23
;lcdbt.c: 23: for(i=0;i<N;i++)
	movlw	low(0)
	movwf	(tempo_N_ms@i)
	movlw	high(0)
	movwf	((tempo_N_ms@i))+1
	goto	l30001402
	
l30001400:	
	line	25
;lcdbt.c: 25: tempo_1_ms();
	fcall	_tempo_1_ms
	
l30001401:	
	line	23
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(tempo_N_ms@i),f
	skipnc
	incf	(tempo_N_ms@i+1),f
	movlw	high(01h)
	addwf	(tempo_N_ms@i+1),f
	
l30001402:	
	movf	(tempo_N_ms@i+1),w
	xorlw	80h
	movwf	(??_tempo_N_ms+0+0)
	movf	(tempo_N_ms@N+1),w
	xorlw	80h
	subwf	(??_tempo_N_ms+0+0),w
	skipz
	goto	u455
	movf	(tempo_N_ms@N),w
	subwf	(tempo_N_ms@i),w
u455:

	skipc
	goto	u451
	goto	u450
u451:
	goto	l30001400
u450:
	
l9:	
	return
	opt stack 0
GLOBAL	__end_of_tempo_N_ms
	__end_of_tempo_N_ms:
; =============== function _tempo_N_ms ends ============

psect	text184,local,class=CODE,delta=2
global __ptext184
__ptext184:
	line	26
	signat	_tempo_N_ms,4216
	global	_tempo_1_ms

; *************** function _tempo_1_ms *****************
; Defined at:
;		line 12 in file "E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
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
psect	text184
	file	"E:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	12
	global	__size_of_tempo_1_ms
	__size_of_tempo_1_ms	equ	__end_of_tempo_1_ms-_tempo_1_ms
;lcdbt.c: 11: void tempo_1_ms(void)
;lcdbt.c: 12: { while(!T0IF);
	
_tempo_1_ms:	
	opt stack 1
; Regs used in _tempo_1_ms: []
	
l30001395:	
	
l6:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(90/8),(90)&7
	goto	u441
	goto	u440
u441:
	goto	l6
u440:
	
l8:	
	line	13
;lcdbt.c: 13: T0IF=0;
	bcf	(90/8),(90)&7
	
l5:	
	return
	opt stack 0
GLOBAL	__end_of_tempo_1_ms
	__end_of_tempo_1_ms:
; =============== function _tempo_1_ms ends ============

psect	text185,local,class=CODE,delta=2
global __ptext185
__ptext185:
	line	14
	signat	_tempo_1_ms,88
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	end
