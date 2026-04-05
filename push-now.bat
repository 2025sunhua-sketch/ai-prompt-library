@echo off
chcp 65001 >nul
cls
echo ========================================
echo   Push to GitHub - AI Prompt Library
echo ========================================
echo.
echo Configuring Git user identity...
git config user.name "孙启涵"
git config user.email "2025sunhua@gmail.com"
echo ✓ Git user configured: 孙启涵 <2025sunhua@gmail.com>
echo.

echo Checking remote repository...
git remote -v | findstr origin
if %errorlevel% neq 0 (
    echo Adding remote repository...
    git remote add origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
) else (
    echo Updating remote URL...
    git remote set-url origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
)
echo ✓ Remote repository: git@github.com:2025sunhua-sketch/ai-prompt-library1.git
echo.

echo Staging all files...
git add .
echo ✓ Files staged
echo.

echo Creating commit...
git commit -m "Initial commit: AI Prompt Library website with optimization tools"
echo ✓ Commit created
echo.

echo Pushing to GitHub...
echo   This may take a few seconds...
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCCESS! Push completed!
    echo ========================================
    echo.
    echo Your website will be available at:
    echo https://2025sunhua-sketch.github.io/ai-prompt-library1/
    echo.
    echo Next steps:
    echo 1. Go to GitHub repository settings
    echo 2. Enable GitHub Pages deployment
    echo 3. Select 'main' branch as source
    echo.
) else (
    echo.
    echo ========================================
    echo   Push failed! Common issues:
    echo ========================================
    echo.
    echo 1. SSH key not configured
    echo    Solution: Generate SSH key and add to GitHub
    echo    Run: ssh-keygen -t ed25519 -C "2025sunhua@gmail.com"
    echo.
    echo 2. Proxy software interfering (Clash Verge)
    echo    Solution: Disable TUN mode or add GitHub to DIRECT rules
    echo.
    echo 3. Wrong branch name
    echo    Try: git push -u origin HEAD:main
    echo.
)

pause
