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
    -c:v hevc_nvenc -preset fast -crf 24 ^
    -c:a copy "%~dpn1 - HEVC_NVENC CRF24 FAST.mkv"
exit /b
