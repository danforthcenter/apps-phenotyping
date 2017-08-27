#!/usr/bin/env sh

# Rsync each crontab to the relevant RasPi, then install.
# Copyright (c) 2017 Donald Danforth Plant Science Center -- see LICENSE-MIT
# mail to j.s.hoyer at wustl dot edu

echo "Copying and installing a new cron table on each RasPi."

###########################

echo "RasPi in position 1"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi01:/home/pi/
ssh pi@timepi01 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi01:/home/pi/
#ssh pi@timepi01 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 2"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi02:/home/pi/
ssh pi@timepi02 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi02:/home/pi/
#ssh pi@timepi02 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 3"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi03:/home/pi/
ssh pi@timepi03 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi03:/home/pi/
#ssh pi@timepi03 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 4"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi04:/home/pi/
ssh pi@timepi04 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi04:/home/pi/
#ssh pi@timepi04 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 5"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi05:/home/pi/
ssh pi@timepi05 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi05:/home/pi/
#ssh pi@timepi05 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 6"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi06:/home/pi/
ssh pi@timepi06 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi06:/home/pi/
#ssh pi@timepi06 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 7"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi07:/home/pi/
ssh pi@timepi07 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi07:/home/pi/
#ssh pi@timepi07 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 8"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi08:/home/pi/
ssh pi@timepi08 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi08:/home/pi/
#ssh pi@timepi08 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 9"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi09:/home/pi/
ssh pi@timepi09 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi09:/home/pi/
#ssh pi@timepi09 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 10"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi10:/home/pi/
ssh pi@timepi10 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi10:/home/pi/
#ssh pi@timepi10 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 11"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi11:/home/pi/
ssh pi@timepi11 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi11:/home/pi/
#ssh pi@timepi11 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################

echo "RasPi in position 12"
rsync -rtu -e ssh photograph-all-5min.crontab pi@timepi12:/home/pi/
ssh pi@timepi12 'crontab /home/pi/photograph-all-5min.crontab'

# If camera orientation needs to be flipped comment the above command and uncomment the command below
#rsync -rtu -e ssh photograph-all-5min-vhflipped.crontab pi@timepi12:/home/pi/
#ssh pi@timepi12 'crontab /home/pi/photograph-all-5min-vhflipped.crontab'

###########################