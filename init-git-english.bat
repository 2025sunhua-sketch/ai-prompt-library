@echo off
title Git Setup - AI Prompt Library

echo ========================================
echo   GitHub Pages Setup Script
echo   AI Prompt Library
echo ========================================
echo.
echo Hello! This script will help you:
echo 1. Initialize Git repository
echo 2. Configure user information  
echo 3. Commit all files
echo 4. Setup remote repository (optional)
echo.
echo Press any key to start...
pause >nul
cls

:: Step 1: Check Git
echo ========================================
echo [1/5] Checking Git Installation
echo ========================================
echo.
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git not found!
    echo Please install Git from: https://git-scm.com/downloads
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)
echo [OK] Git is installed
git --version
echo.
echo Press any key to continue...
pause >nul
cls

:: Step 2: Initialize Repository
echo ========================================
echo [2/5] Initializing Git Repository
echo ========================================
echo.
if exist ".git" (
    echo [INFO] Git repository already exists
    set /p reinit="Re-initialize? (y/n, default n): "
    if /i "%reinit%"=="y" (
        git init
        echo [DONE] Re-initialized successfully
    ) else (
        echo [SKIP] Using existing repository
    )
) else (
    git init
    echo [DONE] Git repository initialized
)
echo.
echo Press any key to continue...
pause >nul
cls

:: Step 3: Configure User Info
echo ========================================
echo [3/5] Configuring Git User Information
echo ========================================
echo.
set /p username="Enter your Git username (GitHub account name): "
set /p useremail="Enter your Git email address: "
echo.
git config user.name "%username%"
git config user.email "%useremail%"
echo [DONE] User information configured
echo Username: %username%
echo Email: %useremail%
echo.
echo Press any key to continue...
pause >nul
cls

:: Step 4: Add and Commit Files
echo ========================================
echo [4/5] Adding and Committing Files
echo ========================================
echo.
echo Adding all files...
git add .
echo [DONE] Files added successfully
echo.
echo Committing changes...
git commit -m "Initial commit: AI Prompt Library website"
echo [DONE] Commit successful
echo.
echo Press any key to continue...
pause >nul
cls

:: Step 5: Setup Remote Repository
echo ========================================
echo [5/5] Configuring Remote Repository
echo ========================================
echo.
echo Choose connection method:
echo 1. HTTPS (requires Token each time)
echo 2. SSH (recommended, requires SSH key setup)
echo.
set /p choice="Enter choice (1 or 2, default 1): "
echo.

if "%choice%"=="2" (
    set /p repourl="Enter SSH repository URL (format: git@github.com:username/repo.git): "
) else (
    set /p repourl="Enter HTTPS repository URL (format: https://github.com/username/repo.git): "
)

echo.
git remote add origin %repourl% 2>nul
if %errorlevel% equ 0 (
    echo [DONE] Remote repository configured
) else (
    echo [INFO] Remote repository already exists, skipping
)
echo.
echo Press any key to continue...
pause >nul
cls

:: Push to GitHub
echo ========================================
echo Ready to Push to GitHub
echo ========================================
echo.
git branch -M main
echo Note: First push may require GitHub credentials
echo - HTTPS: Use Personal Access Token (not password)
echo - SSH: Ensure SSH key is configured
echo.
set /p confirm="Push to GitHub now? (y/n, default n): "
echo.

if /i "%confirm%"=="y" (
    echo Pushing...
    git push -u origin main
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo   SUCCESS!
        echo ========================================
        echo.
        echo Next steps:
        echo 1. Visit https://github.com/%username%/ai-prompt-library/settings/pages
        echo 2. Select Branch: "main", Folder: "/ (root)"
        echo 3. Click "Save"
        echo 4. Wait 1-3 minutes for your site to go live
        echo.
        echo Your website URL:
        echo https://%username%.github.io/ai-prompt-library/
        echo.
    ) else (
        echo.
        echo [WARNING] Push failed, please check:
        echo - Repository exists and URL is correct
        echo - Authentication successful
        echo - SSH key configured (if using SSH)
        echo - Proxy software disabled (e.g., Clash)
        echo.
    )
) else (
    echo Skipped automatic push
    echo You can push manually later: git push -u origin main
    echo.
)

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo For detailed documentation, see: GIT_INIT_GUIDE.md
echo.
pause
