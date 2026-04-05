@echo off
chcp 65001 >nul
title Git 初始化 - AI Prompt Library

:: 始终保持窗口打开
setlocal enabledelayedexpansion

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
    echo.
    echo 请先安装 Git:
    echo https://git-scm.com/downloads
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b 1
)

echo [成功] Git 已安装
git --version
echo.
pause

:: 步骤 2: 初始化仓库
echo.
echo ========================================
echo [2/5] 初始化 Git 仓库
echo ========================================
echo.
if exist ".git" (
    echo [提示] 已存在 Git 仓库
    echo 是否重新初始化？(y/n，默认 n): 
    set /p reinit=""
    if /i "!reinit!"=="y" (
        git init
        echo [完成] Git 仓库已重新初始化
    ) else (
        echo [跳过] 使用现有仓库
    )
) else (
    git init
    echo [完成] Git 仓库已初始化
)
echo.
pause

:: 步骤 3: 配置用户信息
echo.
echo ========================================
echo [3/5] 配置 Git 用户信息
echo ========================================
echo.
echo 请输入你的 GitHub 用户名和邮箱
echo (这些信息会显示在你的代码提交记录中)
echo.

set /p gitname="Git 用户名（GitHub 账号名）: "
set /p gitemail="Git 邮箱："

git config user.name "!gitname!"
git config user.email "!gitemail!"

echo.
echo [完成] Git 用户信息已配置
echo 用户名：!gitname!
echo 邮箱：!gitemail!
echo.
pause

:: 步骤 4: 添加并提交文件
echo.
echo ========================================
echo [4/5] 添加并提交文件
echo ========================================
echo.
echo 正在添加所有文件到 Git...
git add .

echo 正在提交更改...
git commit -m "Initial commit: AI Prompt Library website"

echo.
echo [完成] 文件已提交
echo.
pause

:: 步骤 5: 配置远程仓库
echo.
echo ========================================
echo [5/5] 配置远程仓库
echo ========================================
echo.
echo 你想现在就配置远程仓库吗？
echo - 选择\"是\"：需要输入 GitHub 仓库地址
echo - 选择\"否\"：稍后手动配置 (推荐新手)
echo.
set /p setupremote="是否配置远程仓库？(y/n，默认 n): "

if /i "!setupremote!"=="y" (
    echo.
    echo 请选择连接方式:
    echo 1. HTTPS (需要每次输入 Token)
    echo 2. SSH (推荐，需要先配置 SSH 密钥)
    echo.
    set /p choice="输入选择 (1 或 2，默认 1): "
    
    if "!choice!"=="2" (
        set /p repourl="请输入 SSH 仓库地址 (格式：git@github.com:用户名/仓库名.git): "
    ) else (
        set /p repourl="请输入 HTTPS 仓库地址 (格式：https://github.com/用户名/仓库名.git): "
    )
    
    git remote add origin !repourl!
    
    echo.
    echo [完成] 远程仓库已配置
    echo 地址：!repourl!
) else (
    echo.
    echo [跳过] 暂不配置远程仓库
    echo 提示：稍后可以手动执行以下命令:
    echo   git remote add origin ^<仓库地址^>
)
echo.
pause

:: 完成
cls
echo ========================================
echo   🎉 初始化完成！
echo ========================================
echo.
echo 启涵，Git 仓库已经准备就绪!
echo.
echo 下一步操作:
echo 1. 在 GitHub 创建空仓库 (如果还没有)
echo 2. 运行以下命令推送到 GitHub:
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. 在 GitHub 仓库的 Settings ^→ Pages 中启用 Pages
echo.
echo 详细指南请查看: QUICK_START.md
echo.
echo ========================================
echo 按任意键关闭窗口...
pause >nul
