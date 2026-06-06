@echo on

for %%F in (*.MP4) do (
    ffmpeg -n -i "%%F" ^
        -c:v libsvtav1 ^
        -preset 6 ^
        -crf 30 ^
        -c:a copy ^
        "%%~nF - AV1 CRF30 MEDIUM.mkv"
)

pause
