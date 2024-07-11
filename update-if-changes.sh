#!/bin/bash

# instalacion de  inotify si no esta instalado
install_inotify_tools() {
  echo "Checking for inotifywait..."

  # chequea el PATH del comando y guarda el estatus en una variable
  COMMAND_PATH=$(command -v inotifywait)
  INOTIFYWAIT_STATUS=$?

  echo "Command path: $COMMAND_PATH"
  echo "Exit status of command -v inotifywait: $INOTIFYWAIT_STATUS"

  if [ $INOTIFYWAIT_STATUS -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install inotify-tools -y
    echo "Ya se instalo inotifywait"
  else
    echo "inotifywait ya esta instalado $COMMAND_PATH."
  fi
}

monitor_with_inotifywait() {
  #path de la carpeta que se va a monitorear
  WATCHED_DIR="./"

  while true; do
    inotifywait -e modify,create,delete -r $WATCHED_DIR
    docker-compose down
    docker-compose up --build -d
  done
}

install_inotify_tools

monitor_with_inotifywait