opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

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
# 8 "D:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
	psect config,class=CONFIG,delta=2 ;#
# 8 "D:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
	dw 0x3FFE & 0x3FFB & 0x3FFF & 0x3F7F ;#
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
	FNCALL	_goto_ligne_2,_ecriture_commande
	FNCALL	_print_string,_print_char
	FNCALL	_goto_ligne_1,_ecriture_commande
	FNCALL	_efface,_ecriture_commande
	FNCALL	_init_LCD,_tempo_N_ms
	FNCALL	_init_LCD,_ecriture_commande
	FNCALL	_ecriture_commande,_attente_bf
	FNCALL	_print_char,_attente_bf
	FNCALL	_attente_bf,_lecture_commande
	FNCALL	_lecture_commande,_tempo_N_ms
	FNCALL	_request_gps,_emet_string
	FNCALL	_request_gps,_emet_car
	FNCALL	_request_gps,_tempo_N_ms
	FNCALL	_request_gps,_recoit_car
	FNCALL	_init_gps_mode_smart,_tempo_N_ms
	FNCALL	_emet_string,_emet_car
	FNCALL	_tempo_N_ms,_tempo_1_ms
	FNCALL	_allume_LCD,_init_PORTD
	FNROOT	_main
	global	_workVal
	global	_minutesD
	global	_car
	global	_commande
	global	_day
	global	_degrees
	global	_dir
	global	_message
	global	_minutes
	global	_month
	global	_tmHrs
	global	_tmMins
	global	_tmSecs
	global	_year
	global	_debug
psect	text486,local,class=CODE,delta=2
global __ptext486
__ptext486:
_debug	set	112
	DABS	1,112,1	;_debug

	global	_PORTD
_PORTD	set	8
	global	_RCREG
_RCREG	set	26
	global	_TMR0
_TMR0	set	1
	global	_TXREG
_TXREG	set	25
	global	_ADDEN
_ADDEN	set	195
	global	_CREN
_CREN	set	196
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RCIF
_RCIF	set	101
	global	_RD4
_RD4	set	68
	global	_RD5
_RD5	set	69
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_T0IF
_T0IF	set	90
	global	_TXIF
_TXIF	set	100
	global	_OPTION
_OPTION	set	129
	global	_SPBRG
_SPBRG	set	153
	global	_TRISD
_TRISD	set	136
	global	_BRGH
_BRGH	set	1218
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRISD4
_TRISD4	set	1092
	global	_TRISD5
_TRISD5	set	1093
	global	_TRISD6
_TRISD6	set	1094
	global	_TRISD7
_TRISD7	set	1095
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_TXIE
_TXIE	set	1124
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
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
	
STR_1:	
	retlw	68	;'D'
	retlw	97	;'a'
	retlw	116	;'t'
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_workVal:
       ds      4

_minutesD:
       ds      2

_car:
       ds      1

_commande:
       ds      1

_day:
       ds      1

_degrees:
       ds      1

_dir:
       ds      1

_message:
       ds      1

_minutes:
       ds      1

_month:
       ds      1

_tmHrs:
       ds      1

_tmMins:
       ds      1

_tmSecs:
       ds      1

_year:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+012h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init_PORTD
?_init_PORTD:	; 0 bytes @ 0x0
	global	??_init_PORTD
??_init_PORTD:	; 0 bytes @ 0x0
	global	?_allume_LCD
?_allume_LCD:	; 0 bytes @ 0x0
	global	??_allume_LCD
??_allume_LCD:	; 0 bytes @ 0x0
	global	?_init_LCD
?_init_LCD:	; 0 bytes @ 0x0
	global	?_init_gps_mode_smart
?_init_gps_mode_smart:	; 0 bytes @ 0x0
	global	?_init_liaison_serie
?_init_liaison_serie:	; 0 bytes @ 0x0
	global	??_init_liaison_serie
??_init_liaison_serie:	; 0 bytes @ 0x0
	global	?_efface
?_efface:	; 0 bytes @ 0x0
	global	?_goto_ligne_1
?_goto_ligne_1:	; 0 bytes @ 0x0
	global	?_print_string
?_print_string:	; 0 bytes @ 0x0
	global	?_tempo_N_ms
?_tempo_N_ms:	; 0 bytes @ 0x0
	global	?_request_gps
?_request_gps:	; 0 bytes @ 0x0
	global	?_print_char
?_print_char:	; 0 bytes @ 0x0
	global	?_goto_ligne_2
?_goto_ligne_2:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_tempo_1_ms
?_tempo_1_ms:	; 0 bytes @ 0x0
	global	??_tempo_1_ms
??_tempo_1_ms:	; 0 bytes @ 0x0
	global	?_attente_bf
?_attente_bf:	; 0 bytes @ 0x0
	global	?_ecriture_commande
?_ecriture_commande:	; 0 bytes @ 0x0
	global	?_emet_car
?_emet_car:	; 0 bytes @ 0x0
	global	??_emet_car
??_emet_car:	; 0 bytes @ 0x0
	global	?_emet_string
?_emet_string:	; 0 bytes @ 0x0
	global	??_recoit_car
??_recoit_car:	; 0 bytes @ 0x0
	global	?_lecture_commande
?_lecture_commande:	; 1 bytes @ 0x0
	global	?_recoit_car
?_recoit_car:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	emet_car@car
emet_car@car:	; 1 bytes @ 0x0
	global	tempo_N_ms@N
tempo_N_ms@N:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_emet_string
??_emet_string:	; 0 bytes @ 0x1
	ds	1
	global	??_tempo_N_ms
??_tempo_N_ms:	; 0 bytes @ 0x2
	global	emet_string@message
emet_string@message:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	tempo_N_ms@i
tempo_N_ms@i:	; 2 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	ds	1
	global	??_init_gps_mode_smart
??_init_gps_mode_smart:	; 0 bytes @ 0x5
	global	??_request_gps
??_request_gps:	; 0 bytes @ 0x5
	global	??_lecture_commande
??_lecture_commande:	; 0 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	lecture_commande@commande
lecture_commande@commande:	; 1 bytes @ 0x7
	global	request_gps@commande
request_gps@commande:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	lecture_commande@quartet_commande
lecture_commande@quartet_commande:	; 1 bytes @ 0x8
	global	request_gps@high_byte
request_gps@high_byte:	; 1 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	1
	global	??_attente_bf
??_attente_bf:	; 0 bytes @ 0x9
	global	request_gps@low_byte
request_gps@low_byte:	; 1 bytes @ 0x9
	ds	1
	global	??_print_char
??_print_char:	; 0 bytes @ 0xA
	global	??_ecriture_commande
??_ecriture_commande:	; 0 bytes @ 0xA
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	1
	global	ecriture_commande@commande
ecriture_commande@commande:	; 1 bytes @ 0xB
	ds	1
	global	??_init_LCD
??_init_LCD:	; 0 bytes @ 0xC
	global	??_efface
??_efface:	; 0 bytes @ 0xC
	global	??_goto_ligne_1
??_goto_ligne_1:	; 0 bytes @ 0xC
	global	??_goto_ligne_2
??_goto_ligne_2:	; 0 bytes @ 0xC
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	global	print_char@car
print_char@car:	; 1 bytes @ 0xC
	ds	1
	global	??_print_string
??_print_string:	; 0 bytes @ 0xD
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	print_string@s
print_string@s:	; 1 bytes @ 0x0
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x0
	ds	1
	global	print_string@i
