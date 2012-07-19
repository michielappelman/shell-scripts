#!/bin/bash
# Needs the 'weather' script.
# Fails on negative values (bug is reported)
# Of course in Amsterdam =)

if [[ -x $(which weather) ]] ; then
	weather -i EHAM -m -q | grep Temp | sed 's/Temperature: //g'
else
	echo "N/A"
    exit 99
fi
exit 0
