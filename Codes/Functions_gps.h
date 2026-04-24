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



void init_liaison_serie(void);
void emet_car(unsigned char car) ;
void emet_string(unsigned char *message);
unsigned char recoit_car(void);
void init_gps_mode_smart(void);
void request_gps(unsigned char commande);
