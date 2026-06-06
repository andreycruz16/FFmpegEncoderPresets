#!/bin/bash

shopt -s nullglob nocaseglob

for f in *.mp4 *.mov *.mkv *.avi *.m4v *.webm; do
ffmpeg -n -i "$f" \
    -c:v av1_videotoolbox \
    -q:v 30 \
    -c:a copy \
    "${f%.*} - AV1 HARDWARE CQ30.mkv"
done

read -p "Press Enter to exit..."
