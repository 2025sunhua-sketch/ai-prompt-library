@echo off
echo ========================================
echo   Fixing Git Remote URL
echo ========================================
echo.
echo Current remote:
git remote -v
echo.
echo Updating to correct SSH URL...
git remote set-url origin git@github.com:2025sunhua-sketch/ai-prompt-library1.git
echo.
echo New remote configuration:
git remote -v
echo.
echo ========================================
echo Success! Remote URL updated.
echo ========================================
echo.
pause
