#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Drag one or more video files onto this script."
    read -p "Press Enter to continue..."
    exit 1
fi

for file in "$@"; do
    echo "Processing: $file"

    ffmpeg -stats -i "$file" \
        -c:v libx265 -preset slow -crf 24 \
        -c:a copy \
        "${file%.*} - Compressed H265 CRF24 slow.mkv"
done

echo
echo "Done!"
read -p "Press Enter to continue..."