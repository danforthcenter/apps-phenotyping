#!/bin/bash

echo 'Shutting down all connected pi'

ssh pi@sideview1 "sudo shutdown -h now"
echo 'sideview1 shutdown'

ssh pi@sideview2 "sudo shutdown -h now"
echo 'sideview2 shutdown'

ssh pi@topviewpi "sudo shutdown -h now"
echo 'topviewpi shutdown'

