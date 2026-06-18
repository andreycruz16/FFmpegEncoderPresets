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
    -c:v libsvtav1 ^
    -preset 3 ^
    -crf 35 ^
    -c:a copy ^
    "%~dpn1 - AV1 CRF35 SLOW.mkv"
exit /b
