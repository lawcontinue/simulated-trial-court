@echo off
echo ================================
echo 民商事模拟审判系统启动脚本
echo ================================
echo.

REM 检查是否存在 .env 文件
if not exist "backend\.env" (
    echo [错误] 未找到 backend\.env 文件
    echo 请复制 backend\.env.example 为 backend\.env 并配置 DeepSeek API 密钥
    pause
    exit /b 1
)

echo [1/4] 检查 Python 环境...
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到 Python，请先安装 Python 3.9+
    pause
    exit /b 1
)

echo [2/4] 检查 Node.js 环境...
node --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到 Node.js，请先安装 Node.js 16+
    pause
    exit /b 1
)

echo [3/4] 启动后端服务...
start "FirstJudge Backend" cmd /k "cd backend && python run.py"
timeout /t 3 >nul

echo [4/4] 启动前端服务...
start "FirstJudge Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ================================
echo 启动完成！
echo ================================
echo 后端 API: http://localhost:8000
echo API 文档: http://localhost:8000/docs
echo 前端界面: http://localhost:3000
echo ================================
echo.
pause

