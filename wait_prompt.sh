#!/bin/bash
while [ true ] ; do

PROMPT=$(tmux capture-pane -p | grep -v ^$| tail -1)
echo "->${PROMPT}<-"
if [ "$PROMPT" == "$1" ]; then
    exit
fi
sleep 1
done

