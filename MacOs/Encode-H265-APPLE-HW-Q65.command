#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Drag one or more video files onto this script."
    read -p "Press Enter to continue..."
    exit 1
fi

for file in "$@"; do
    output="${file%.*} - Compressed H265 APPLE-HW Q65.mkv"

    if [ -f "$output" ]; then
        echo "Skipping (already exists): $output"
        continue
    fi

    echo "Processing: $file"

    ffmpeg -hide_banner -stats -i "$file" \
        -c:v hevc_videotoolbox \
        -q:v 65 \
        -c:a copy \
        "$output"

    if [ $? -ne 0 ]; then
        echo "Failed: $file"
    fi
done

echo
echo "Done!"
read -p "Press Enter to continue..."