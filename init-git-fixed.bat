@echo off
chcp 65001 >nul
title Git 初始化 - AI Prompt Library

echo ========================================
echo   GitHub Pages 初始化脚本
echo   AI Prompt Library
echo ========================================
echo.
echo 启涵，你好！这个脚本将帮你：
echo 1. 初始化 Git 仓库
echo 2. 配置用户信息  
echo 3. 提交所有文件
echo 4. 配置远程仓库（可选）
echo.
echo 按任意键开始...
pause >nul
cls

:: 步骤 1: 检查 Git
echo ========================================
echo [1/5] 检查 Git 安装
echo ========================================
echo.
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git!
    echo 请先安装 Git: https://git-scm.com/downloads
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b 1
)
echo [成功] Git 已安装
git --version
echo.
echo 按任意键继续...
pause >nul
cls

:: 步骤 2: 初始化仓库
echo ========================================
echo [2/5] 初始化 Git 仓库
echo ========================================
echo.
if exist ".git" (
    echo [提示] 已存在 Git 仓库
    set /p reinit="是否重新初始化？(y/n，默认 n): "
    if /i "%reinit%"=="y" (
        git init
        echo [完成] 重新初始化完成
    ) else (
        echo [跳过] 使用现有仓库
    )
) else (
    git init
    echo [完成] Git 仓库初始化成功
)
echo.
echo 按任意键继续...
pause >nul
cls

:: 步骤 3: 配置用户信息
echo ========================================
echo [3/5] 配置 Git 用户信息
echo ========================================
echo.
set /p username="请输入你的 Git 用户名 (GitHub 账号名): "
set /p useremail="请输入你的 Git 邮箱："
echo.
git config user.name "%username%"
git config user.email "%useremail%"
echo [完成] 用户信息配置成功
echo 用户名：%username%
echo 邮箱：%useremail%
echo.
echo 按任意键继续...
pause >nul
cls

:: 步骤 4: 添加并提交文件
echo ========================================
echo [4/5] 添加并提交文件
echo ========================================
echo.
echo 正在添加所有文件...
git add .
echo [完成] 文件添加成功
echo.
echo 正在提交更改...
git commit -m "Initial commit: AI Prompt Library website"
echo [完成] 提交成功
echo.
echo 按任意键继续...
pause >nul
cls

:: 步骤 5: 配置远程仓库
echo ========================================
echo [5/5] 配置远程仓库
echo ========================================
echo.
echo 请选择连接方式:
echo 1. HTTPS (需要每次输入 Token)
echo 2. SSH (推荐，需要先配置 SSH 密钥)
echo.
set /p choice="请输入选择 (1 或 2，默认 1): "
echo.

if "%choice%"=="2" (
    set /p repourl="请输入 SSH 仓库地址 (格式：git@github.com:用户名/仓库名.git): "
) else (
    set /p repourl="请输入 HTTPS 仓库地址 (格式：https://github.com/用户名/仓库名.git): "
)

echo.
git remote add origin %repourl% 2>nul
if %errorlevel% equ 0 (
    echo [完成] 远程仓库配置成功
) else (
    echo [提示] 远程仓库已存在，跳过配置
)
echo.
echo 按任意键继续...
pause >nul
cls

:: 推送到 GitHub
echo ========================================
echo 准备推送到 GitHub
echo ========================================
echo.
git branch -M main
echo 提示：如果是第一次推送，可能需要输入 GitHub 凭证
echo - HTTPS 方式：使用 Personal Access Token(不是账号密码)
echo - SSH 方式：确保已配置 SSH 密钥
echo.
set /p confirm="是否立即推送到 GitHub? (y/n，默认 n): "
echo.

if /i "%confirm%"=="y" (
    echo 正在推送...
    git push -u origin main
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo   推送成功！
        echo ========================================
        echo.
        echo 下一步操作:
        echo 1. 访问 https://github.com/%username%/ai-prompt-library/settings/pages
        echo 2. 在 Branch 选择 "main"，Folder 选择 "/ (root)"
        echo 3. 点击 "Save"
        echo 4. 等待 1-3 分钟，网站就会上线
        echo.
        echo 你的网站地址:
        echo https://%username%.github.io/ai-prompt-library/
        echo.
    ) else (
        echo.
        echo [警告] 推送失败，请检查:
        echo - 仓库是否存在
        echo - 身份验证是否成功
        echo - SSH 密钥是否配置
        echo - Clash 等代理软件是否关闭
        echo.
    )
) else (
    echo 已跳过自动推送
    echo 你可以稍后手动执行：git push -u origin main
    echo.
)

echo ========================================
echo 初始化完成！
echo ========================================
echo.
echo 详细文档请查看：GIT_INIT_GUIDE.md
echo.
pause
