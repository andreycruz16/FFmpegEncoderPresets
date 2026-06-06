#!/bin/bash

shopt -s nullglob nocaseglob

for f in *.mp4 *.mov *.mkv *.avi *.m4v *.webm; do

    ffmpeg -n -i "$f" \
        -c:v libx265 \
        -preset slow \
        -crf 22 \
        -c:a copy \
        "${f%.*} - HEVC CRF22 SLOW.mkv"
done

read -p "Press Enter to exit..."
