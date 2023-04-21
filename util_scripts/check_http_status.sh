#!/bin/sh

LIVE_MESSAGE="we are live!!"
DOWN_MESSAGE="site is down"

while true
do
  status=`curl $1 -is | head -n1 | awk '{ print $2 }'`

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

