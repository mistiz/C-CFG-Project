@echo off
cd /d "%~dp0"

:loop
cls
echo ============================================
echo        C-CFG Interactive Parser
echo ============================================
echo.
echo Paste your code below.
echo When finished, press Ctrl+Z then Enter.
echo.

:: Save pasted code
type con > temp_input.txt

echo.
echo Running parser...
echo.

:: Run parser and capture output
parser.exe < temp_input.txt > temp_output.txt

echo ============================================
echo                RESULT
echo ============================================
type temp_output.txt
echo.

:: Check if valid
findstr /C:"Valid program" temp_output.txt >nul
if %errorlevel%==0 (
    echo Detected: VALID program
    (
        echo Original code:
        type temp_input.txt
        echo.
        echo Result:
        type temp_output.txt
    ) > tests\valid\last_valid_output.txt
    echo Saved to tests\valid\last_valid_output.txt
) else (
    echo Detected: INVALID program
    (
        echo Original code:
        type temp_input.txt
        echo.
        echo Result:
        type temp_output.txt
    ) > tests\invalid\last_invalid_output.txt
    echo Saved to tests\invalid\last_invalid_output.txt
)

:: Clean up temp files
del temp_input.txt >nul
del temp_output.txt >nul

echo.
echo ============================================
echo        Parsing Complete
echo ============================================
echo.
set /p choice="Press ENTER to run again, or type EXIT to quit: "

if /I "%choice%"=="exit" goto end
goto loop

:end
exit

