#!/bin/bash

URL="http://localhost/"

while true; do
  # Se guarda el status code del request 
  STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")

    if [ "$STATUS_CODE" -eq 200 ]; then
    echo "$(date): URL is healthy"
  else
    echo "$(date): URL is not healthy"
  fi


  sleep 5
done