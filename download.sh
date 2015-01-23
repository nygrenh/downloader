#!/bin/bash
#
# Copyright © 2015 Henrik Nygren.
# This program is free software. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.
#
# A simple downloader that takes links and file names from links.txt.

# Options for random wait
maxWait=30
minWait=0

wait_random_time() {
  wait=$(( (RANDOM % maxWait) + minWait + 1 ))s
  echo "Waiting for" $wait
  sleep $wait
}

urls=$(cat links.txt)

for line in $urls; do
  fileName=$(echo "$line" | cut -d',' -f 2)
  url=$(echo "$line" | cut -d',' -f 1)
  wget -c "$url" -O "$fileName"

  wait_random_time
done
