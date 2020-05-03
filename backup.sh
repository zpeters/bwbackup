#!/bin/sh

if [[ "$1" == "" ]]
then
  echo "Missing EMAIL environment variable"
  exit 1
fi

if [[ "$2" == "" ]]
then
  echo "Missing PASSWORD environment variable"
  exit 1
fi

if [[ "$3" == "" ]]
then
  echo "Missing SLEEP environment variable"
  exit 1
fi

while true
do
  echo ""
  if [[ "$SESSION" == "" ]] 
  then
    echo "Logging in to Bitwarden"
    SESSION=`bw login $1 $2 |grep 'export BW_SESSION'|  awk '{split($0,a,"BW_SESSION"); print a[2]}'| cut -c 3- | rev | cut -c 2-| rev`
  else
    echo "Already logged in"
  fi
  echo ""
  echo "Exporting Bitwarden data to /backups/"
  echo $2 | bw export $2  --output /backups/bitwarden_backup.json --format json
  echo ""
  echo "Sleeping $SLEEP seconds"
  sleep $SLEEP
done
