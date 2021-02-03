#!/bin/sh

udev_rules_file='/etc/udev/rules.d/50-spi.rules'

printf 'Creating udev rule\n'
echo 'KERNEL=="spidev*", GROUP="spi", MODE="0660"' > $udev_rules_file

# Create SPI group and add mycroft user to it
groupadd spi
usermod -a -G spi mycroft
