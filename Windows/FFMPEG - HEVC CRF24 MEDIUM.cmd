@echo on

if "%~1"=="" (
    for %%F in (*.mp4 *.mov *.mkv *.avi *.m4v *.webm) do if exist "%%F" call :convert "%%~fF"
) else (
    for %%F in (%*) do if exist "%%~fF" call :convert "%%~fF"
)

pause
exit /b

:convert
ffmpeg -n -i "%~1" ^
    -c:v libx265 -preset medium -crf 24 ^
    -c:a copy "%~dpn1 - HEVC CRF24 MEDIUM.mkv"
exit /b
