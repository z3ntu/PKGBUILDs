#!/bin/bash

if [ -z "$1" ]; then
    echo "Please supply the folder to check as an argument."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Supplied folder is invalid!"
    exit 1
fi

output=$(git -C $1 status)

clean=$(echo "$output" | grep "nothing to commit, working tree clean")
if [ "$clean" == "" ]; then
    echo "ALERT! Folder $1 not clean!"
fi
