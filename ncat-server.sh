#!/usr/bin/env bash

help() {
    echo "Usage:"
    echo
    echo "To run a server with the default parameters:"
    echo
    echo "   $0"
    echo
    echo "Use the following environment variable to change the connection parameters:"
    echo
    echo "'CHAT_PORT': TCP port (default: 12345)"
    echo
    echo "Example:"
    echo
    echo "   CHAT_PORT=9999 $0"
    echo
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  help
  exit 1
fi

CHAT_PORT="${CHAT_PORT:-12345}"
echo "Running the server on port $CHAT_PORT"
ncat --ssl --broker --listen -p $CHAT_PORT
