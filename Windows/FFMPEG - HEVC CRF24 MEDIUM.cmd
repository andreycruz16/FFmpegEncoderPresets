@echo on
for %%F in (*.MP4) do (
    ffmpeg -n -i "%%F" ^
        -c:v libx265 -preset medium -crf 24 ^
        -c:a copy "%%~nF - HEVC CRF24 MEDIUM.mkv"
)
