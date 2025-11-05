#!/bin/bash

echo "================================"
echo "民商事模拟审判系统启动脚本"
echo "================================"
echo ""

# 检查 .env 文件
if [ ! -f "backend/.env" ]; then
    echo "[错误] 未找到 backend/.env 文件"
    echo "请复制 backend/.env.example 为 backend/.env 并配置 DeepSeek API 密钥"
    exit 1
fi

echo "[1/4] 检查 Python 环境..."
if ! command -v python3 &> /dev/null; then
    echo "[错误] 未找到 Python，请先安装 Python 3.9+"
    exit 1
fi

echo "[2/4] 检查 Node.js 环境..."
if ! command -v node &> /dev/null; then
    echo "[错误] 未找到 Node.js，请先安装 Node.js 16+"
    exit 1
fi

echo "[3/4] 启动后端服务..."
cd backend
python3 run.py &
BACKEND_PID=$!
cd ..
sleep 3

echo "[4/4] 启动前端服务..."
cd frontend
npm run dev &
FRONTEND_PID=$!
cd ..

echo ""
echo "================================"
echo "启动完成！"
echo "================================"
echo "后端 API: http://localhost:8000"
echo "API 文档: http://localhost:8000/docs"
echo "前端界面: http://localhost:3000"
echo "================================"
echo ""
echo "按 Ctrl+C 停止服务"

# 等待用户中断
trap "kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait

