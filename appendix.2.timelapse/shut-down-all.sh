#!/usr/bin/env sh

# Helper script for shutting down twelve RasPis
# Copyright (c) 2017 Donald Danforth Plant Science Center -- see LICENSE
# mail to j.s.hoyer at wustl dot edu

# This script is prepared for time-lapse imaging with 12 Raspberry Pis.
# To use less than 12 Raspberry Pis, comment or delete the lines for the excess Raspberry Pis.
# To use more than 12 Raspberry Pis, copy and paste the script section for each Raspberry Pi,
# (e.g. lines 24 and 25) and edit the Raspberry Pi position number and hostname.

MSG_KILLED_GOOD="A 'Killed by signal 15' message
indicates that shutdown probably succeeded."

# Raspberry Pis with an unstable network connection may not shut down.
# Alternatively, run the commands below individually.
# Do not specify any timeout if establishing the initial SSH connection
# is the limiting factor (e.g. due to unstable network connection).

echo "Shutting down all twelve RasPis.
$MSG_KILLED_GOOD
"

echo "RasPi in position 1"
timeout 5 ssh pi@timepi01 'sudo shutdown -h now'
echo "RasPi in position 2"
timeout 5 ssh pi@timepi02 'sudo shutdown -h now'
echo "RasPi in position 3"
timeout 5 ssh pi@timepi03 'sudo shutdown -h now'
echo "RasPi in position 4"
timeout 5 ssh pi@timepi04 'sudo shutdown -h now'
echo "RasPi in position 5"
timeout 5 ssh pi@timepi05 'sudo shutdown -h now'
echo "RasPi in position 6"
timeout 5 ssh pi@timepi06 'sudo shutdown -h now'
echo "RasPi in position 7"
timeout 5 ssh pi@timepi07 'sudo shutdown -h now'
echo "RasPi in position 8"
timeout 5 ssh pi@timepi08 'sudo shutdown -h now'
echo "RasPi in position 9"
timeout 5 ssh pi@timepi09 'sudo shutdown -h now'
echo "RasPi in position 10"
timeout 5 ssh pi@timepi10 'sudo shutdown -h now'
echo "RasPi in position 11"
timeout 5 ssh pi@timepi11 'sudo shutdown -h now'
echo "RasPi in position 12"
timeout 5 ssh pi@timepi12 'sudo shutdown -h now'
