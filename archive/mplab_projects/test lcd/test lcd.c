 
// Programme canevas de base pour démarrer une application en C
// avec l'outil HI-TECH Software PICC 
// sur la carte PICDEM 2 PLUS DEMO BOARD 

#include "pic.h"			// vos headers associés
#include "pic168xa.h"		// à vos projets
#include "lcdbt.h"

#include <stdio.h> 

#define bit(x) (1<<(x))

#define t1ms	63
#define t1s		1000

 __CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );


char	debug	@0x70;		// éviter conflits avec ICD3

void tempo1ms(void)
{
	unsigned int i;
	for(i=0;i<t1ms;i++);
}
// temporsiation fixe de 1 s
void tempo1s(void)
{
	unsigned int i;
	for(i=0;i<t1s;i++)
	{
		tempo1ms();
	}
}
void delay_ms(unsigned int ms)      // fonction delay parameterable
{
	unsigned int i;
	for(i=0;i<ms;i++)
 	{
		tempo1ms();
    }
}
void tempo14us(void)
{
	#asm
	nop
	nop
	nop
	nop
	nop
	nop
	#endasm
}
void init_can (void) 
{	TRISA0=1;
	PCFG3=0;     //configuration de l'entrée analogique RA0
	PCFG2=0;
	PCFG1=0;
	PCFG0=0;     // et VSS=0V  ,VDD=5V
	ADFM=0;		// format justification a gauche
	ADCS1=0;	// diviseur de frequence par 8
	ADCS0=1;
	CHS0=0;    // entrée analogique utilisé
	CHS1=0;		// RA0\AN0
	CHS2=0;
	ADON=1;     // Active la CAN
}
unsigned char conversion (void)
{
	tempo14us();
	GODONE=1;
	while(GODONE);
	return ADRESH;

}
volatile int COUNT=0;
int seconde=0,minute=0,heure=0;
void interrupt timer1_it (void) 
{ 

		TMR1IF = 0; // acquittement IT TIMER1 
		TMR1H=0x3C;  // recharge VIH dans TMR1H  //0xD8 pour 10ms; 
		TMR1L=0xC6;    // recharge VIL dans TMR1L //0xF0 pour 10ms;
		COUNT++; 

} 
void montre(void)
{
	TMR1CS=0;				// la source est l'horloge interne
	T1CKPS0=0;T1CKPS1=0;    // pre-diviseur de 1
	T1OSCEN=0;				// mis a 0 puisque y'a pas de quartz exterieur
	T1SYNC=0;				// 0 ou 1 peu importe
	TMR1IE=1;				// active l'interruption pour timer1 overflow
	PEIE=1;					// activer l'interruption peripherique
	GIE=1;					// permet toutes les interruptions
	TMR1IF=0;				
	TMR1H=0x3C;              // charge  15536 dans 
	TMR1L=0xC6; 			// timer1 pour avoir un compte de 50_000 ticks
	TMR1ON=1;	            // active timer1 
	char buff[50]	;
	while(1)
	{
    	if(COUNT==20)               // count=20 donc on a une seconde
		{
		   	if(seconde<59)         // si on a  moins de 59 seconde donc  on incremente seconde
			{
				seconde++;
			    
			}
			else if(minute<59)     // si seconde =59 et minute<59 on incremente minute
			{
				seconde=0;
				minute++;
			}
			else if(heure<23)    // si seconde=59 , minute=59 et heure <23 on incremente heure
			{
				seconde=0;
				minute=0;
				heure++;
			}
			else
			{ seconde=0;minute=0;heure=0;}   // si on a 23h59m59s alors on revient  a 0h0m0s
			COUNT=0;
		}
		sprintf(buff,"H:%d M:%d S:%d",heure,minute,seconde); // formatage de la chaine
	    print_string(buff);                                   // affiche la chaine
		go_to(1);											  // retourne a la colonne 1 pour reecrire  
	}
}

void millivoltmetre(void)
{
	init_can();
	char buffer[50];             		// fonction à écrire
	while(1)
	{
	 float c=conversion();
	 sprintf(buffer,"V=%.2f mV",c*5000/255);    // on met dans buffer
											    // V=%.2f mV avec %.2f 
											    // le resultat de la conversion converti en volt
	 efface();
	 print_string(buffer);
	 tempo_N_ms(400);
	
	
	}
}

int i;
// montre
/*void main(void)
{

	

	
	init_PORTD();					// fixe la direction des lignes du PORTD
	allume_LCD();					// allume le LCD
	init_LCD();				// initialise le LCD

	montre();
		
			
	
}*/
	
	



// Message deroulant
/*void main(void)
{	
	init_PORTD();					// fixe la direction des lignes du PORTD
	allume_LCD();					// allume le LCD
	init_LCD();
	
	
	char s[]="Universite Paris 13 et Institut Galilee";
	int length=sizeof(s);

	while(1)
	{
		
		print_string(s);
	    for(int i=0;i<length-16;i++) // on deplace l'ecran vers la gauche
		{ 							 // jusqu'a affiicher toute la chaine
	 	     ecran_gauche();
	 	     tempo_N_ms(200);
	    }
					
		tempo_N_ms(1000);        // on attend une seconde
		efface();             //puis on efface le lcd
							// et on recommence
	}

}*/
	

// Millivoltmetre

/*void main(void)
{

	

	init_PORTD();					// fixe la direction des lignes du PORTD
	allume_LCD();					// allume le LCD
	init_LCD();			     	   // initialise le LCD

	millivoltmetre();
	

}*/

// LCD
void main(void)
{
	init_PORTD();					// fixe la direction des lignes du PORTD
	allume_LCD();					// allume le LCD
	init_LCD();			     	// initialise le LCD
	print_string("Le PIC 16F877");	// fonction à écrire
	
	goto_ligne_2();					// fonction à écrire			
	print_string("c'est fastoche");			// fonction à écrire
	
	tempo_N_ms(5000);
	efface();               		// fonction à écrire
  for(i=1;i<17;i++)
	{
	go_to(i);					// fonction à écrire
	print_char(0xFF);
	tempo_N_ms(100);
	}
	go_to(17);
		print_string("   READY !!!"); 	// fonction à écrire
	
	while(1);
}
	

	
