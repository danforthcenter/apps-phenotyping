ssh pi@sideview1 "cd ~/Desktop/ && bash syncScript"
ssh pi@topviewpi "cd ~/Desktop/ && bash syncScript"
ssh pi@sideview2 "cd ~/Desktop/ && bash syncScript"

bash syncScript
