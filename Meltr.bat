@echo off
setlocal EnableDelayedExpansion

rem Set duration of the melting effect in seconds
set "duration=20"

rem Start time
set "start=!time!"

rem Loop for the duration of the melting effect
:loop
rem Get current time
set "current=!time!"

rem Calculate elapsed time in seconds
set /a "elapsed=((1%current:~0,2%-100)*3600 + (1%current:~3,2%-100)*60 + (1%current:~6,2%-100)) - ((1%start:~0,2%-100)*3600 + (1%start:~3,2%-100)*60 + (1%start:~6,2%-100))"

rem If elapsed time exceeds duration, exit the loop
if !elapsed! gtr %duration% goto end

rem Clear the screen
cls

rem Display melting effect
for /L %%Y in (1,1,25) do (
    for /L %%X in (1,1,80) do (
        rem Generate random color
        set /a "color=!random!%%16"
        rem Display character with random color
        <nul set /p "=^x1b[48;5;!color!m "
    )
    echo.
)

rem Delay for smooth animation (adjust as needed)
ping -n 1 127.0.0.1 >nul

rem Go back to the loop
goto loop

:end
rem Restart the PC
shutdown /r /t 0
