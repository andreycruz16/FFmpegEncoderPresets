@echo off
setlocal

if "%~1"=="" (
    echo Drag one or more video files onto this batch file.
    pause
    exit /b
)

for %%F in (%*) do (
    echo Processing: %%~fF

    ffmpeg -stats -i "%%~fF" ^
        -c:v libx265 -preset slow -crf 24 ^
        -c:a copy ^
        "%%~dpnF - Compressed H265 CRF24 SLOW.mkv"
)

echo.
echo Done!
pause