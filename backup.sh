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
  echo "Logging in to Bitwarden"
  bw login $1 $2 > /dev/null 2>&1
  echo ""
  echo "Exporting Bitwarden data to /backups/"
  echo $2 | bw export $2  --output /backups/bitwarden_backup.json --format json
  echo ""
  echo "Logging out of Bitwarden"
  bw logout
  echo ""
  echo "Sleeping $SLEEP seconds"
  sleep $SLEEP
done
