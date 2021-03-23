#!/usr/bin/env bash

CHAT_PORT="${CHAT_PORT:-12345}"
echo "Running the server on port $CHAT_PORT"
ncat --broker --listen -p $CHAT_PORT
