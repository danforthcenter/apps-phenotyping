#!/usr/bin/env python3

############################################################
# Usage: python camerastand.py <NAME>
# Takes a picture with attached camera and saves to Raspberry
# Pi and a remote host
############################################################

import sys
from datetime import datetime 	
import serial	
import subprocess as sp

#-----------------------------------------------
# function to take a picture with a Nikon Coolpix L830.
# This function requires the computer to have gphoto2
# installed and uses the module subprocess to write to 
# the command line to take pictures 
# usage: takePic("picture_name")

def takePic(name):
	# get the filepath of the picture
	date=datetime.now().strftime('%Y-%m-%d_%H:%M:%S')
	picName = str(name)+"_"+ str(date)
	# modify picPath to a existing directory to store acquired images
	picPath = "/home/pi/Desktop/local-folder/" + picName

	# use gphoto2 --capture-image-and-download --filename picPath
	# to take the picture and download it with the given name
	sp.call(["gphoto2","--capture-image-and-download","--filename",picPath])
	print ("Image saved: " + picPath)
	
	sp.call(["rsync","-uhrtP",picPath, "user@remote-host:remote-directory"])
	# Stand user's username, remote server name, and the remote directory to store images
	# Make sure that SSH keygen protocol has been followed so that the 
	# Raspberry pi can access the remote host and remote directory
	# images in that server (e.g. jdoe@serverx:/home/jdoe/camerastand_images).

#------------------------------------------------
# function that contains the main part of the code that will be run.
# usage: main() 

def main():
	# use gphoto2 --auto-detect to check camera is still attached
	sp.call(["gphoto2","--auto-detect"])
	
	print(" ")
	print("taking picture")
	
	picname = sys.argv[1]
	name = picname + ".jpg"
	
	# use the takePic function to take a picture at the starting position
	takePic(name)


# Only run this part of the script if it is called directly
# and not used as a module
if __name__ == "__main__":


	# run the main part of the script using the serial
	# port specified above
	main()

