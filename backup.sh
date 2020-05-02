#!/bin/sh

bw login $1 $2

echo $2 | bw export $2  --output /backups/ --format json
