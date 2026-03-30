@echo off
cd /d "%~dp0.."
if not exist "venv" (
    echo ERROR: Virtual environment venv not found. Please run setup.bat first.
    pause
    exit /b 1
)
echo ========================================
echo   Starting stock analysis...
echo ========================================
echo.
call venv\Scripts\activate.bat
python main.py
echo.
echo Analysis finished.
pause
