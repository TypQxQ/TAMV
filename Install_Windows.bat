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
    if not exist ".\resources\requirements.txt" (
        echo requrements file does not exist. Have you downloaded the repository correctly?
    ) else (
        echo Creating virtual environment...
        python -m venv .venv
        echo Virtual environment created.
        echo Installing requirements...
        .venv\Scripts\pip install -v -r .\resources\requirements.txt
        echo Requirements installed.
    )
)
