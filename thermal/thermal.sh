#!/bin/bash

# Usage: thermal.sh arg
# arg is:
# * discovery - for discovery
# * discovered_ID - for get value

# Usage
if [[ $# -eq 0 ]]; then
  printf "Usage: thermal.sh arg\narg is:\n* discovery - for discovery\n* discovered_ID - for get value\n"
  exit 0
fi

# Discovery
if [[ $1 == "discovery" ]]; then
  it=0
  printf "{\"data\":[";
#for I in `sensors | grep -in '^Core [0-9]\|^temp[0-9]' | awk -F: '{print $2" string "$1"" $3}' | awk '{print $1"_"$2"_"$3"_"$4}'`; do
for I in `sensors | grep -i '^Core [0-9]\|^temp[0-9]' | awk -F: '{print "Core_"NR}'`; do
#sensors | grep -i '^Core [0-9]\|^temp[0-9]' | awk -F: '{print "Core_"NR}'
    if [ $it == 1 ]; then printf ","; fi
      printf "{\"{#ID}\":\"$I\"}"
      it=1
  done;
  printf "]}";
  exit 0;
fi

# Get data
sensors | grep -i '^Core [0-9]\|^temp[0-9]' | awk -F: '{print "Core_"NR $2}' | grep "$1" | awk '{print $2}' | sed -e 's/\+//g' | sed -e 's/°C//g'
