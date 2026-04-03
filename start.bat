@echo off
chcp 65001 >nul
echo ========================================
echo   🚀 AI 者华歌提示词库 - 本地开发服务器
echo ========================================
echo.

REM 检查 Python 是否安装
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误：未检测到 Python，请先安装 Python 3.x
    echo 下载地址：https://www.python.org/downloads/
    pause
    exit /b 1
)

echo ✅ Python 已安装
echo.
echo 📂 项目目录：%~dp0
echo.
echo 🌐 访问地址：http://localhost:8000
echo 💡 提示：按 Ctrl+C 可停止服务器
echo.
echo ========================================
echo   服务器启动中...
echo ========================================
echo.

REM 启动 HTTP 服务器
python -m http.server 8000

pause
