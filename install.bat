@echo off
echo ================================
echo 民商事模拟审判系统 - 依赖安装
echo ================================
echo.

echo [1/3] 安装后端依赖...
cd backend
pip install -r requirements.txt
if errorlevel 1 (
    echo [错误] 后端依赖安装失败
    pause
    exit /b 1
)
cd ..

echo.
echo [2/3] 安装前端依赖...
cd frontend
call npm install
if errorlevel 1 (
    echo [错误] 前端依赖安装失败
    pause
    exit /b 1
)
cd ..

echo.
echo [3/3] 创建环境配置文件...
if not exist "backend\.env" (
    copy "backend\.env.example" "backend\.env"
    echo 已创建 backend\.env 文件，请编辑并填入 DeepSeek API 密钥
) else (
    echo backend\.env 文件已存在，跳过
)

echo.
echo ================================
echo 安装完成！
echo ================================
echo.
echo 下一步：
echo 1. 编辑 backend\.env 文件，填入 DeepSeek API 密钥
echo 2. 运行 start.bat 启动系统
echo.
pause

