#!/bin/bash

for dir in */; do
    cd $dir
    if [ "$1" == "error" ]; then
        makepkg -s 2>&1 | grep "ERROR"
    else
        makepkg -s
    fi
    cd ..
done
