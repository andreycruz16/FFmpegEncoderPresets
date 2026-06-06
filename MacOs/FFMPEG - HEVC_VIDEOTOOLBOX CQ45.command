ffmpeg -n -i "$f" \
    -c:v hevc_videotoolbox \
    -q:v 45 \
    -c:a copy \
    "${f%.*} - HEVC HARDWARE CQ45.mkv"
