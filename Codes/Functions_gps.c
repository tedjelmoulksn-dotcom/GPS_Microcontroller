/*Programme canevas de base pour démarrer une application en C
avec l'outil HI-TECH Software PICC 
sur la carte PICDEM 2 PLUS DEMO BOARD */

#include "pic.h"		// vos headers associés
#include "pic168xa.h"		// à vos projets
#include "functions.h"
#include "lcdbt.h"
//#include <stdio.h> 

#define bit(x) (1<<(x))

// __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );
#define BAUD 4800	//le module fonctionne ne 4800 baud 
// la valeur à écrire dans le registre SPBRG
// formule table 10.1. page 97 du datasheet
// avec le bit BRGH = 1
// si on ne met que 16 (au lieu de 16UL) ne calcule pas la bonne valeur !!!
#define DIVISEUR 51

#define GetTime	0x03 
#define GetDate 0x04
#define GetLat 0x05 
#define GetLong 0x06 
#define	GetSats	0x02
#define	GetAlt	0x07 


char	debug	@0x70;		// éviter conflits avec ICD3
unsigned char	car;
unsigned char	*message;
unsigned char	commande;
unsigned char	tmHrs;
unsigned char	tmMins;
unsigned char	tmSecs;
unsigned char	day;
unsigned char	month;
unsigned char	year;
unsigned char	degrees;
unsigned char	minutes;
unsigned char	dir;
unsigned int	minutesD;
unsigned long	workVal;
unsigned char   numSats;      // Variable for number of satellites
unsigned int    altitude;     // Variable for altitude
unsigned char alt_low_byte;
unsigned char alt_high_byte;


void init_liaison_serie(void)
{
// étape 1
	BRGH = 1; // mode high speed
	SPBRG = 51; // le diviseur (en fait 25 pour 9600 Bauds)

// étape 2
	SYNC = 0; // mode asynchrone
	SPEN = 1; // validation des broches RC6 et RC7 pour liaison
// étape 3
	TRISC6 = 1; // MODIFCATION DE LA DIRECTIONNALITE 
	TRISC7 = 1; // à 1 aussi

// étape 4 : ici en pooling de TXIF ou TXIE
	TXIE = 0; // pas de transmission sous IT : en pooling
	RCIE = 0; // pas de réception sous IT : en pooling
	ADDEN = 0;

// étape 5 : ici mode 8 bits
	TX9 = 0; // transmission sur 8 bits
	RX9 = 0; // réception sur 8 bits

// étape 6
	TXEN = 1; // validation de l'émetteur
	CREN = 1; // validation du récepteur
	
}

//
void emet_car(unsigned char car) 
{
	RC4=0;
	while(TXIF !=1 ); // attend que le TXREG soit vide
 	TXREG = car; // charge le caractère pour l'envoyer 
}



	
void emet_string(unsigned char *message) 
{	

	while (*message != 0) // Continuer jusqu'à atteindre le caractère nul 
	{ 	
		emet_car(*message); // Envoyer le caractère courant
		message++; // Avancer au caractère suivant dans la chaîne 
	}

}

unsigned char recoit_car(void)
{	
	RC4=1;
	while (RCIF != 1); // Attend que le bit RCIF soit réglé à 1 (caractère reçu)
	return RCREG; // Retourne le caractère reçu depuis le registre RCREG
	
}

void init_gps_mode_smart(void) {
    // Set the directionality of PORTC pins
    // Assuming RC6 is TX, RC7 is RX, and RC4 is used for /RAW pin (change as per your circuit)

	
    TRISC4 = 0;  // 

    // Set the /RAW pin to high to enable Smart Mode
	TRISC5 = 0;	
	RC4=0;
	RC5=1;

   

    // Wait a short period for the GPS module to initialize
	tempo_N_ms(10);			// 1000ms  Adjust delay as necessary
}



void request_gps(unsigned char commande) {

	
	emet_string((unsigned char *)"!GPS");
	
	emet_car(commande);

    
		tempo_N_ms(100);  // Attente pour la réception des données
    RC4=1;

    switch (commande) {
        case GetTime:
   	        tmHrs	= 	recoit_car();
            tmMins	=	recoit_car();
            tmSecs	=	recoit_car();
            break;
        
          case GetDate:
            day = recoit_car();
            month = recoit_car();
            year = recoit_car();
            break;

        case GetLat:
            degrees = recoit_car();
            minutes = recoit_car();
            // Recevoir deux octets et les combiner en un entier 16 bits
            unsigned char high_byte = recoit_car();  // Recevoir l'octet supérieur
            unsigned char low_byte = recoit_car();   // Recevoir l'octet inférieur
            minutesD = (high_byte << 8) + low_byte;  // Combiner les octets en un entier 16 bits
            dir = recoit_car();
            break;
        
        case GetLong:
            degrees = recoit_car();
            minutes = recoit_car();
            // Recevoir deux octets et les combiner en un entier 16 bits
            high_byte = recoit_car();  // Recevoir l'octet supérieur
            low_byte = recoit_car();   // Recevoir l'octet inférieur
            minutesD = (high_byte << 8) + low_byte;  // Combiner les octets en un entier 16 bits
            dir = recoit_car();
            break;
		case GetSats:
            numSats = recoit_car();
            tempo_N_ms(3000);  // Pause to view the output
            break;
        
        case GetAlt:
            alt_high_byte = recoit_car(); // Recevoir l'octet supérieur
            alt_low_byte = recoit_car();  // Recevoir l'octet inférieur
            altitude = (alt_high_byte << 8) + alt_low_byte; // Combiner les octets en un entier 16 bits
            break;
		
       
        default:
            break; 
    }
}
