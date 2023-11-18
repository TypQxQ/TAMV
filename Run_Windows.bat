@echo off

REM Change directory to the location of the batch file
cd /d "%~dp0"

REM Check if Python 3 is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python 3 is not installed. Install Python 3 and try again.
) else (
    echo Python 3 is installed. Version: %pythonVersion%
    
    REM Check if TAMV.py exists in current directory
    if not exist ".venv\Scripts\python.exe" (
        echo Requirements are not installed. Please run Install_Windows.bat first.
    ) else (
        echo Starting TAMV...
        .venv\Scripts\python TAMV.py
    )
)
