ffmpeg -n -i "$f" \
    -c:v hevc_videotoolbox \
    -q:v 55 \
    -c:a copy \
    "${f%.*} - HEVC HARDWARE CQ55.mkv"
