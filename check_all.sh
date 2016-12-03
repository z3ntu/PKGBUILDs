#!/bin/bash

find . -maxdepth 1 -type d -not -path "./.git" -not -path "." -exec ./check_if_git_clean.sh "{}" \;
