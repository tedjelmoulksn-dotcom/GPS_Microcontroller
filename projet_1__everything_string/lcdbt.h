// header pour l'interface LCD
// câblée en mode 4 bits 


// affectation du LCD sur le PORTD
#define 	LCD_PORT		PORTD
#define 	LCD_PORT_TRIS	TRISD

// câblage hardware du LCD sur la carte PICDEM 2 PLUS
// quartet fort du PORTD
#define 	RS				RD4 
#define 	RW				RD5	// à compléter
#define 	EN				RD6	// à compléter	
#define 	VCC				RD7	// à compléter

// le quartet faible du PORTD RD3 à RD0 est relié 
// respectivement sur DB7 à DB4 du LCD
// pas de define à faire car lecture ou ecriture
// sur les 4 bits à la fois

// pour la configuration du PORTD 0 = Output et 1 = Input
#define 	RS_TRIS			TRISD4 
#define 	RW_TRIS			TRISD5	// à compléter
#define 	EN_TRIS			TRISD6	// à compléter
#define 	VCC_TRIS		TRISD7	// à compléter

// repérage du Busy_flag
#define 	BUSY_FLAG		0x80


// les prototypes de fonctions
void tempo_1_ms(void);
void tempo_N_ms(int);
void init_PORTD(void);
void allume_LCD(void);
unsigned char lecture_commande (void);
void attente_bf(void);
void ecriture_commande(char);
void init_LCD(void);
void print_char(char);					// fonction à écrire		
void print_string(char *);				// fonction à écrire
void goto_ligne_1(void);				// fonction à écrire				
void goto_ligne_2(void);				// fonction à écrire
void curseur_droite(void);				// fonction à écrire
void curseur_gauche(void);				// fonction à écrire
void ecran_droite(void);				// fonction à écrire
void ecran_gauche(void);				// fonction à écrire
void go_to (int);					// fonction à écrire
void efface(void);					// fonction à écrire



