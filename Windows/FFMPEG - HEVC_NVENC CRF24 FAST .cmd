@echo on
for %%F in (*.mp4 *.mov *.mkv *.avi *.m4v *.webm) do if exist "%%F" (
    ffmpeg -n -i "%%F" ^
        -c:v hevc_nvenc -preset fast -crf 24 ^
        -c:a copy "%%~nF - HEVC_NVENC CRF24 FAST.mkv"
)
