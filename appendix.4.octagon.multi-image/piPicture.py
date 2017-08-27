#!/usr/bin/env python3

############################################################
# Usage: piScanner.py
# Imports barcode and date from sshScript to create the filename
# for a picture that is taken from a Raspberry Pi camera. 
# This script is used in conjuncture with sshScript.
############################################################
import time
import picamera
import socket


# function to get the parameters (date and barcode) for the
# filename and returns them in a list
# Usage: List = getParam(0612,423423)
def getParam(date,barcode):
	paramList = [date,barcode]
	print("The date is " + str(paramList[0]))
	print("The barcode is " + str(paramList[1]))
	return paramList

# function to get the file name by taking an array
# that contains the parameters and formating it
# usage: name = getFileName(List)
def getFileName(list):
	paramList = list
	# get the hostname of the server/pi
	piName = socket.gethostname()
	picName = piName + "_" + paramList[0] +"_"+ paramList[1] + ".jpg"
	return picName

# function to take the picture and name it
# Usage: takePic("myPicture")
def takePic(name):
	picName = name
	picPath = "/home/pi/Desktop/local-folder/"+picName
	# picPath local directory must be the same as line 1 in syncScript
	# and picPath local-folder must exist in the Raspberry Pi
	# desktop before running this script
	with picamera.PiCamera() as camera:
		camera.resolution = (3280, 2464)
        # Set ISO to the desired value
        camera.iso = 300
        # Wait for the automatic gain control to settle
        sleep(2)
        # Now fix the values
        camera.shutter_speed = camera.exposure_speed
        camera.exposure_mode = 'off'
        g = camera.awb_gains
        camera.awb_mode = 'off'
        camera.awb_gains = g
        camera.capture(filename, quality=100)
		# starts the preview and then wait 1 seconds before
		# taking the picture
		# time.sleep(1)
		camera.capture(picPath)
		print("Picture Taken: " + picName + "\n")

# run this script only if the script is run directly.
if __name__ == "__main__":
	from sys import argv
	# get the necessary arguments that will be passed
	# by the shell script
	List = getParam(argv[1],argv[2])
	filename = getFileName(List)
	takePic(filename)