print_string@i:	; 2 bytes @ 0x1
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	2
;;Data sizes: Strings 32, constant 0, data 0, bss 18, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          13     13      13
;; BANK0           80      5      23
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; message	PTR unsigned char  size(1) Largest target is 128
;;		 -> RAM(NULL[128]), 
;;
;; emet_string@message	PTR unsigned char  size(1) Largest target is 5
;;		 -> STR_5(CODE[5]), 
;;
;; print_string@s	PTR unsigned char  size(1) Largest target is 7
;;		 -> STR_4(CODE[7]), STR_3(CODE[6]), STR_2(CODE[7]), STR_1(CODE[7]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_print_char
;;   _main->___lwmod
;;   _goto_ligne_2->_ecriture_commande
;;   _print_string->_print_char
;;   _goto_ligne_1->_ecriture_commande
;;   _efface->_ecriture_commande
;;   _init_LCD->_ecriture_commande
;;   _ecriture_commande->_attente_bf
;;   _print_char->_attente_bf
;;   _attente_bf->_lecture_commande
;;   _lecture_commande->_tempo_N_ms
;;   _request_gps->_tempo_N_ms
;;   _init_gps_mode_smart->_tempo_N_ms
;;   _emet_string->_emet_car
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_print_string
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0    2508
;;                                              3 BANK0      2     2      0
;;                         _init_PORTD
;;                         _allume_LCD
;;                           _init_LCD
;;                _init_gps_mode_smart
;;                 _init_liaison_serie
;;                             _efface
;;                       _goto_ligne_1
;;                       _print_string
;;                         _tempo_N_ms
;;                        _request_gps
;;                            ___awdiv
;;                         _print_char
;;                            ___awmod
;;                       _goto_ligne_2
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) _goto_ligne_2                                         0     0      0     182
;;                  _ecriture_commande
;; ---------------------------------------------------------------------------------
;; (1) _print_string                                         3     3      0     272
;;                                              0 BANK0      3     3      0
;;                         _print_char
;; ---------------------------------------------------------------------------------
;; (1) _goto_ligne_1                                         0     0      0     182
;;                  _ecriture_commande
;; ---------------------------------------------------------------------------------
;; (1) _efface                                               0     0      0     182
;;                  _ecriture_commande
;; ---------------------------------------------------------------------------------
;; (1) _init_LCD                                             0     0      0     228
;;                         _tempo_N_ms
;;                  _ecriture_commande
;; ---------------------------------------------------------------------------------
;; (2) _ecriture_commande                                    2     2      0     182
;;                                             10 COMMON     2     2      0
;;                         _attente_bf
;; ---------------------------------------------------------------------------------
;; (1) _print_char                                           3     3      0     182
;;                                             10 COMMON     3     3      0
;;                         _attente_bf
;; ---------------------------------------------------------------------------------
;; (3) _attente_bf                                           1     1      0     138
;;                                              9 COMMON     1     1      0
;;                   _lecture_commande
;; ---------------------------------------------------------------------------------
;; (4) _lecture_commande                                     4     4      0     138
;;                                              5 COMMON     4     4      0
;;                         _tempo_N_ms
;; ---------------------------------------------------------------------------------
;; (1) _request_gps                                          5     5      0     271
;;                                              5 COMMON     5     5      0
;;                        _emet_string
;;                           _emet_car
;;                         _tempo_N_ms
;;                         _recoit_car
;; ---------------------------------------------------------------------------------
;; (1) _init_gps_mode_smart                                  0     0      0      46
;;                         _tempo_N_ms
;; ---------------------------------------------------------------------------------
;; (2) _emet_string                                          2     2      0      67
;;                                              1 COMMON     2     2      0
;;                           _emet_car
;; ---------------------------------------------------------------------------------
;; (5) _tempo_N_ms                                           5     3      2      46
;;                                              0 COMMON     5     3      2
;;                         _tempo_1_ms
;; ---------------------------------------------------------------------------------
;; (1) _allume_LCD                                           0     0      0       0
;;                         _init_PORTD
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     5     1      4
;;                                              0 BANK0      1     1      0
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (2) _recoit_car                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _emet_car                                             1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (6) _tempo_1_ms                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _init_liaison_serie                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _init_PORTD                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_PORTD
;;   _allume_LCD
;;     _init_PORTD
;;   _init_LCD
;;     _tempo_N_ms
;;       _tempo_1_ms
;;     _ecriture_commande
;;       _attente_bf
;;         _lecture_commande
;;           _tempo_N_ms
;;             _tempo_1_ms
;;   _init_gps_mode_smart
;;     _tempo_N_ms
;;       _tempo_1_ms
;;   _init_liaison_serie
;;   _efface
;;     _ecriture_commande
;;       _attente_bf
;;         _lecture_commande
;;           _tempo_N_ms
;;             _tempo_1_ms
;;   _goto_ligne_1
;;     _ecriture_commande
;;       _attente_bf
;;         _lecture_commande
;;           _tempo_N_ms
;;             _tempo_1_ms
;;   _print_string
;;     _print_char
;;       _attente_bf
;;         _lecture_commande
;;           _tempo_N_ms
;;             _tempo_1_ms
;;   _tempo_N_ms
;;     _tempo_1_ms
;;   _request_gps
;;     _emet_string
;;       _emet_car
;;     _emet_car
;;     _tempo_N_ms
;;       _tempo_1_ms
;;     _recoit_car
;;   ___awdiv
;;   _print_char
;;     _attente_bf
;;       _lecture_commande
;;         _tempo_N_ms
;;           _tempo_1_ms
;;   ___awmod
;;   _goto_ligne_2
;;     _ecriture_commande
;;       _attente_bf
;;         _lecture_commande
;;           _tempo_N_ms
;;             _tempo_1_ms
;;   ___lwdiv
;;   ___lwmod
;;     ___lwdiv (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            D      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               D      D       D       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
;;ABS                  0      0      24       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      5      17       5       28.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      2A      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 32 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_init_PORTD
;;		_allume_LCD
;;		_init_LCD
;;		_init_gps_mode_smart
;;		_init_liaison_serie
;;		_efface
;;		_goto_ligne_1
;;		_print_string
;;		_tempo_N_ms
;;		_request_gps
;;		___awdiv
;;		_print_char
;;		___awmod
;;		_goto_ligne_2
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\gps.c"
	line	32
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	36
	
l4307:	
;gps.c: 36: init_PORTD();
	fcall	_init_PORTD
	line	37
;gps.c: 37: allume_LCD();
	fcall	_allume_LCD
	line	38
	
l4309:	
;gps.c: 38: init_LCD();
	fcall	_init_LCD
	line	41
	
l4311:	
;gps.c: 41: init_gps_mode_smart();
	fcall	_init_gps_mode_smart
	line	45
	
l4313:	
;gps.c: 45: init_liaison_serie();
	fcall	_init_liaison_serie
	line	49
;gps.c: 49: while(1)
	
l613:	
	line	52
	
l4315:	
;gps.c: 50: {
;gps.c: 52: efface();
	fcall	_efface
	line	53
	
l4317:	
;gps.c: 53: goto_ligne_1();
	fcall	_goto_ligne_1
	line	54
	
l4319:	
;gps.c: 54: print_string("Date: ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_print_string
	line	55
	
l4321:	
;gps.c: 55: tempo_N_ms(160);
	movlw	low(0A0h)
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	56
	
l4323:	
;gps.c: 56: request_gps(0x04);
	movlw	(04h)
	fcall	_request_gps
	line	58
	
l4325:	
;gps.c: 58: tempo_N_ms(1000);
	movlw	low(03E8h)
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	59
	
l4327:	
;gps.c: 59: tempo_N_ms(1000);
	movlw	low(03E8h)
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	60
	
l4329:	
;gps.c: 60: print_char(day / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_day),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	61
	
l4331:	
;gps.c: 61: print_char(day % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_day),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	62
	
l4333:	
;gps.c: 62: print_char('/');
	movlw	(02Fh)
	fcall	_print_char
	line	63
	
l4335:	
;gps.c: 63: print_char(month / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_month),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	64
	
l4337:	
;gps.c: 64: print_char(month % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_month),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	65
	
l4339:	
;gps.c: 65: print_char('/');
	movlw	(02Fh)
	fcall	_print_char
	line	66
	
l4341:	
;gps.c: 66: print_char(year / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_year),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	67
	
l4343:	
;gps.c: 67: print_char(year % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_year),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	69
	
l4345:	
;gps.c: 69: tempo_N_ms(1000);
	movlw	low(03E8h)
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	72
	
l4347:	
;gps.c: 72: goto_ligne_2();
	fcall	_goto_ligne_2
	line	73
	
l4349:	
;gps.c: 73: print_string("Time: ");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_print_string
	line	75
	
l4351:	
;gps.c: 75: tempo_N_ms(160);
	movlw	low(0A0h)
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	76
	
l4353:	
;gps.c: 76: request_gps(0x03);
	movlw	(03h)
	fcall	_request_gps
	line	77
	
l4355:	
;gps.c: 77: print_char(tmHrs / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmHrs),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	78
	
l4357:	
;gps.c: 78: print_char(tmHrs % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmHrs),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	79
	
l4359:	
;gps.c: 79: print_char(':');
	movlw	(03Ah)
	fcall	_print_char
	line	80
	
l4361:	
;gps.c: 80: print_char(tmMins / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmMins),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	81
	
l4363:	
;gps.c: 81: print_char(tmMins % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmMins),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	82
	
l4365:	
;gps.c: 82: print_char(':');
	movlw	(03Ah)
	fcall	_print_char
	line	83
	
l4367:	
;gps.c: 83: print_char(tmSecs / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmSecs),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	84
	
l4369:	
;gps.c: 84: print_char(tmSecs % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tmSecs),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	87
	
l4371:	
;gps.c: 87: tempo_N_ms(1000);
	movlw	low(03E8h)
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	91
	
l4373:	
;gps.c: 91: efface();
	fcall	_efface
	line	92
	
l4375:	
;gps.c: 92: goto_ligne_1();
	fcall	_goto_ligne_1
	line	93
	
l4377:	
;gps.c: 93: print_string("Lat: ");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_print_string
	line	95
	
l4379:	
;gps.c: 95: tempo_N_ms(160);
	movlw	low(0A0h)
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	96
	
l4381:	
;gps.c: 96: request_gps(0x05);
	movlw	(05h)
	fcall	_request_gps
	line	97
	
l4383:	
;gps.c: 97: print_char(degrees / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_degrees),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	98
	
l4385:	
;gps.c: 98: print_char(degrees % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_degrees),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	99
	
l4387:	
;gps.c: 99: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	line	100
	
l4389:	
;gps.c: 100: print_char(minutes / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutes),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	101
	
l4391:	
;gps.c: 101: print_char(minutes % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutes),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	102
	
l4393:	
;gps.c: 102: print_char('.');
	movlw	(02Eh)
	fcall	_print_char
	line	103
	
l4395:	
;gps.c: 103: print_char((minutesD / 1000) % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	104
	
l4397:	
;gps.c: 104: print_char((minutesD / 100) % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	105
	
l4399:	
;gps.c: 105: print_char((minutesD / 10) % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	106
	
l4401:	
;gps.c: 106: print_char(minutesD % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	107
	
l4403:	
;gps.c: 107: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	line	108
	
l4405:	
;gps.c: 108: print_char(dir);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_dir),w
	fcall	_print_char
	line	109
	
l4407:	
;gps.c: 109: tempo_N_ms(1000);
	movlw	low(03E8h)
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	114
	
l4409:	
;gps.c: 114: goto_ligne_2();
	fcall	_goto_ligne_2
	line	115
	
l4411:	
;gps.c: 115: print_string("Long: ");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_print_string
	line	117
	
l4413:	
;gps.c: 117: tempo_N_ms(160);
	movlw	low(0A0h)
	movwf	(?_tempo_N_ms)
	movlw	high(0A0h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	118
	
l4415:	
;gps.c: 118: request_gps(0x06);
	movlw	(06h)
	fcall	_request_gps
	line	119
	
l4417:	
;gps.c: 119: print_char(degrees / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_degrees),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	120
	
l4419:	
;gps.c: 120: print_char(degrees % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_degrees),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	121
	
l4421:	
;gps.c: 121: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	line	122
	
l4423:	
;gps.c: 122: print_char(minutes / 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutes),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	030h
	fcall	_print_char
	line	123
	
l4425:	
;gps.c: 123: print_char(minutes % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutes),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	030h
	fcall	_print_char
	line	124
	
l4427:	
;gps.c: 124: print_char('.');
	movlw	(02Eh)
	fcall	_print_char
	line	125
	
l4429:	
;gps.c: 125: print_char((minutesD / 1000) % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	126
	
l4431:	
;gps.c: 126: print_char((minutesD / 100) % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	127
	
l4433:	
;gps.c: 127: print_char((minutesD / 10) % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	128
	
l4435:	
;gps.c: 128: print_char(minutesD % 10 + '0');
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_minutesD+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_minutesD),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_print_char
	line	129
	
l4437:	
;gps.c: 129: print_char(' ');
	movlw	(020h)
	fcall	_print_char
	line	130
	
l4439:	
;gps.c: 130: print_char(dir);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_dir),w
	fcall	_print_char
	line	131
	
l4441:	
;gps.c: 131: tempo_N_ms(1000);
	movlw	low(03E8h)
	movwf	(?_tempo_N_ms)
	movlw	high(03E8h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	134
	
l4443:	
;gps.c: 134: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	135
	
l614:	
	line	49
	goto	l613
	
l615:	
	line	136
	
l616:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_goto_ligne_2
psect	text487,local,class=CODE,delta=2
global __ptext487
__ptext487:

;; *************** function _goto_ligne_2 *****************
;; Defined at:
;;		line 221 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ecriture_commande
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text487
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	221
	global	__size_of_goto_ligne_2
	__size_of_goto_ligne_2	equ	__end_of_goto_ligne_2-_goto_ligne_2
	
_goto_ligne_2:	
	opt	stack 7
; Regs used in _goto_ligne_2: [wreg+status,2+status,0+pclath+cstack]
	line	224
	
l4305:	
;lcdbt.c: 224: ecriture_commande(0xC0);
	movlw	(0C0h)
	fcall	_ecriture_commande
	line	226
	
l1220:	
	return
	opt stack 0
GLOBAL	__end_of_goto_ligne_2
	__end_of_goto_ligne_2:
;; =============== function _goto_ligne_2 ends ============

	signat	_goto_ligne_2,88
	global	_print_string
psect	text488,local,class=CODE,delta=2
global __ptext488
__ptext488:

;; *************** function _print_string *****************
;; Defined at:
;;		line 191 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_4(7), STR_3(6), STR_2(7), STR_1(7), 
;; Auto vars:     Size  Location     Type
;;  s               1    0[BANK0 ] PTR unsigned char 
;;		 -> STR_4(7), STR_3(6), STR_2(7), STR_1(7), 
;;  i               2    1[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_print_char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text488
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	191
	global	__size_of_print_string
	__size_of_print_string	equ	__end_of_print_string-_print_string
	
_print_string:	
	opt	stack 7
; Regs used in _print_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;print_string@s stored from wreg
	line	194
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(print_string@s)
	
l4297:	
;lcdbt.c: 194: int i=0;
	movlw	low(0)
	movwf	(print_string@i)
	movlw	high(0)
	movwf	((print_string@i))+1
	line	195
;lcdbt.c: 195: while(s[i])
	goto	l1211
	
l1212:	
	line	197
	
l4299:	
;lcdbt.c: 196: {
;lcdbt.c: 197: print_char(s[i]);
	movf	(print_string@i),w
	addwf	(print_string@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_print_char
	line	198
	
l4301:	
;lcdbt.c: 198: i++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(print_string@i),f
	skipnc
	incf	(print_string@i+1),f
	movlw	high(01h)
	addwf	(print_string@i+1),f
	line	199
	
l1211:	
	line	195
	
l4303:	
	movf	(print_string@i),w
	addwf	(print_string@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2711
	goto	u2710
u2711:
	goto	l1212
u2710:
	
l1213:	
	line	201
	
l1214:	
	return
	opt stack 0
GLOBAL	__end_of_print_string
	__end_of_print_string:
;; =============== function _print_string ends ============

	signat	_print_string,4216
	global	_goto_ligne_1
psect	text489,local,class=CODE,delta=2
global __ptext489
__ptext489:

;; *************** function _goto_ligne_1 *****************
;; Defined at:
;;		line 209 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ecriture_commande
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text489
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	209
	global	__size_of_goto_ligne_1
	__size_of_goto_ligne_1	equ	__end_of_goto_ligne_1-_goto_ligne_1
	
_goto_ligne_1:	
	opt	stack 7
; Regs used in _goto_ligne_1: [wreg+status,2+status,0+pclath+cstack]
	line	212
	
l4295:	
;lcdbt.c: 212: ecriture_commande(0x80);
	movlw	(080h)
	fcall	_ecriture_commande
	line	215
	
l1217:	
	return
	opt stack 0
GLOBAL	__end_of_goto_ligne_1
	__end_of_goto_ligne_1:
;; =============== function _goto_ligne_1 ends ============

	signat	_goto_ligne_1,88
	global	_efface
psect	text490,local,class=CODE,delta=2
global __ptext490
__ptext490:

;; *************** function _efface *****************
;; Defined at:
;;		line 294 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ecriture_commande
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text490
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	294
	global	__size_of_efface
	__size_of_efface	equ	__end_of_efface-_efface
	
_efface:	
	opt	stack 7
; Regs used in _efface: [wreg+status,2+status,0+pclath+cstack]
	line	297
	
l4293:	
;lcdbt.c: 297: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	line	298
	
l1240:	
	return
	opt stack 0
GLOBAL	__end_of_efface
	__end_of_efface:
;; =============== function _efface ends ============

	signat	_efface,88
	global	_init_LCD
psect	text491,local,class=CODE,delta=2
global __ptext491
__ptext491:

;; *************** function _init_LCD *****************
;; Defined at:
;;		line 117 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_tempo_N_ms
;;		_ecriture_commande
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text491
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	117
	global	__size_of_init_LCD
	__size_of_init_LCD	equ	__end_of_init_LCD-_init_LCD
	
_init_LCD:	
	opt	stack 7
; Regs used in _init_LCD: [wreg+status,2+status,0+pclath+cstack]
	line	118
	
l4251:	
;lcdbt.c: 118: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	119
	
l4253:	
;lcdbt.c: 119: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	120
	
l4255:	
;lcdbt.c: 120: RD7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(71/8),(71)&7
	line	121
	
l4257:	
;lcdbt.c: 121: RD4=0;
	bcf	(68/8),(68)&7
	line	122
	
l4259:	
;lcdbt.c: 122: RD6=0;
	bcf	(70/8),(70)&7
	line	123
	
l4261:	
;lcdbt.c: 123: RD5=0;
	bcf	(69/8),(69)&7
	line	125
	
l4263:	
;lcdbt.c: 125: PORTD=PORTD|0x03;
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	line	126
	
l4265:	
;lcdbt.c: 126: RD6=1;
	bsf	(70/8),(70)&7
	line	127
	
l4267:	
;lcdbt.c: 127: RD6=0;
	bcf	(70/8),(70)&7
	line	128
	
l4269:	
;lcdbt.c: 128: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	131
	
l4271:	
;lcdbt.c: 131: PORTD=PORTD|0x03;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	line	132
	
l4273:	
;lcdbt.c: 132: RD6=1;
	bsf	(70/8),(70)&7
	line	133
	
l4275:	
;lcdbt.c: 133: RD6=0;
	bcf	(70/8),(70)&7
	line	137
	
l4277:	
;lcdbt.c: 137: PORTD=PORTD|0x03;
	movf	(8),w	;volatile
	iorlw	03h
	movwf	(8)	;volatile
	line	138
	
l4279:	
;lcdbt.c: 138: RD6=1;
	bsf	(70/8),(70)&7
	line	139
	
l4281:	
;lcdbt.c: 139: RD6=0;
	bcf	(70/8),(70)&7
	line	140
	
l4283:	
;lcdbt.c: 140: tempo_N_ms(30);
	movlw	low(01Eh)
	movwf	(?_tempo_N_ms)
	movlw	high(01Eh)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	145
	
l4285:	
;lcdbt.c: 145: ecriture_commande(0x28);
	movlw	(028h)
	fcall	_ecriture_commande
	line	148
	
l4287:	
;lcdbt.c: 148: ecriture_commande(0x0F);
	movlw	(0Fh)
	fcall	_ecriture_commande
	line	152
	
l4289:	
;lcdbt.c: 152: ecriture_commande(0x01);
	movlw	(01h)
	fcall	_ecriture_commande
	line	157
	
l4291:	
;lcdbt.c: 157: ecriture_commande(0x06);
	movlw	(06h)
	fcall	_ecriture_commande
	line	158
	
l1205:	
	return
	opt stack 0
GLOBAL	__end_of_init_LCD
	__end_of_init_LCD:
;; =============== function _init_LCD ends ============

	signat	_init_LCD,88
	global	_ecriture_commande
psect	text492,local,class=CODE,delta=2
global __ptext492
__ptext492:

;; *************** function _ecriture_commande *****************
;; Defined at:
;;		line 97 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;  commande        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  commande        1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_attente_bf
;; This function is called by:
;;		_init_LCD
;;		_goto_ligne_1
;;		_goto_ligne_2
;;		_efface
;;		_curseur_droite
;;		_curseur_gauche
;;		_ecran_droite
;;		_ecran_gauche
;;		_go_to
;; This function uses a non-reentrant model
;;
psect	text492
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	97
	global	__size_of_ecriture_commande
	__size_of_ecriture_commande	equ	__end_of_ecriture_commande-_ecriture_commande
	
_ecriture_commande:	
	opt	stack 6
; Regs used in _ecriture_commande: [wreg+status,2+status,0+pclath+cstack]
;ecriture_commande@commande stored from wreg
	movwf	(ecriture_commande@commande)
	line	98
	
l4233:	
;lcdbt.c: 98: attente_bf();
	fcall	_attente_bf
	line	99
	
l4235:	
;lcdbt.c: 99: RD5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(69/8),(69)&7
	line	100
	
l4237:	
;lcdbt.c: 100: RD4=0;
	bcf	(68/8),(68)&7
	line	101
	
l4239:	
;lcdbt.c: 101: PORTD=((commande>>4)&0x0F)|0x80;
	movf	(ecriture_commande@commande),w
	movwf	(??_ecriture_commande+0)+0
	movlw	04h
u2705:
	clrc
	rrf	(??_ecriture_commande+0)+0,f
	addlw	-1
	skipz
	goto	u2705
	movf	0+(??_ecriture_commande+0)+0,w
	andlw	0Fh
	iorlw	080h
	movwf	(8)	;volatile
	line	103
	
l4241:	
;lcdbt.c: 103: RD6=1;
	bsf	(70/8),(70)&7
	line	104
	
l4243:	
;lcdbt.c: 104: RD6=0;
	bcf	(70/8),(70)&7
	line	106
	
l4245:	
;lcdbt.c: 106: PORTD=(commande&0x0F)|0x80;
	movf	(ecriture_commande@commande),w
	andlw	0Fh
	iorlw	080h
	movwf	(8)	;volatile
	line	108
	
l4247:	
;lcdbt.c: 108: RD6=1;
	bsf	(70/8),(70)&7
	line	109
	
l4249:	
;lcdbt.c: 109: RD6=0;
	bcf	(70/8),(70)&7
	line	110
	
l1202:	
	return
	opt stack 0
GLOBAL	__end_of_ecriture_commande
	__end_of_ecriture_commande:
;; =============== function _ecriture_commande ends ============

	signat	_ecriture_commande,4216
	global	_print_char
psect	text493,local,class=CODE,delta=2
global __ptext493
__ptext493:

;; *************** function _print_char *****************
;; Defined at:
;;		line 165 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;  car             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  car             1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_attente_bf
;; This function is called by:
;;		_main
;;		_print_string
;; This function uses a non-reentrant model
;;
psect	text493
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	165
	global	__size_of_print_char
	__size_of_print_char	equ	__end_of_print_char-_print_char
	
_print_char:	
	opt	stack 7
; Regs used in _print_char: [wreg+status,2+status,0+pclath+cstack]
;print_char@car stored from wreg
	line	168
	movwf	(print_char@car)
	
l4219:	
;lcdbt.c: 168: attente_bf();
	fcall	_attente_bf
	line	170
	
l4221:	
;lcdbt.c: 170: PORTD=0xD0;
	movlw	(0D0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	171
	
l4223:	
;lcdbt.c: 171: PORTD|=((car>>4)&0x0F);
	movf	(print_char@car),w
	movwf	(??_print_char+0)+0
	movlw	04h
u2695:
	clrc
	rrf	(??_print_char+0)+0,f
	addlw	-1
	skipz
	goto	u2695
	movf	0+(??_print_char+0)+0,w
	andlw	0Fh
	movwf	(??_print_char+1)+0
	movf	(??_print_char+1)+0,w
	iorwf	(8),f	;volatile
	line	173
	
l4225:	
;lcdbt.c: 173: RD6=0;
	bcf	(70/8),(70)&7
	line	175
	
l4227:	
;lcdbt.c: 175: PORTD=0xD0;
	movlw	(0D0h)
	movwf	(8)	;volatile
	line	176
	
l4229:	
;lcdbt.c: 176: PORTD|=(car & 0x0F);
	movf	(print_char@car),w
	andlw	0Fh
	movwf	(??_print_char+0)+0
	movf	(??_print_char+0)+0,w
	iorwf	(8),f	;volatile
	line	180
	
l4231:	
;lcdbt.c: 180: RD6=0;
	bcf	(70/8),(70)&7
	line	184
	
l1208:	
	return
	opt stack 0
GLOBAL	__end_of_print_char
	__end_of_print_char:
;; =============== function _print_char ends ============

	signat	_print_char,4216
	global	_attente_bf
psect	text494,local,class=CODE,delta=2
global __ptext494
__ptext494:

;; *************** function _attente_bf *****************
;; Defined at:
;;		line 88 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lecture_commande
;; This function is called by:
;;		_ecriture_commande
;;		_print_char
;; This function uses a non-reentrant model
;;
psect	text494
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	88
	global	__size_of_attente_bf
	__size_of_attente_bf	equ	__end_of_attente_bf-_attente_bf
	
_attente_bf:	
	opt	stack 5
; Regs used in _attente_bf: [wreg+status,2+status,0+pclath+cstack]
	line	89
	
l4215:	
;lcdbt.c: 89: while (lecture_commande( ) & 0x80);
	goto	l1196
	
l1197:	
	
l1196:	
	
l4217:	
	fcall	_lecture_commande
	movwf	(??_attente_bf+0)+0
	btfsc	0+(??_attente_bf+0)+0,(7)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l1197
u2680:
	
l1198:	
	line	90
	
l1199:	
	return
	opt stack 0
GLOBAL	__end_of_attente_bf
	__end_of_attente_bf:
;; =============== function _attente_bf ends ============

	signat	_attente_bf,88
	global	_lecture_commande
psect	text495,local,class=CODE,delta=2
global __ptext495
__ptext495:

;; *************** function _lecture_commande *****************
;; Defined at:
;;		line 64 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  quartet_comm    1    8[COMMON] unsigned char 
;;  commande        1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_tempo_N_ms
;; This function is called by:
;;		_attente_bf
;; This function uses a non-reentrant model
;;
psect	text495
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	64
	global	__size_of_lecture_commande
	__size_of_lecture_commande	equ	__end_of_lecture_commande-_lecture_commande
	
_lecture_commande:	
	opt	stack 4
; Regs used in _lecture_commande: [wreg+status,2+status,0+pclath+cstack]
	line	66
	
l4183:	
;lcdbt.c: 65: unsigned char commande, quartet_commande;
;lcdbt.c: 66: TRISD=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(136)^080h	;volatile
	line	67
	
l4185:	
;lcdbt.c: 67: RD5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(69/8),(69)&7
	line	68
	
l4187:	
;lcdbt.c: 68: RD4=0;
	bcf	(68/8),(68)&7
	line	69
	
l4189:	
;lcdbt.c: 69: tempo_N_ms(2);
	movlw	low(02h)
	movwf	(?_tempo_N_ms)
	movlw	high(02h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	70
	
l4191:	
;lcdbt.c: 70: RD6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(70/8),(70)&7
	line	71
	
l4193:	
;lcdbt.c: 71: quartet_commande=PORTD;
	movf	(8),w	;volatile
	movwf	(??_lecture_commande+0)+0
	movf	(??_lecture_commande+0)+0,w
	movwf	(lecture_commande@quartet_commande)
	line	72
	
l4195:	
;lcdbt.c: 72: commande=((quartet_commande<<4)& 0xF0);
	movf	(lecture_commande@quartet_commande),w
	movwf	(??_lecture_commande+0)+0
	movlw	(04h)-1
u2675:
	clrc
	rlf	(??_lecture_commande+0)+0,f
	addlw	-1
	skipz
	goto	u2675
	clrc
	rlf	(??_lecture_commande+0)+0,w
	andlw	0F0h
	movwf	(??_lecture_commande+1)+0
	movf	(??_lecture_commande+1)+0,w
	movwf	(lecture_commande@commande)
	line	73
	
l4197:	
;lcdbt.c: 73: RD6=0;
	bcf	(70/8),(70)&7
	line	74
	
l4199:	
;lcdbt.c: 74: RD6=1;
	bsf	(70/8),(70)&7
	line	75
	
l4201:	
;lcdbt.c: 75: quartet_commande=PORTD;
	movf	(8),w	;volatile
	movwf	(??_lecture_commande+0)+0
	movf	(??_lecture_commande+0)+0,w
	movwf	(lecture_commande@quartet_commande)
	line	76
	
l4203:	
;lcdbt.c: 76: commande=commande|(quartet_commande & 0x0F);
	movf	(lecture_commande@quartet_commande),w
	andlw	0Fh
	iorwf	(lecture_commande@commande),w
	movwf	(??_lecture_commande+0)+0
	movf	(??_lecture_commande+0)+0,w
	movwf	(lecture_commande@commande)
	line	77
	
l4205:	
;lcdbt.c: 77: RD6=0;
	bcf	(70/8),(70)&7
	line	78
	
l4207:	
;lcdbt.c: 78: RD5=0;
	bcf	(69/8),(69)&7
	line	79
	
l4209:	
;lcdbt.c: 79: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	80
	
l4211:	
;lcdbt.c: 80: return(commande);
	movf	(lecture_commande@commande),w
	
l4213:	
	line	81
	
l1193:	
	return
	opt stack 0
GLOBAL	__end_of_lecture_commande
	__end_of_lecture_commande:
;; =============== function _lecture_commande ends ============

	signat	_lecture_commande,89
	global	_request_gps
psect	text496,local,class=CODE,delta=2
global __ptext496
__ptext496:

;; *************** function _request_gps *****************
;; Defined at:
;;		line 122 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
;; Parameters:    Size  Location     Type
;;  commande        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  commande        1    7[COMMON] unsigned char 
;;  low_byte        1    9[COMMON] unsigned char 
;;  high_byte       1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_emet_string
;;		_emet_car
;;		_tempo_N_ms
;;		_recoit_car
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text496
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	122
	global	__size_of_request_gps
	__size_of_request_gps	equ	__end_of_request_gps-_request_gps
	
_request_gps:	
	opt	stack 7
; Regs used in _request_gps: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
;request_gps@commande stored from wreg
	line	125
	movwf	(request_gps@commande)
	
l4155:	
;functions .c: 125: emet_string((unsigned char *)"!GPS");
	movlw	((STR_5-__stringbase))&0ffh
	fcall	_emet_string
	line	127
	
l4157:	
;functions .c: 127: emet_car(commande);
	movf	(request_gps@commande),w
	fcall	_emet_car
	line	130
	
l4159:	
;functions .c: 130: tempo_N_ms(100);
	movlw	low(064h)
	movwf	(?_tempo_N_ms)
	movlw	high(064h)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	131
	
l4161:	
;functions .c: 131: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	133
;functions .c: 133: switch (commande) {
	goto	l1855
	line	134
;functions .c: 134: case 0x03:
	
l1856:	
	line	135
	
l4163:	
;functions .c: 135: tmHrs = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_tmHrs)
	line	136
;functions .c: 136: tmMins = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_tmMins)
	line	137
;functions .c: 137: tmSecs = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_tmSecs)
	line	138
;functions .c: 138: break;
	goto	l1857
	line	140
;functions .c: 140: case 0x04:
	
l1858:	
	line	141
	
l4165:	
;functions .c: 141: day = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_day)
	line	142
;functions .c: 142: month = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_month)
	line	143
;functions .c: 143: year = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_year)
	line	144
;functions .c: 144: break;
	goto	l1857
	line	146
;functions .c: 146: case 0x05:
	
l1859:	
	line	147
	
l4167:	
;functions .c: 147: degrees = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_degrees)
	line	148
;functions .c: 148: minutes = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_minutes)
	line	150
;functions .c: 150: unsigned char high_byte = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	movwf	(request_gps@high_byte)
	line	151
;functions .c: 151: unsigned char low_byte = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	movwf	(request_gps@low_byte)
	line	152
	
l4169:	
;functions .c: 152: minutesD = (high_byte << 8) + low_byte;
	movf	(request_gps@high_byte),w
	movwf	(??_request_gps+0)+0
	clrf	(??_request_gps+0)+0+1
	movlw	08h
	movwf	btemp+0
u2655:
	clrc
	rlf	(??_request_gps+0)+0,f
	rlf	(??_request_gps+0)+1,f
	decfsz	btemp+0,f
	goto	u2655
	movf	(request_gps@low_byte),w
	addwf	0+(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_minutesD)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_request_gps+0)+0,w
	movwf	1+(_minutesD)
	line	153
	
l4171:	
;functions .c: 153: dir = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_dir)
	line	154
;functions .c: 154: break;
	goto	l1857
	line	156
;functions .c: 156: case 0x06:
	
l1860:	
	line	157
	
l4173:	
;functions .c: 157: degrees = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_degrees)
	line	158
;functions .c: 158: minutes = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_minutes)
	line	160
;functions .c: 160: high_byte = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	movwf	(request_gps@high_byte)
	line	161
;functions .c: 161: low_byte = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	movwf	(request_gps@low_byte)
	line	162
	
l4175:	
;functions .c: 162: minutesD = (high_byte << 8) + low_byte;
	movf	(request_gps@high_byte),w
	movwf	(??_request_gps+0)+0
	clrf	(??_request_gps+0)+0+1
	movlw	08h
	movwf	btemp+0
u2665:
	clrc
	rlf	(??_request_gps+0)+0,f
	rlf	(??_request_gps+0)+1,f
	decfsz	btemp+0,f
	goto	u2665
	movf	(request_gps@low_byte),w
	addwf	0+(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_minutesD)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_request_gps+0)+0,w
	movwf	1+(_minutesD)
	line	163
	
l4177:	
;functions .c: 163: dir = recoit_car();
	fcall	_recoit_car
	movwf	(??_request_gps+0)+0
	movf	(??_request_gps+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_dir)
	line	164
;functions .c: 164: break;
	goto	l1857
	line	166
;functions .c: 166: default:
	
l1861:	
	line	167
;functions .c: 167: break;
	goto	l1857
	line	168
	
l4179:	
;functions .c: 168: }
	goto	l1857
	line	133
	
l1855:	
	
l4181:	
	movf	(request_gps@commande),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 3 to 6
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    34    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	3^0	; case 3
	skipnz
	goto	l1856
	xorlw	4^3	; case 4
	skipnz
	goto	l1858
	xorlw	5^4	; case 5
	skipnz
	goto	l1859
	xorlw	6^5	; case 6
	skipnz
	goto	l1860
	goto	l1861

	line	168
	
l1857:	
	line	169
	
l1862:	
	return
	opt stack 0
GLOBAL	__end_of_request_gps
	__end_of_request_gps:
;; =============== function _request_gps ends ============

	signat	_request_gps,4216
	global	_init_gps_mode_smart
psect	text497,local,class=CODE,delta=2
global __ptext497
__ptext497:

;; *************** function _init_gps_mode_smart *****************
;; Defined at:
;;		line 104 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_tempo_N_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text497
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	104
	global	__size_of_init_gps_mode_smart
	__size_of_init_gps_mode_smart	equ	__end_of_init_gps_mode_smart-_init_gps_mode_smart
	
_init_gps_mode_smart:	
	opt	stack 7
; Regs used in _init_gps_mode_smart: [wreg+status,2+status,0+pclath+cstack]
	line	109
	
l4151:	
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
	line	119
	
l4153:	
;functions .c: 119: tempo_N_ms(10);
	movlw	low(0Ah)
	movwf	(?_tempo_N_ms)
	movlw	high(0Ah)
	movwf	((?_tempo_N_ms))+1
	fcall	_tempo_N_ms
	line	120
	
l1852:	
	return
	opt stack 0
GLOBAL	__end_of_init_gps_mode_smart
	__end_of_init_gps_mode_smart:
;; =============== function _init_gps_mode_smart ends ============

	signat	_init_gps_mode_smart,88
	global	_emet_string
psect	text498,local,class=CODE,delta=2
global __ptext498
__ptext498:

;; *************** function _emet_string *****************
;; Defined at:
;;		line 86 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
;; Parameters:    Size  Location     Type
;;  message         1    wreg     PTR unsigned char 
;;		 -> STR_5(5), 
;; Auto vars:     Size  Location     Type
;;  message         1    2[COMMON] PTR unsigned char 
;;		 -> STR_5(5), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_emet_car
;; This function is called by:
;;		_request_gps
;; This function uses a non-reentrant model
;;
psect	text498
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	86
	global	__size_of_emet_string
	__size_of_emet_string	equ	__end_of_emet_string-_emet_string
	
_emet_string:	
	opt	stack 6
; Regs used in _emet_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;emet_string@message stored from wreg
	movwf	(emet_string@message)
	line	88
	
l4143:	
;functions .c: 88: while (*message != 0)
	goto	l1840
	
l1841:	
	line	90
	
l4145:	
;functions .c: 89: {
;functions .c: 90: emet_car(*message);
	movf	(emet_string@message),w
	movwf	fsr0
	fcall	stringdir
	fcall	_emet_car
	line	91
	
l4147:	
;functions .c: 91: message++;
	movlw	(01h)
	movwf	(??_emet_string+0)+0
	movf	(??_emet_string+0)+0,w
	addwf	(emet_string@message),f
	line	92
	
l1840:	
	line	88
	
l4149:	
	movf	(emet_string@message),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l1841
u2640:
	
l1842:	
	line	94
	
l1843:	
	return
	opt stack 0
GLOBAL	__end_of_emet_string
	__end_of_emet_string:
;; =============== function _emet_string ends ============

	signat	_emet_string,4216
	global	_tempo_N_ms
psect	text499,local,class=CODE,delta=2
global __ptext499
__ptext499:

;; *************** function _tempo_N_ms *****************
;; Defined at:
;;		line 17 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;  N               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_tempo_1_ms
;; This function is called by:
;;		_main
;;		_lecture_commande
;;		_init_LCD
;;		_init_gps_mode_smart
;;		_request_gps
;; This function uses a non-reentrant model
;;
psect	text499
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	17
	global	__size_of_tempo_N_ms
	__size_of_tempo_N_ms	equ	__end_of_tempo_N_ms-_tempo_N_ms
	
_tempo_N_ms:	
	opt	stack 3
; Regs used in _tempo_N_ms: [wreg+status,2+status,0+pclath+cstack]
	line	20
	
l4129:	
;lcdbt.c: 18: int i;
;lcdbt.c: 20: OPTION=OPTION & 0b11000001;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(129)^080h,w
	andlw	0C1h
	movwf	(129)^080h
	line	21
	
l4131:	
;lcdbt.c: 21: TMR0=6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	22
	
l4133:	
;lcdbt.c: 22: T0IF=0;
	bcf	(90/8),(90)&7
	line	23
	
l4135:	
;lcdbt.c: 23: for(i=0;i<N;i++)
	movlw	low(0)
	movwf	(tempo_N_ms@i)
	movlw	high(0)
	movwf	((tempo_N_ms@i))+1
	goto	l1181
	line	25
	
l1182:	
	
l4137:	
;lcdbt.c: 25: tempo_1_ms();
	fcall	_tempo_1_ms
	line	23
	
l4139:	
	movlw	low(01h)
	addwf	(tempo_N_ms@i),f
	skipnc
	incf	(tempo_N_ms@i+1),f
	movlw	high(01h)
	addwf	(tempo_N_ms@i+1),f
	
l1181:	
	
l4141:	
	movf	(tempo_N_ms@i+1),w
	xorlw	80h
	movwf	(??_tempo_N_ms+0)+0
	movf	(tempo_N_ms@N+1),w
	xorlw	80h
	subwf	(??_tempo_N_ms+0)+0,w
	skipz
	goto	u2635
	movf	(tempo_N_ms@N),w
	subwf	(tempo_N_ms@i),w
u2635:

	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l1182
u2630:
	
l1183:	
	line	26
	
l1184:	
	return
	opt stack 0
GLOBAL	__end_of_tempo_N_ms
	__end_of_tempo_N_ms:
;; =============== function _tempo_N_ms ends ============

	signat	_tempo_N_ms,4216
	global	_allume_LCD
psect	text500,local,class=CODE,delta=2
global __ptext500
__ptext500:

;; *************** function _allume_LCD *****************
;; Defined at:
;;		line 50 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_init_PORTD
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text500
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	50
	global	__size_of_allume_LCD
	__size_of_allume_LCD	equ	__end_of_allume_LCD-_allume_LCD
	
_allume_LCD:	
	opt	stack 7
; Regs used in _allume_LCD: [status,2+status,0+pclath+cstack]
	line	53
	
l4125:	
;lcdbt.c: 53: init_PORTD();
	fcall	_init_PORTD
	line	54
	
l4127:	
;lcdbt.c: 54: RD7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(71/8),(71)&7
	line	56
	
l1190:	
	return
	opt stack 0
GLOBAL	__end_of_allume_LCD
	__end_of_allume_LCD:
;; =============== function _allume_LCD ends ============

	signat	_allume_LCD,88
	global	___awmod
psect	text501,local,class=CODE,delta=2
global __ptext501
__ptext501:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text501
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 7
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l4089:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awmod@sign)
	line	9
	
l4091:	
	btfss	(___awmod@dividend+1),7
	goto	u2541
	goto	u2540
u2541:
	goto	l2079
u2540:
	line	10
	
l4093:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	line	12
	
l2079:	
	line	13
	
l4095:	
	btfss	(___awmod@divisor+1),7
	goto	u2551
	goto	u2550
u2551:
	goto	l2080
u2550:
	line	14
	
l4097:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	
l2080:	
	line	15
	
l4099:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2561
	goto	u2560
u2561:
	goto	l2081
u2560:
	line	16
	
l4101:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2082
	
l2083:	
	line	18
	
l4103:	
	movlw	01h
	
u2575:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2575
	line	19
	
l4105:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	line	20
	
l2082:	
	line	17
	
l4107:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l2083
u2580:
	
l2084:	
	line	21
	
l2085:	
	line	22
	
l4109:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2595
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2595:
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l2086
u2590:
	line	23
	
l4111:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	
l2086:	
	line	24
	
l4113:	
	movlw	01h
	
u2605:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2605
	line	25
	
l4115:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2611
	goto	u2610
u2611:
	goto	l2085
u2610:
	
l2087:	
	line	26
	
l2081:	
	line	27
	
l4117:	
	movf	(___awmod@sign),w
	skipz
	goto	u2620
	goto	l2088
u2620:
	line	28
	
l4119:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	
l2088:	
	line	29
	
l4121:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	
l4123:	
	line	30
	
l2089:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text502,local,class=CODE,delta=2
global __ptext502
__ptext502:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text502
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 7
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4051:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awdiv@sign)
	line	10
	
l4053:	
	btfss	(___awdiv@divisor+1),7
	goto	u2441
	goto	u2440
u2441:
	goto	l2011
u2440:
	line	11
	
l4055:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	line	13
	
l2011:	
	line	14
	
l4057:	
	btfss	(___awdiv@dividend+1),7
	goto	u2451
	goto	u2450
u2451:
	goto	l2012
u2450:
	line	15
	
l4059:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4061:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	line	17
	
l2012:	
	line	18
	movlw	low(0)
	movwf	(___awdiv@quotient)
	movlw	high(0)
	movwf	((___awdiv@quotient))+1
	line	19
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2461
	goto	u2460
u2461:
	goto	l2013
u2460:
	line	20
	
l4063:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2014
	
l2015:	
	line	22
	
l4065:	
	movlw	01h
	
u2475:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2475
	line	23
	
l4067:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	line	24
	
l2014:	
	line	21
	
l4069:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l2015
u2480:
	
l2016:	
	line	25
	
l2017:	
	line	26
	
l4071:	
	movlw	01h
	
u2495:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2495
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2505
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2505:
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l2018
u2500:
	line	28
	
l4073:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l4075:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	30
	
l2018:	
	line	31
	
l4077:	
	movlw	01h
	
u2515:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2515
	line	32
	
l4079:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2521
	goto	u2520
u2521:
	goto	l2017
u2520:
	
l2019:	
	line	33
	
l2013:	
	line	34
	
l4081:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2530
	goto	l2020
u2530:
	line	35
	
l4083:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	
l2020:	
	line	36
	
l4085:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	
l4087:	
	line	37
	
l2021:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text503,local,class=CODE,delta=2
global __ptext503
__ptext503:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         5       1       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text503
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 7
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l4029:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2381
	goto	u2380
u2381:
	goto	l1887
u2380:
	line	9
	
l4031:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l1888
	
l1889:	
	line	11
	
l4033:	
	movlw	01h
	
u2395:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2395
	line	12
	
l4035:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	line	13
	
l1888:	
	line	10
	
l4037:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l1889
u2400:
	
l1890:	
	line	14
	
l1891:	
	line	15
	
l4039:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2415
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2415:
	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l1892
u2410:
	line	16
	
l4041:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	
l1892:	
	line	17
	
l4043:	
	movlw	01h
	
u2425:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2425
	line	18
	
l4045:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2431
	goto	u2430
u2431:
	goto	l1891
u2430:
	
l1893:	
	line	19
	
l1887:	
	line	20
	
l4047:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	
l4049:	
	line	21
	
l1894:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text504,local,class=CODE,delta=2
global __ptext504
__ptext504:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text504
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l4005:	
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2311
	goto	u2310
u2311:
	goto	l1877
u2310:
	line	11
	
l4007:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l1878
	
l1879:	
	line	13
	
l4009:	
	movlw	01h
	
u2325:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2325
	line	14
	
l4011:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	line	15
	
l1878:	
	line	12
	
l4013:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l1879
u2330:
	
l1880:	
	line	16
	
l1881:	
	line	17
	
l4015:	
	movlw	01h
	
u2345:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2345
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2355
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2355:
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l1882
u2350:
	line	19
	
l4017:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l4019:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	21
	
l1882:	
	line	22
	
l4021:	
	movlw	01h
	
u2365:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2365
	line	23
	
l4023:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2371
	goto	u2370
u2371:
	goto	l1881
u2370:
	
l1883:	
	line	24
	
l1877:	
	line	25
	
l4025:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	
l4027:	
	line	26
	
l1884:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_recoit_car
psect	text505,local,class=CODE,delta=2
global __ptext505
__ptext505:

;; *************** function _recoit_car *****************
;; Defined at:
;;		line 97 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_request_gps
;; This function uses a non-reentrant model
;;
psect	text505
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	97
	global	__size_of_recoit_car
	__size_of_recoit_car	equ	__end_of_recoit_car-_recoit_car
	
_recoit_car:	
	opt	stack 6
; Regs used in _recoit_car: [wreg]
	line	98
	
l3999:	
;functions .c: 98: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	99
;functions .c: 99: while (RCIF != 1);
	goto	l1846
	
l1847:	
	
l1846:	
	btfss	(101/8),(101)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l1847
u2300:
	
l1848:	
	line	100
	
l4001:	
;functions .c: 100: return RCREG;
	movf	(26),w	;volatile
	
l4003:	
	line	102
	
l1849:	
	return
	opt stack 0
GLOBAL	__end_of_recoit_car
	__end_of_recoit_car:
;; =============== function _recoit_car ends ============

	signat	_recoit_car,89
	global	_emet_car
psect	text506,local,class=CODE,delta=2
global __ptext506
__ptext506:

;; *************** function _emet_car *****************
;; Defined at:
;;		line 76 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
;; Parameters:    Size  Location     Type
;;  car             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  car             1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_emet_string
;;		_request_gps
;; This function uses a non-reentrant model
;;
psect	text506
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	76
	global	__size_of_emet_car
	__size_of_emet_car	equ	__end_of_emet_car-_emet_car
	
_emet_car:	
	opt	stack 6
; Regs used in _emet_car: [wreg]
;emet_car@car stored from wreg
	movwf	(emet_car@car)
	line	77
	
l3995:	
;functions .c: 77: RC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	78
;functions .c: 78: while(TXIF !=1 );
	goto	l1834
	
l1835:	
	
l1834:	
	btfss	(100/8),(100)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l1835
u2290:
	
l1836:	
	line	79
	
l3997:	
;functions .c: 79: TXREG = car;
	movf	(emet_car@car),w
	movwf	(25)	;volatile
	line	80
	
l1837:	
	return
	opt stack 0
GLOBAL	__end_of_emet_car
	__end_of_emet_car:
;; =============== function _emet_car ends ============

	signat	_emet_car,4216
	global	_tempo_1_ms
psect	text507,local,class=CODE,delta=2
global __ptext507
__ptext507:

;; *************** function _tempo_1_ms *****************
;; Defined at:
;;		line 12 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_tempo_N_ms
;; This function uses a non-reentrant model
;;
psect	text507
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	12
	global	__size_of_tempo_1_ms
	__size_of_tempo_1_ms	equ	__end_of_tempo_1_ms-_tempo_1_ms
	
_tempo_1_ms:	
	opt	stack 2
; Regs used in _tempo_1_ms: []
	
l3979:	
	goto	l1175
	
l1176:	
	
l1175:	
	btfss	(90/8),(90)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l1176
u2270:
	
l1177:	
	line	13
;lcdbt.c: 13: T0IF=0;
	bcf	(90/8),(90)&7
	line	14
	
l1178:	
	return
	opt stack 0
GLOBAL	__end_of_tempo_1_ms
	__end_of_tempo_1_ms:
;; =============== function _tempo_1_ms ends ============

	signat	_tempo_1_ms,88
	global	_init_liaison_serie
psect	text508,local,class=CODE,delta=2
global __ptext508
__ptext508:

;; *************** function _init_liaison_serie *****************
;; Defined at:
;;		line 47 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text508
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\functions .c"
	line	47
	global	__size_of_init_liaison_serie
	__size_of_init_liaison_serie	equ	__end_of_init_liaison_serie-_init_liaison_serie
	
_init_liaison_serie:	
	opt	stack 7
; Regs used in _init_liaison_serie: [wreg]
	line	49
	
l3953:	
;functions .c: 49: BRGH = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1218/8)^080h,(1218)&7
	line	50
	
