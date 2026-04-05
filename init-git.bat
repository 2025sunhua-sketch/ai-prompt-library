@echo off
chcp 65001 >nul
title GitHub Pages 初始化脚本 - AI Prompt Library

:: 显示欢迎信息
echo ========================================
echo   GitHub Pages 初始化脚本
echo   AI Prompt Library
echo ========================================
echo.
echo 本脚本将帮助你：
echo 1. 初始化 Git 仓库
echo 2. 配置用户信息
echo 3. 提交所有文件
echo 4. 配置远程仓库
echo 5. 推送到 GitHub Pages
echo.
echo 按任意键开始...
pause >nul
echo.

:: 检查 Git 是否安装
echo [检查] 正在检测 Git 安装...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [错误] 未检测到 Git，请先安装 Git
    echo 下载地址：https://git-scm.com/downloads
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b 1
)

echo [√] Git 已安装
git --version
echo.

:: 初始化 Git 仓库
echo [步骤 1/5] 初始化 Git 仓库...
echo.

:: 检查是否已经初始化过
if exist ".git" (
    echo [提示] 检测到已存在的 Git 仓库
    set /p REINIT="是否重新初始化？(y/n，默认 n): "
    if /i not "%REINIT%"=="y" (
        echo [跳过] 使用现有 Git 仓库
        echo.
    ) else (
        echo [警告] 重新初始化将保留现有数据，但会重置配置
        git init
    )
) else (
    git init
)

if %errorlevel% neq 0 (
    echo.
    echo [错误] Git 初始化失败
    echo 按任意键退出...
    pause >nul
    exit /b 1
)
echo [√] Git 仓库初始化完成
echo.

:: 配置 Git 用户信息
echo [步骤 2/5] 配置 Git 用户信息
echo.

:: 检查是否已有配置
git config user.name >nul 2>&1
if %errorlevel% equ 0 (
    echo [提示] 当前配置的用户名：git config user.name
    echo [提示] 当前配置的邮箱：git config user.email
    set /p CHANGE_CONFIG="是否修改用户信息？(y/n，默认 n): "
    if /i not "%CHANGE_CONFIG%"=="y" (
        echo [跳过] 使用现有配置
        echo.
        goto :configure_remote
    )
)

set /p GIT_NAME="请输入你的 Git 用户名（GitHub 账号名）: "
set /p GIT_EMAIL="请输入你的 Git 邮箱："

git config user.name "%GIT_NAME%"
git config user.email "%GIT_EMAIL%"
echo [√] Git 用户信息配置完成
echo.

:configure_remote

:: 添加所有文件
echo [步骤 3/5] 添加所有文件到 Git...
git add .
echo [√] 文件添加完成
echo.

:: 提交
echo [步骤 4/5] 提交更改...
git commit -m "Initial commit: AI Prompt Library website"
echo [√] 提交完成
echo.

:: 询问远程仓库地址
echo [步骤 5/5] 配置远程仓库
echo.
echo 请选择连接方式:
echo 1. HTTPS（需要每次输入 Token）
echo 2. SSH（推荐，需要先配置 SSH 密钥）
echo.
set /p CHOICE="请输入选择 (1 或 2，默认 1): "

if "%CHOICE%"=="2" (
    set /p REPO_URL="请输入 SSH 仓库地址 (格式：git@github.com:用户名/仓库名.git): "
    git remote add origin %REPO_URL%
) else (
    set /p REPO_URL="请输入 HTTPS 仓库地址 (格式：https://github.com/用户名/仓库名.git): "
    git remote add origin %REPO_URL%
)

echo.
echo [√] 远程仓库配置完成
echo.

:: 重命名分支并推送
echo ========================================
echo   准备推送代码到 GitHub
echo ========================================
echo.

git branch -M main

echo 提示：如果是第一次推送，可能需要输入 GitHub 凭证
echo - HTTPS 方式：使用 Personal Access Token（不是账号密码）
echo - SSH 方式：确保已配置 SSH 密钥
echo.

set /p CONFIRM="是否立即推送到 GitHub？(y/n，默认 n): "
if /i "%CONFIRM%"=="y" (
    git push -u origin main
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo   🎉 推送成功！
        echo ========================================
        echo.
        echo 下一步操作:
        echo 1. 访问 https://github.com/%GIT_NAME%/ai-prompt-library/settings/pages
        echo 2. 在 Branch 下拉框选择 "main"，文件夹选择 "/ (root)"
        echo 3. 点击 "Save"
        echo 4. 等待 1-3 分钟，网站就会上线
        echo.
        echo 你的网站地址将是:
        echo https://%GIT_NAME%.github.io/ai-prompt-library/
        echo.
    ) else (
        echo.
        echo [警告] 推送失败，请检查网络连接和仓库地址
        echo 常见原因:
        echo - 仓库不存在或未正确创建
        echo - 身份验证失败（HTTPS 方式需要使用 Token）
        echo - SSH 密钥未配置
        echo - Clash 等代理软件干扰（请临时关闭或配置直连）
        echo.
        echo 按任意键继续...
        pause >nul
    )
) else (
    echo.
    echo 已跳过自动推送
    echo 你可以稍后手动执行：git push -u origin main
    echo.
)

echo ========================================
echo   初始化完成！
echo ========================================
echo.
echo 详细文档请查看：GITHUB_PAGES_DEPLOY.md
echo.
pause
