#!/bin/sh

dfuport=$(ls -rt /dev/tty.usb* | tail -n1)
echo "Device tty: $dfuport"

if [ -z "$dfuport" ]; then
    echo "Bootloader not detected"
else
    avrdude -p atmega32u4 -P $dfuport -c avr109 -U flash:w:preonix_default.hex
fi
