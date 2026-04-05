@echo off
chcp 65001 >nul
cls

echo ========================================
echo   Push to GitHub
echo ========================================
echo.

REM Change to script directory
cd /d "%~dp0"

echo Step 1: Configure Git user...
git config user.name "2025sunhua-sketch"
git config user.email "2025sunhua@gmail.com"
if %errorlevel% neq 0 (
    echo ERROR: Failed to configure Git user
    echo Please check if Git is installed
    pause
    exit /b 1
)
echo OK: Git user configured
echo.

echo Step 2: Check remote repository...
git remote -v
if %errorlevel% neq 0 (
    echo Adding remote repository...
    git remote add origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
) else (
    echo Remote already exists, updating URL...
    git remote set-url origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
)
echo OK: Remote configured
echo.

echo Step 3: Stage all files...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to stage files
    pause
    exit /b 1
)
echo OK: Files staged
echo.

echo Step 4: Create commit...
git commit -m "Initial commit: AI Prompt Library"
if %errorlevel% neq 0 (
    echo NOTE: No changes to commit or commit failed
    echo This is OK if nothing changed
)
echo.

echo Step 5: Push to GitHub...
echo Connecting to GitHub...
git push -u origin main
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCCESS! Push completed!
    echo ========================================
    echo.
    echo Website: https://2025sunhua-sketch.github.io/ai-prompt-library1/
) else (
    echo.
    echo ========================================
    echo   Push failed! Error details above
    echo ========================================
    echo.
    echo Common issues:
    echo 1. SSH key not set up - run: ssh-keygen -t ed25519
    echo 2. Clash Verge blocking - disable TUN mode
    echo 3. First time connecting - type 'yes' when asked
    echo.
)

echo Press any key to exit...
pause >nul
