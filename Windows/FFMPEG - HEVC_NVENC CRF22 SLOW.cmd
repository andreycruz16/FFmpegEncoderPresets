@echo on
for %%F in (*.mp4 *.mov *.mkv *.avi *.m4v *.webm) do if exist "%%F" (
    ffmpeg -n -i "%%F" ^
        -c:v hevc_nvenc -preset slow -crf 22 ^
        -c:a copy "%%~nF - HEVC_NVENC CRF22 SLOW.mkv"
)
