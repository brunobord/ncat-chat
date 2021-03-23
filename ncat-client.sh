#!/usr/bin/env bash

CHAT_HOST="${CHAT_HOST:-localhost}"
CHAT_PORT="${CHAT_PORT:-12345}"
CHAT_USER="${CHAT_USER:-`whoami`}"


while read line ; do
   printf "${CHAT_USER}: ${line}\n"
done | nc $CHAT_HOST $CHAT_PORT
