#!/bin/bash

shopt -s nullglob nocaseglob

for f in *.mp4 *.mov *.mkv *.avi *.m4v *.webm; do
ffmpeg -n -i "$f" \
    -c:v hevc_videotoolbox \
    -q:v 55 \
    -c:a copy \
    "${f%.*} - HEVC HARDWARE CQ55.mkv"
done

read -p "Press Enter to exit..."
