#!/bin/bash

# set each of the config files known by this repo
shopt -s dotglob 
echo "updating system files"

# Copy config files from the repo to the system 
for file in mappings/*; do
    filename="$(basename $file)"
    cp -a ./$filename $file
done

shopt -u dotglob 
