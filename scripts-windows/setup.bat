@echo off
cd /d "%~dp0.."
echo ========================================
echo   Stock Analysis System - Setup
echo ========================================
echo.

if not exist "venv" (
    echo [1/5] Creating virtual environment venv...
    python -m venv venv
    if errorlevel 1 (
        echo ERROR: Failed to create virtual environment. Please check Python installation.
        pause
        exit /b 1
    )
    echo Virtual environment created.
    echo.
) else (
    echo [1/5] Virtual environment venv already exists, skipping.
    echo.
)

echo [2/5] Activating virtual environment...
call venv\Scripts\activate.bat
echo Virtual environment activated.
echo.

echo [3/5] Installing dependencies...
set PYTHONUTF8=1
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn
if errorlevel 1 (
    echo WARNING: Some errors occurred during dependency installation.
)
echo Dependencies installed.
echo.

if not exist ".env" (
    echo [4/5] Creating .env config file...
    copy .env.example .env
    echo .env file created. Please edit it as needed.
    echo.
) else (
    echo [4/5] .env file already exists, skipping.
    echo.
)

echo [5/5] Setup complete!
echo.
echo ========================================
echo   Next steps:
echo   - Run analysis: double-click run.bat
echo   - Start Web server: double-click serve.bat
echo   - Configure OpenAI: double-click set-openai.bat
echo ========================================
echo.
pause
