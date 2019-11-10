#!/bin/bash

shopt -s dotglob 
echo "updating files"

# Copy config files on the system into the repo
for file in mappings/*; do
    filename="$(basename $file)"
    cp -L $file ./$filename
done

shopt -u dotglob 
