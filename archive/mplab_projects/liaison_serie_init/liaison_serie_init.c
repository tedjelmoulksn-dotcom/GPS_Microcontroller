 
/*Programme canevas de base pour démarrer une application en C
avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS DEMO BOARD */

#include "pic.h"		// vos headers associés
#include "pic168xa.h"		// à vos projets

//#include <stdio.h> 

#define bit(x) (1<<(x))
#define BAUD 4800	//le module fonctionne ne 4800 baud 
// la valeur à écrire dans le registre SPBRG
// formule table 10.1. page 97 du datasheet
// avec le bit BRGH = 1
// si on ne met que 16 (au lieu de 16UL) ne calcule pas la bonne valeur !!!
#define DIVISEUR (4000000/(16UL * BAUD) - 1)

// __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );
//initialisatoin de la lisainon serie



char	debug	@0x70;		// éviter conflits avec ICD3


void init_liaison_serie(void)
{
// étape 1
BRGH = 1; // mode high speed
SPBRG = DIVISEUR; // le diviseur (en fait 25 pour 9600 Bauds)

// étape 2
SYNC = 0; // mode asynchrone
SPEN = 1; // validation des broches RC6 et RC7 pour liaison
// étape 3
TRISC6 = 0; // MODIFCATION DE LA DIRECTIONNALITE 
TRISC7 = 1; // à 1 aussi

// étape 4 : ici en pooling de TXIF ou TXIE
TXIE = 0; // pas de transmission sous IT : en pooling
RCIE = 0; // pas de réception sous IT : en pooling

// étape 5 : ici mode 8 bits
TX9 = 0; // transmission sur 8 bits
RX9 = 0; // réception sur 8 bits

// étape 6
TXEN = 1; // validation de l'émetteur
CREN = 1; // validation du récepteur
}
//
void main(void)

{
	
// mettre ici votre programme en C

}	

	
