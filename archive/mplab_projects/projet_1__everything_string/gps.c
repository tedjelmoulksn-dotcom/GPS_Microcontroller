#include "pic.h"        // vos headers associés
#include "pic168xa.h"   // à vos projets
#include "functions.h"
#include "lcdbt.h"

#define bit(x) (1<<(x))

__CONFIG(HS & WDTDIS &  BOREN &  LVPDIS );
#define BAUD 4800
#define DIVISEUR 51

#define GetTime 0x03 
#define GetDate 0x04
#define GetLat 0x05 
#define GetLong 0x06 

char debug @0x70; // éviter conflits avec ICD3
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



void main(void) {
 
   
     // Initialize the LCD
    init_PORTD(); 	
    allume_LCD();
	init_LCD(); 

    // Initialize the GPS module in smart mode
    init_gps_mode_smart();
    
   
//   Initialize the serial communication
     init_liaison_serie();
    // Infinite loop to continuously update the LCD with GPS data
//	print_char('A');
        // Request and display date
	while(1)
{

        efface();
        goto_ligne_1();
        print_string("Date: ");
		tempo_N_ms(160);
		request_gps(GetDate);

		tempo_N_ms(1000);
		tempo_N_ms(1000);
		print_char(day / 100 + '0');
        print_char(day % 100 + '0');
        print_char('/');
        print_char(month / 100+ '0');
        print_char(month % 100+ '0');
    	print_char('/');
        print_char(year / 100+'0');
        print_char(year % 100+'0');

		tempo_N_ms(1000);
//        // Request and display time
	
		goto_ligne_2();
		print_string("Time: "); 
		
		tempo_N_ms(160);
		request_gps(GetTime);
        print_char(tmHrs / 10 + '0');
        print_char(tmHrs % 10 + '0');
        print_char(':');
        print_char(tmMins / 10 + '0');
        print_char(tmMins % 10 + '0');
        print_char(':');
        print_char(tmSecs / 10 + '0');
        print_char(tmSecs % 10 + '0');

       // Wait for 3 seconds
		tempo_N_ms(1000);

        // Request and display latitude
        
        efface();
        goto_ligne_1();
        print_string("Lat: ");
		
		tempo_N_ms(160);
		request_gps(GetLat);
        print_char(degrees / 10 + '0');
        print_char(degrees % 10 + '0');
        print_char(' ');
        print_char(minutes / 10 + '0');
        print_char(minutes % 10 + '0');
        print_char('.');
        print_char((minutesD / 1000) % 10 + '0');
        print_char((minutesD / 100) % 10 + '0');
        print_char((minutesD / 10) % 10 + '0');
        print_char(minutesD % 10 + '0');
        print_char(' ');
        print_char(dir);
		tempo_N_ms(1000);


        // Request and display longitude
    
        goto_ligne_2();
        print_string("Long: ");
		
		tempo_N_ms(160);
		request_gps(GetLong);
		print_char(degrees / 10 + '0');
        print_char(degrees % 10 + '0');
        print_char(' ');
        print_char(minutes / 10 + '0');
        print_char(minutes % 10 + '0');
        print_char('.');
        print_char((minutesD / 1000) % 10 + '0');
        print_char((minutesD / 100) % 10 + '0');
        print_char((minutesD / 10) % 10 + '0');
        print_char(minutesD % 10 + '0');
        print_char(' ');
        print_char(dir);
		tempo_N_ms(1000);

        // Wait for 3 seconds
        tempo_N_ms(30);
} 
   }