#!/bin/bash

SOURCE_DIR="../"
NOTEBOOKS_DIR="notebooks"
SYMLINK_DIR="/home/jovyan/gitRepo"

rm -rf "$NOTEBOOKS_DIR"
mkdir -p "$NOTEBOOKS_DIR"

find "$SOURCE_DIR" -type f -name "*.ipynb" | while read -r file; do
    filename=$(basename "$file")
    file_path=$(echo "$file" | sed 's/\.\.\/\///g')
    ln -s "$SYMLINK_DIR/$file_path" "$NOTEBOOKS_DIR/$filename"
done