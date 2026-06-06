@echo on

for %%F in (*.mp4 *.mov *.mkv *.avi *.m4v *.webm) do if exist "%%F" (
    ffmpeg -n -i "%%F" ^
        -c:v libsvtav1 ^
        -preset 6 ^
        -crf 30 ^
        -c:a copy ^
        "%%~nF - AV1 CRF30 MEDIUM.mkv"
)

pause
