#!/bin/bash

shopt -s nullglob nocaseglob

for f in *.mp4 *.mov *.mkv *.avi *.m4v *.webm; do

    ffmpeg -n -i "$f" \
        -c:v libx265 \
        -preset medium \
        -crf 24 \
        -c:a copy \
        "${f%.*} - HEVC CRF24 MEDIUM.mkv"
done

read -p "Press Enter to exit..."
