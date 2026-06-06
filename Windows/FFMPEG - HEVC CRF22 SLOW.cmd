@echo on
for %%F in (*.MP4) do (
    ffmpeg -n -i "%%F" ^
        -c:v libx265 -preset slow -crf 22 ^
        -c:a copy "%%~nF - HEVC CRF22 SLOW.mkv"
)
