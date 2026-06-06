@echo on
for %%F in (*.MP4) do (
    ffmpeg -n -i "%%F" ^
        -c:v libx265 -preset fast -crf 24 ^
        -c:a copy "%%~nF - HEVC CRF24 FAST.mkv"
)
