#!/bin/bash

# This circumvents the treatement of the directories as git submodules.

find . -maxdepth 2 -name "PKGBUILD" -exec git add "{}" \;
