# apps-phenotyping
The following are scripts necessary to run a Raspberry Pi camera stand.
Please refer to Appendix 3 of DOI: XXXX for detailed instructions about setting up a
Raspberry Pi camera stand.   

If you use the instruction or scripts, please cite:
XXXXXX  

Lines of camerastand.py alter:
1. Change line 26 to the path of the folder that you want the images to be stored on the Raspberry Pi.
2. Change line 33 to the remote host and remote directory (make sure that Raspberry Pi has passwordless
SSH access, follow Appendix 1 in DOI:).

To run the camerastand.py script:
1. Trigger the camera stand script by typing: python camerastand.py
2. The script will then prompt an image name to be entered (e.g. speciesx_plant1_treatment1_rep1)
the date will be appended to the name.
3. Data transfer will occur via rsync