@echo off
chcp 65001 >nul
cls

echo ========================================
echo   Push to GitHub - Debug Version
echo ========================================
echo.
echo Current directory: %CD%
echo.

REM 切换到脚本所在目录
cd /d "%~dp0"
echo Switched to script directory: %CD%
echo.

echo Step 1: Checking Git status...
git status
if errorlevel 1 (
    echo [ERROR] Git command failed! Is Git installed?
    echo Press any key to exit...
    pause
    exit /b 1
)
echo.

echo Step 2: Configuring Git user...
git config user.name "孙启涵"
git config user.email "2025sunhua@gmail.com"
echo ✓ Git user configured
echo.

echo Step 3: Checking remote repository...
git remote -v
if errorlevel 1 (
    echo [INFO] No remote configured, adding now...
    git remote add origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
) else (
    echo [INFO] Updating remote URL...
    git remote set-url origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
)
echo ✓ Remote: git@github.com:2025sunhua-sketch/ai-prompt-library1.git
echo.

echo Step 4: Staging files...
git add -A
echo ✓ Files staged
echo.

echo Step 5: Creating commit...
git commit -m "Deploy to GitHub Pages"
echo.

echo Step 6: Pushing to GitHub...
echo This may take a moment...
git push -u origin main

if errorlevel 1 (
    echo.
    echo ========================================
    echo   PUSH FAILED!
    echo ========================================
    echo.
    echo Error code: %errorlevel%
    echo.
    echo Common solutions:
    echo 1. SSH Key: Run 'ssh-keygen -t ed25519 -C \"2025sunhua@gmail.com\"'
    echo 2. Proxy: Disable Clash Verge TUN mode
    echo 3. First time? Type 'yes' when asked about host authenticity
    echo.
) else (
    echo.
    echo ========================================
    echo   SUCCESS! 
    echo ========================================
    echo Website: https://2025sunhua-sketch.github.io/ai-prompt-library1/
    echo.
)

echo.
echo Script completed. Press any key to exit...
pause
