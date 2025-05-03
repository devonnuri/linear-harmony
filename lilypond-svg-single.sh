#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 path/to/file.ly"
    exit 1
fi

lyfile="$1"

if [ ! -f "$lyfile" ]; then
    echo "File not found: $lyfile"
    exit 1
fi

# Remove existing SVGs related to this file
basename="${lyfile%.*}"
rm -f "${basename}"*.svg

echo "[*] ly to svg"

lilypond -dno-point-and-click -fsvg -o "$basename" "$lyfile"

echo "[*] crop svg"

for svg in "${basename}"*.svg; do
    inkscape --actions "select-all;fit-canvas-to-selection" --export-overwrite "$svg"
done

echo "[*] copy svg into ./figures/"

mkdir -p ./figures
for svg in "${basename}"*.svg; do
    cp "$svg" ./figures/
done

echo "[*] done"