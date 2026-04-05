@echo off
chcp 65001 >nul
cls
echo ========================================
echo   Push to GitHub - AI Prompt Library
echo   AI 者华歌 | https://github.com/2025sunhua-sketch/ai-prompt-library1
echo ========================================
echo.

REM 切换到脚本所在目录
cd /d "%~dp0"

echo Step 1: Checking Git installation...
git --version
if %errorlevel% neq 0 (
    echo [ERROR] Git not found! Please install Git first.
    pause
    exit /b 1
)
echo.

echo Step 2: Initializing Git repository...
if not exist ".git" (
    echo [INFO] .git folder not found, initializing...
    git init
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to initialize Git repository!
        pause
        exit /b 1
    )
    echo [SUCCESS] Git repository initialized!
) else (
    echo [INFO] .git folder already exists.
)
echo.

echo Step 3: Configuring Git user identity...
echo Please enter your GitHub username (or press Enter to use default):
set /p GIT_USER="Username [孙启涵]: "
if "%GIT_USER%"=="" set GIT_USER=孙启涵

echo Please enter your GitHub email:
set /p GIT_EMAIL="Email: "
if "%GIT_EMAIL%"=="" (
    echo [ERROR] Email cannot be empty!
    pause
    exit /b 1
)

git config user.name "%GIT_USER%"
git config user.email "%GIT_EMAIL%"
echo [SUCCESS] Git user configured: %GIT_USER% <%GIT_EMAIL%>
echo.

echo Step 4: Checking remote repository URL...
git remote -v
findstr "origin" nul >nul
if %errorlevel% neq 0 (
    echo [INFO] Remote 'origin' not found, adding...
    git remote add origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
) else (
    echo [INFO] Remote 'origin' exists, updating URL...
    git remote set-url origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
)
echo [SUCCESS] Remote URL set to: git@github.com:2025sunhua-sketch/ai-prompt-library1.git
echo.

echo Step 5: Adding all files to Git...
git add .
echo [SUCCESS] All files staged for commit.
echo.

echo Step 6: Creating initial commit...
git commit -m "Initial commit: AI Prompt Library website by AI 者华歌"
if %errorlevel% neq 0 (
    echo [WARNING] Commit may have failed due to no changes.
)
echo.

echo Step 7: Renaming branch to 'main'...
git branch -M main
echo.

echo Step 8: Pushing to GitHub...
echo [INFO] Connecting to GitHub via SSH...
echo [TIP] If you see 'Permission denied', please configure SSH key first.
echo.
git push -u origin main
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCCESS! Pushed to GitHub!
    echo ========================================
    echo.
    echo Your website is now live at:
    echo https://2025sunhua-sketch.github.io/ai-prompt-library1/
    echo.
    echo Next steps:
    echo 1. Visit the URL above to verify your site
    echo 2. Enable GitHub Pages in repository settings
    echo 3. Share with your audience!
    echo.
) else (
    echo.
    echo ========================================
    echo   Push failed! Common issues:
    echo ========================================
    echo.
    echo 1. SSH Key not configured
    echo    Solution: Add your SSH public key to GitHub
    echo    Check: cat C:\Users\%USERNAME%\.ssh\id_ed25519.pub
    echo.
    echo 2. Proxy software interfering (Clash Verge)
    echo    Solution: Disable TUN mode or add GitHub to DIRECT rules
    echo.
    echo 3. Network connection issue
    echo    Solution: Check internet connection and retry
    echo.
    echo You can retry later with: git push -u origin main
    echo.
)

pause
