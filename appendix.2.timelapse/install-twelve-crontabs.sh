#!/usr/bin/env sh

# Rsync each crontab to the relevant Raspberry Pi, then install.
# Copyright (c) 2017 Donald Danforth Plant Science Center -- see LICENSE-MIT
# mail to j.s.hoyer at wustl dot edu
# This script is prepared for time-lapse imaging with 12 Raspberry Pis.
# To use less than 12 Raspberry Pis, comment or delete the lines for the excess Raspberry Pis.
# To use more than 12 Raspberry Pis, copy and paste the script section for each Raspberry Pi,
# (e.g. lines 13 to 23) and edit the Raspberry Pi position number and hostname.

echo "Copying and installing a new cron table on each Raspberry Pi."

###########################

echo "Raspberry Pi in position 1"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi01:/home/pi/
ssh pi@timepi01test 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 16 and 17 above, and uncomment lines 20 and 21 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi01:/home/pi/
#ssh pi@timepi01 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 2"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi02:/home/pi/
ssh pi@timepi02 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 26 and 27 above, and uncomment lines 30 and 31 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi02:/home/pi/
#ssh pi@timepi02 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 3"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi03:/home/pi/
ssh pi@timepi03 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 36 and 37 above, and uncomment lines 40 and 41 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi03:/home/pi/
#ssh pi@timepi03 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 4"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi04:/home/pi/
ssh pi@timepi04 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 46 and 47 above, and uncomment lines 50 and 51 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi04:/home/pi/
#ssh pi@timepi04 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 5"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi05:/home/pi/
ssh pi@timepi05 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 56 and 57 above, and uncomment lines 60 and 61 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi05:/home/pi/
#ssh pi@timepi05 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 6"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi06:/home/pi/
ssh pi@timepi06 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 66 and 67 above, and uncomment lines 70 and 71 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi06:/home/pi/
#ssh pi@timepi06 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 7"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi07:/home/pi/
ssh pi@timepi07 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 76 and 77 above, and uncomment lines 80 and 81 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi07:/home/pi/
#ssh pi@timepi07 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 8"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi08:/home/pi/
ssh pi@timepi08 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 86 and 87 above, and uncomment lines 90 and 91 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi08:/home/pi/
#ssh pi@timepi08 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 9"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi09:/home/pi/
ssh pi@timepi09 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 96 and 97 above, and uncomment lines 100 and 101 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi09:/home/pi/
#ssh pi@timepi09 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 10"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi10:/home/pi/
ssh pi@timepi10 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 106 and 107 above, and uncomment lines 110 and 111 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi10:/home/pi/
#ssh pi@timepi10 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 11"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi11:/home/pi/
ssh pi@timepi11 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 116 and 117 above, and uncomment lines 120 and 121 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi11:/home/pi/
#ssh pi@timepi11 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "Raspberry Pi in position 12"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi12:/home/pi/
ssh pi@timepi12 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped for this Raspberry Pi, comment lines 126 and 127 above, and uncomment lines 130 and 131 below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi12:/home/pi/
#ssh pi@timepi12 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################