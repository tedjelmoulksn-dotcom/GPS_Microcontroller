# GPS_Microcontroller

Compact PIC microcontroller project that reads data from a GPS module and displays date, time, latitude, longitude, satellite count and altitude on an LCD. Targeted for PIC16-series demo boards (example: PICDEM 2 PLUS) using the HI‑TECH / Microchip C toolchain. Useful for hobbyists and embedded engineers building simple GPS display devices.

## Features
- Serial interface to a GPS module (smart/raw mode control).
- Requests and parses time, date, latitude, longitude, satellite count and altitude.
- Displays results on an attached LCD.
- Minimal example code for PIC16 microcontrollers with example wiring and mode control.

## Repository layout
All source code is in the `Codes/` directory:

- `Codes/GPS _main.c` — main application loop: initializes LCD, sets GPS smart mode, periodically requests data and writes to the LCD.
- `Codes/Functions_gps.c` — GPS serial helper functions: UART init, send string/char, receive char, request parsing for each GPS field.
- `Codes/Functions_gps.h` — declarations and shared globals / constants used by the GPS code (baud/divisor/commands).

> Note: The project expects additional headers referenced in the sources: `functions.h`, `lcdbt.h`, `pic.h`, and `pic168xa.h`. These are not present in this repo and must be supplied (board/platform support, LCD driver, helper functions).

## Hardware (recommended)
- PIC16Fxx microcontroller compatible with `pic168xa.h` includes (example: PIC16F877A family). Adjust for your exact device.
- GPS module (UART, 3.3V or 5V level as appropriate for your GPS and PIC board).
- Character LCD (e.g., 16x2) or equivalent display wired to the appropriate port (project uses helper functions in `lcdbt.h`).
- PIC programmer (PICkit 3/4 or ICD3) or bootloader hardware.

### Wiring 
- GPS TX -> PIC RC7 (UART RX)
- GPS RX -> PIC RC6 (UART TX)
- GPS /RAW or mode pins -> PIC RC4 and RC5 (used by `init_gps_mode_smart()` to select Smart mode)
- LCD -> PORTD (the project calls `init_PORTD()` and LCD helpers from `lcdbt.h`)
- Common GND and Vcc; ensure voltage compatibility and level shifting if required.

## Software requirements
- MPLAB X IDE (recommended) or equivalent
- Microchip XC8 (or HI‑TECH PICC if using legacy toolchain) for PIC16 family
- Programmer (PICkit/ICD)

## Configuration bits used in example
The code includes:
```
__CONFIG(HS & WDTDIS & BOREN & LVPDIS);
```
Meaning:
- HS oscillator selected (high-speed crystal)
- Watchdog Timer disabled
- Brown-out Reset enabled (BOREN)
- Low-Voltage Programming disabled (LVPDIS)

Review and set configuration bits appropriate for your device and hardware.

## Build & Flash (short path)
1. Open MPLAB X and create a new project for the target PIC device (matching the header used, e.g., PIC16F877A).
2. Add `Codes/GPS _main.c`, `Codes/Functions_gps.c`, and `Codes/Functions_gps.h` to the project.
3. Add or provide missing header/source files required by the project (`functions.h`, `lcdbt.h`, LCD driver, etc.).
4. Build the project in MPLAB X and program the MCU using your programmer.

(If you use the XC8 command-line tool, create a project/Makefile that compiles the sources and links to generate a hex file; using MPLAB X is the simplest route.)

## How it works (runtime summary)
- The MCU initializes the LCD and serial port (BRGH=1, SPBRG=51 for 4800 baud).
- `init_gps_mode_smart()` toggles RC4/RC5 to select the GPS module smart mode.
- In the main loop the firmware repeatedly:
  - Requests date, time, latitude, longitude, satellite count and altitude using `request_gps(...)`
  - Parses returned bytes from the GPS and writes formatted values to the LCD.
- The GPS protocol used in `request_gps()` starts the request with the string `!GPS` followed by a command byte (GetDate, GetTime, GetLat, GetLong, GetSats, GetAlt).

## Troubleshooting
- If you see no data: check GPS power, baud rate, wiring (TX->RX), and that RC6/RC7 TRIS settings allow UART use.
- If LCD shows garbage: confirm `init_PORTD()` and LCD wiring, contrast and enabling lines.
- If compilation fails: ensure the correct device is selected in the IDE and that missing header/source files are added.

## Contact
@tedjelmoulksn-dotcom
