@echo off
for %%f in (*.MP4) do ffmpeg -n -i "%%f" -c:v libx265 -preset medium -crf 24 -c:a copy "%%~nf - Compressed H.265 CQ24 FAST.mkv"
pause
