# apps-phenotyping
The following are scripts necessary to run a Raspberry Pi multi-image octagon.
Please refer to Appendix 4 of DOI: XXXX for detailed instructions about setting up a
Raspberry Pi multi-image octagon.   

If you use the instruction or scripts, please cite:
XXXXXX  

Scripts:
- sshScript.sh
- piPicture.py
- syncPi.sh
- shutdown_all_pi.sh

Lines of code to alter:
1. In line 37 of piPicture.py: change picPath to the folder that will store
images on the Raspberry Pi (e.g. /home/pi/Desktop/octagon).
2. In line 1 of syncScript: change the rsync local directory to the folder 
that will store images on the Raspberry Pi (e.g. /home/pi/Desktop/octagon).
3. In line 1 of syncScript: change the rsync remote host and remote host directory
(e.g. jdoe@serverx:/home/jdoe/octagon_images).
4. In line 7 of syncScript: change the hostname to the hostname of the respective 
Raspberry Pi. 

Run the sshScript script:
1. On a remote computer (laptop) SSH to the octagon Raspberry Pi (must be on the same network)
2. Trigger the sshScript on the Terminal by typing: "bash pi/Desktop/apps-phenotyping/appendix.4.octagon.multi-image/sshScripts.sh"
3. Follow the prompts to collect data.