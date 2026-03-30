@echo off
cd /d "%~dp0.."
if not exist "venv" (
    echo ERROR: Virtual environment venv not found. Please run setup.bat first.
    pause
    exit /b 1
)
echo ========================================
echo   Virtual environment activated
echo ========================================
echo.
call venv\Scripts\activate.bat
cmd /k
