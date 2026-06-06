#!/bin/bash

for f in *.MP4; do
    [ -e "$f" ] || continue

    ffmpeg -n -i "$f" \
        -c:v libx265 \
        -preset fast \
        -crf 24 \
        -c:a copy \
        "${f%.*} - HEVC CRF24 FAST.mkv"
done

read -p "Press Enter to exit..."
