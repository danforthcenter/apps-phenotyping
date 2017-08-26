#!/bin/bash

############################################################################
# This is a script that will read in a plant ID (barcode) and get the
# date of when the barcode is entered. Then it will pass this information
# to an ssh command that will run a python script (piPicture.py) on Raspberry
# Pis that will then run piPicture.py.

while true
do
	# command line interface to input the barcode info
	echo "Please scan a barcode or type quit to quit"
	echo " "
	read barcode

	# get the date
	date=`date +%Y%m%d.%s`

	# breaks out of the while loop if quit is typed
	if [ "$barcode" = 'quit' ];
		then
		echo "quiting..."
		break
	fi;

	# waits for user to push a button before continuing
	echo " "
	echo "Scan again or press enter continue..."
	read -s
	echo "continuing..."
	echo " "

	# A password is not needed for ssh into other Raspberry Pis from the
	# master Raspberry Pi, if SSH key was enabled

	# run script to take image for sideview1, sideview2, topviewpi and this pi
	ssh pi@sideview1 "cd ~/Desktop/ && python piPicture.py $date $barcode"
	ssh pi@sideview2 "cd ~/Desktop/ && python piPicture.py $date $barcode"
	ssh pi@topviewpi "cd ~/Desktop/ && python piPicture.py $date $barcode"
	python piPicture.py $date $barcode

	# run syncPi to then run syncScript, in all Raspberry Pis
	bash syncPi

	echo " "
done