l3955:	
;functions .c: 50: SPBRG = 51;
	movlw	(033h)
	movwf	(153)^080h	;volatile
	line	53
	
l3957:	
;functions .c: 53: SYNC = 0;
	bcf	(1220/8)^080h,(1220)&7
	line	54
	
l3959:	
;functions .c: 54: SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	56
	
l3961:	
;functions .c: 56: TRISC6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1086/8)^080h,(1086)&7
	line	57
	
l3963:	
;functions .c: 57: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	line	60
	
l3965:	
;functions .c: 60: TXIE = 0;
	bcf	(1124/8)^080h,(1124)&7
	line	61
	
l3967:	
;functions .c: 61: RCIE = 0;
	bcf	(1125/8)^080h,(1125)&7
	line	62
	
l3969:	
;functions .c: 62: ADDEN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(195/8),(195)&7
	line	65
	
l3971:	
;functions .c: 65: TX9 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1222/8)^080h,(1222)&7
	line	66
	
l3973:	
;functions .c: 66: RX9 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	69
	
l3975:	
;functions .c: 69: TXEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	line	70
	
l3977:	
;functions .c: 70: CREN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	72
	
l1831:	
	return
	opt stack 0
GLOBAL	__end_of_init_liaison_serie
	__end_of_init_liaison_serie:
;; =============== function _init_liaison_serie ends ============

	signat	_init_liaison_serie,88
	global	_init_PORTD
psect	text509,local,class=CODE,delta=2
global __ptext509
__ptext509:

;; *************** function _init_PORTD *****************
;; Defined at:
;;		line 36 in file "D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_allume_LCD
;; This function uses a non-reentrant model
;;
psect	text509
	file	"D:\MICROCONTREU\projet_gps\projet_1__everything_string\lcdbt.c"
	line	36
	global	__size_of_init_PORTD
	__size_of_init_PORTD	equ	__end_of_init_PORTD-_init_PORTD
	
_init_PORTD:	
	opt	stack 6
; Regs used in _init_PORTD: []
	line	39
	
l3951:	
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
	line	44
	
l1187:	
	return
	opt stack 0
GLOBAL	__end_of_init_PORTD
	__end_of_init_PORTD:
;; =============== function _init_PORTD ends ============

	signat	_init_PORTD,88
psect	text510,local,class=CODE,delta=2
global __ptext510
__ptext510:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
