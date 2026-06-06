ffmpeg -n -i "$f" \
    -c:v hevc_videotoolbox \
    -q:v 65 \
    -c:a copy \
    "${f%.*} - HEVC HARDWARE CQ65.mkv"
