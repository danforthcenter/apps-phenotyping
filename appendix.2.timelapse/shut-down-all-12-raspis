#!/usr/bin/env sh

# Helper script for shutting down twelve RasPis

# Copyright (c) 2017 Donald Danforth Plant Science Center -- see LICENSE-MIT
# mail to j.s.hoyer at wustl dot edu
# Revised 2016-12-22.

# (Simply removing power from the RasPis works too,
#  but that can potentially damage them.)

# Original version did not work quickly,
# because no timeout period was specified;
# there was a long lag after each RasPi shut down
# before the SSH connection ends.

MSG_KILLED_GOOD="A 'Killed by signal 15' message
indicates that shutdown probably succeeded."

# A five second timeout is not all that long;
# RasPis with a flaky network connection will be missed.
# At some point it becomes easier
# to run the commands below individually.
# Do not specify any timeout
# if it becomes clear that establishing the initial SSH connection
# is the limiting factor.

echo "Shutting down all twelve RasPis.
$MSG_KILLED_GOOD
"

echo "RasPi in position 1"
timeout 5 ssh pi@ch129-pos01 'sudo shutdown -h now'
echo "RasPi in position 2"
timeout 5 ssh pi@ch129-pos02 'sudo shutdown -h now'
echo "RasPi in position 3"
timeout 5 ssh pi@ch129-pos03 'sudo shutdown -h now'
echo "RasPi in position 4"
timeout 5 ssh pi@ch129-pos04 'sudo shutdown -h now'
echo "RasPi in position 5"
timeout 5 ssh pi@ch129-pos05 'sudo shutdown -h now'
echo "RasPi in position 6"
timeout 5 ssh pi@ch129-pos06 'sudo shutdown -h now'
echo "RasPi in position 7"
timeout 5 ssh pi@ch129-pos07 'sudo shutdown -h now'
echo "RasPi in position 8"
timeout 5 ssh pi@ch129-pos08 'sudo shutdown -h now'
echo "RasPi in position 9"
timeout 5 ssh pi@ch129-pos09 'sudo shutdown -h now'
echo "RasPi in position 10"
timeout 5 ssh pi@ch129-pos10 'sudo shutdown -h now'
echo "RasPi in position 11"
timeout 5 ssh pi@ch129-pos11 'sudo shutdown -h now'
echo "RasPi in position 12"
timeout 5 ssh pi@ch129-pos12 'sudo shutdown -h now'
