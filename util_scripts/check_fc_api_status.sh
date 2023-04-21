#!/bin/sh

LIVE_MESSAGE="Flowcode API is live"
DOWN_MESSAGE="Flowcode API is down. Checking again in 2 minutes"

while true
do
  status=`curl https://api.stg.flowcode.com/livez -is | head -n1 | awk '{ print $2 }'`

  echo "Status code: $status"
  if [ "$status" == "200" ] 
  then
    echo $LIVE_MESSAGE
    # say command is only available on mac
    say $LIVE_MESSAGE
    echo "Exiting..."
    exit 0
  else
    echo $DOWN_MESSAGE
    say $DOWN_MESSAGE
    sleep 120
  fi
done

