rsync --remove-source-files -utr /home/pi/Desktop/local-folder user@remote-host:remote-directory
# Local directory must be the same as line 37 in piPicture.py
# Remote directory should be modified to reflect the Raspberry Pi  
# Multi-Image Octagon user's username, remote server name, and the directory to store images
# in that server (e.g. jdoe@serverx:/home/jdoe/octagon_images).

echo '<hostname> synced'
#modify <hostname> to the respective Raspberry Pi hostname (e.g. octagon)