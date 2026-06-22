@echo on

if "%~1"=="" (
    for %%F in (*.wav *.mp3 *.m4a *.aac *.flac *.ogg *.3gp *.mp4) do (
        if exist "%%F" call :convert "%%~fF"
    )
) else (
    for %%F in (%*) do if exist "%%~fF" call :convert "%%~fF"
)

pause
exit /b

:convert
ffmpeg -n -i "%~1" ^
    -c:a libopus ^
    -b:a 96k ^
    -vbr on ^
    -compression_level 10 ^
    -ar 48000 ^
    -ac 2 ^
    "%~dpn1 - OPUS 96K.opus"

exit /b