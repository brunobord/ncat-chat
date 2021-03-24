#!/usr/bin/env bash

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


while read line ; do
   printf "${!CHAT_COLOR}${CHAT_USER}@${USER_HOST}:${off} ${line}\n"
done | nc $CHAT_HOST $CHAT_PORT
