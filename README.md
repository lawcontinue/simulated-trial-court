# 后端服务

民商事模拟审判系统后端 API 服务

## 安装依赖

```bash
pip install -r requirements.txt
```

## 配置环境变量

在当前目录下创建 `.env` 文件：

```env
DEEPSEEK_API_KEY=your_api_key_here
DEEPSEEK_API_URL=https://api.deepseek.com/v1/chat/completions
DATABASE_URL=sqlite:///./firstjudge.db
APP_NAME=民商事模拟审判系统
APP_VERSION=1.0.0
DEBUG=True
CORS_ORIGINS=http://localhost:3000,http://localhost:5173
```

## 启动服务

### 方法1：使用 uvicorn 命令

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### 方法2：使用 Python 脚本

```bash
python run.py
```

## 访问 API 文档

启动后访问：http://localhost:8000/docs

## 数据库初始化

首次启动时会自动创建数据库表。

## 项目结构

```
backend/
├── app/
│   ├── models/         # 数据模型
│   ├── schemas/        # 数据验证
│   ├── api/            # API 路由
│   ├── services/       # 业务逻辑
│   ├── core/           # 核心配置
│   └── main.py         # 应用入口
├── requirements.txt    # 依赖列表
└── run.py             # 启动脚本
```

