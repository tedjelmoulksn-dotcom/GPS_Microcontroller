# PIC GPS Interface

A C firmware project connecting a GPS module to a PIC16F87xA microcontroller and a PICDEM 2 Plus LCD. It covers UART communication, module commands and display integration.

## Architecture

The microcontroller communicates with the GPS module through a serial interface configured at **4800 baud**, with a **4 MHz** clock configuration in the supplied code. The firmware uses module-specific `!GPS` commands; the included NMEA reference explains a related protocol rather than documenting a complete NMEA parser in this implementation.

## Repository guide

| Folder | Contents |
| --- | --- |
| [Codes](Codes/) | Application sources, GPS functions and serial initialization |
| [documentation](documentation/) | Project reports and presentation |
| [docs](docs/) | Component datasheets, protocol references and original notes |
| [firmware](firmware/) | Historical HEX outputs |
| [archive](archive/) | Original MPLAB project material |
| [assets](assets/) | Hardware photographs |

## Working with the firmware

Use the original MPLAB project and HI-TECH C toolchain as the starting point. Check the selected PIC, oscillator settings, serial wiring and LCD driver against your board before building or programming it. The reports describe the hardware connections and command sequence.

The HEX files are archived outputs, not a newly verified release. Hardware execution has not been repeated during repository organization.
