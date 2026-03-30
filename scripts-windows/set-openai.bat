@echo off
cd /d "%~dp0.."
setlocal enabledelayedexpansion

echo ========================================
echo   Configure OpenAI API
echo ========================================
echo.

if not exist ".env" (
    echo ERROR: .env file not found. Please run setup.bat first.
    pause
    exit /b 1
)

set "BASE_URL="
set "API_KEY="
set "MODEL="

set /p "BASE_URL=Enter OPENAI_BASE_URL (e.g. https://api.deepseek.com/v1): "
set /p "API_KEY=Enter OPENAI_API_KEY: "
set /p "MODEL=Enter OPENAI_MODEL (optional, e.g. deepseek-chat, press Enter to skip): "

echo.
echo Updating .env file...

if exist ".env.tmp" del ".env.tmp"

for /f "usebackq tokens=1* delims==" %%a in (".env") do (
    set "key=%%a"
    set "value=%%b"
    
    if "!key!"=="OPENAI_API_KEY" (
        if not "!API_KEY!"=="" (
            echo OPENAI_API_KEY=!API_KEY!>> ".env.tmp"
        ) else (
            echo !key!=!value!>> ".env.tmp"
        )
    ) else if "!key!"=="OPENAI_BASE_URL" (
        if not "!BASE_URL!"=="" (
            echo OPENAI_BASE_URL=!BASE_URL!>> ".env.tmp"
        ) else (
            echo !key!=!value!>> ".env.tmp"
        )
    ) else if "!key!"=="OPENAI_MODEL" (
        if not "!MODEL!"=="" (
            echo OPENAI_MODEL=!MODEL!>> ".env.tmp"
        ) else (
            echo !key!=!value!>> ".env.tmp"
        )
    ) else (
        if "!key!"=="" (
            echo.>> ".env.tmp"
        ) else (
            echo !key!=!value!>> ".env.tmp"
        )
    )
)

if exist ".env.tmp" (
    copy /y ".env.tmp" ".env" >nul
    del ".env.tmp"
    echo.
    echo ========================================
    echo   Configuration updated successfully!
    echo ========================================
    if not "!BASE_URL!"=="" echo OPENAI_BASE_URL: !BASE_URL!
    if not "!API_KEY!"=="" echo OPENAI_API_KEY: has been set
    if not "!MODEL!"=="" echo OPENAI_MODEL: !MODEL!
) else (
    echo ERROR: Failed to update .env file.
)

echo.
pause
