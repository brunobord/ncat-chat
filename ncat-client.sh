#!/usr/bin/env bash

help() {
    echo "Usage:"
    echo
    echo "To run a client with the default parameters:"
    echo
    echo "   $0"
    echo
    echo "Use the following environment variables to change the connection parameters:"
    echo
    echo "* 'CHAT_HOST': Hostname or IP address of the server (default: localhost)"
    echo "* 'CHAT_PORT': TCP port (default: 12345)"
    echo "* 'CHAT_USER': Your username (default: the result of the 'whoami' command)"
    echo "* 'CHAT_COLOR': Your message color (default: no-color)"
    echo "                Available colors: red, green, yellow, blue, magenta, cyan, white."
    echo
    echo "Example:"
    echo
    echo "   CHAT_COLOR=blue CHAT_HOST=alice-laptop CHAT_PORT=9999 CHAT_USER=Bob $0"
    echo
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  help
  exit 1
fi

CHAT_HOST="${CHAT_HOST:-localhost}"
CHAT_PORT="${CHAT_PORT:-12345}"
CHAT_USER="${CHAT_USER:-`whoami`}"
USER_HOST=`hostname -s`

# Colors
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"
off="$(tput sgr0)"

CHAT_COLOR=${CHAT_COLOR:-off}

echo "Connecting to ${CHAT_HOST}:${CHAT_PORT} as '${CHAT_USER}'"

while read line ; do
    printf "${!CHAT_COLOR}${CHAT_USER}@${USER_HOST}:${off} ${line}\n"
done | ncat --ssl $CHAT_HOST $CHAT_PORT | awk '{ print strftime("[%Y-%m-%d %H:%M:%S] ") $0 }';
