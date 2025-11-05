# 民商事模拟审判系统

基于 FastAPI + React + DeepSeek AI 的民商事纠纷模拟审判系统，支持完整的审判流程模拟，包括起诉、答辩、质证、辩论和判决生成。

## 功能特点

- ✨ **完整审判流程**：涵盖起诉状、答辩状、证据提交、质证、辩论、判决等全流程
- 🤖 **AI智能分析**：使用 DeepSeek AI 进行争议焦点分析、辩论建议生成和判决书生成
- 💾 **数据持久化**：支持案件历史记录保存和检索
- 📱 **现代化UI**：基于 Ant Design 的美观界面
- 🔄 **步骤化流程**：清晰的步骤引导，便于操作

## 技术栈

### 后端
- FastAPI - 现代化 Python Web 框架
- SQLAlchemy - ORM 数据库操作
- Pydantic - 数据验证
- httpx - 异步 HTTP 客户端
- SQLite - 数据库（开发环境）

### 前端
- React 18 - 用户界面库
- Ant Design - UI 组件库
- React Router - 路由管理
- Axios - HTTP 客户端
- Vite - 构建工具

### AI服务
- DeepSeek API - 大语言模型服务

## 项目结构

```
firstjudge/
├── backend/                 # FastAPI 后端
│   ├── app/
│   │   ├── models/         # SQLAlchemy 数据模型
│   │   ├── schemas/        # Pydantic 数据模式
│   │   ├── api/            # API 路由
│   │   ├── services/       # 业务逻辑层（DeepSeek 服务）
│   │   ├── core/           # 核心配置
│   │   └── main.py         # 应用入口
│   └── requirements.txt    # Python 依赖
├── frontend/               # React 前端
│   ├── src/
│   │   ├── components/    # React 组件
│   │   ├── pages/         # 页面组件
│   │   ├── services/      # API 调用服务
│   │   └── App.jsx        # 应用入口
│   └── package.json       # Node 依赖
└── README.md              # 项目说明
```

## 快速开始

### 环境要求

- Python 3.9+
- Node.js 16+
- DeepSeek API 密钥

### 1. 克隆项目

```bash
git clone <repository-url>
cd firstjudge
```

### 2. 配置环境变量

在 `backend` 目录下创建 `.env` 文件：

```env
# DeepSeek API配置
DEEPSEEK_API_KEY=your_deepseek_api_key_here
DEEPSEEK_API_URL=https://api.deepseek.com/v1/chat/completions

# 数据库配置
DATABASE_URL=sqlite:///./firstjudge.db

# 应用配置
APP_NAME=民商事模拟审判系统
APP_VERSION=1.0.0
DEBUG=True

# CORS配置
CORS_ORIGINS=http://localhost:3000,http://localhost:5173
```

### 3. 启动后端

```bash
cd backend

# 安装依赖
pip install -r requirements.txt

# 启动服务（默认端口 8000）
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

后端 API 文档：http://localhost:8000/docs

### 4. 启动前端

```bash
cd frontend

# 安装依赖
npm install

# 启动开发服务器（默认端口 3000）
npm run dev
```

前端访问地址：http://localhost:3000

## 使用流程

### 1. 创建案件
- 填写案件基本信息（案号、原被告、案件类型等）

### 2. 提交起诉状
- 原告填写起诉状内容
- 上传原告证据材料

### 3. 提交答辩状
- 查看起诉状
- 被告填写答辩状内容
- 上传被告证据材料

### 4. 质证阶段
- 双方对对方证据进行质证
- 提交质证意见

### 5. AI分析争议焦点
- 点击按钮触发 AI 分析
- AI 综合分析案件材料，归纳争议焦点

### 6. AI生成辩论建议
- 为原被告双方分别生成辩论建议
- 包括整体策略、针对各焦点的建议、风险提示等

### 7. 提交辩论意见
- 双方根据 AI 建议提交辩论意见
- 可提交多轮辩论
- 添加参考案例（可选）

### 8. 生成判决书
- AI 根据全部案件材料生成判决书
- 支持打印和下载

## API 接口

主要 API 端点：

- `POST /api/cases/` - 创建案件
- `GET /api/cases/` - 获取案件列表
- `GET /api/cases/{case_id}` - 获取案件详情
- `POST /api/cases/{case_id}/complaint` - 提交起诉状
- `POST /api/cases/{case_id}/defense` - 提交答辩状
- `POST /api/cases/{case_id}/evidence` - 提交证据
- `POST /api/cases/{case_id}/cross-examination` - 提交质证意见
- `POST /api/cases/{case_id}/analyze-dispute` - AI 分析争议焦点
- `POST /api/cases/{case_id}/debate-suggestions` - AI 生成辩论建议
- `POST /api/cases/{case_id}/debate-opinion` - 提交辩论意见
- `POST /api/cases/{case_id}/reference-cases` - 添加参考案例
- `POST /api/cases/{case_id}/generate-judgment` - AI 生成判决书

完整 API 文档：访问 http://localhost:8000/docs

## 数据库模型

### 核心表结构

- **Case（案件表）** - 案件基本信息和状态
- **Complaint（起诉状）** - 原告起诉状
- **Defense（答辩状）** - 被告答辩状
- **Evidence（证据表）** - 原被告证据材料
- **CrossExamination（质证意见）** - 双方质证意见
- **DisputeFocus（争议焦点）** - AI 分析的争议焦点
- **DebateSuggestion（辩论建议）** - AI 生成的辩论建议
- **DebateOpinion（辩论意见）** - 双方辩论意见
- **ReferencedCase（参考案例）** - 参考案例
- **Judgment（判决书）** - AI 生成的判决书

## DeepSeek AI 集成

系统使用 DeepSeek API 提供以下 AI 功能：

### 1. 争议焦点分析
- 输入：起诉状、答辩状、证据、质证意见
- 输出：结构化的争议焦点列表

### 2. 辩论建议生成
- 输入：争议焦点、当事人角色、案件材料
- 输出：针对性的辩论策略和建议

### 3. 判决书生成
- 输入：完整案件信息、辩论意见、参考案例
- 输出：规范的民事判决书

## 开发说明

### 添加新功能

1. **后端**：
   - 在 `backend/app/models/` 添加数据模型
   - 在 `backend/app/schemas/` 添加数据验证模式
   - 在 `backend/app/api/` 添加 API 路由
   - 在 `backend/app/services/` 添加业务逻辑

2. **前端**：
   - 在 `frontend/src/components/` 添加组件
   - 在 `frontend/src/pages/` 添加页面
   - 在 `frontend/src/services/api.js` 添加 API 调用

### 运行测试

```bash
# 后端测试
cd backend
pytest

# 前端测试
cd frontend
npm test
```

### 构建生产版本

```bash
# 前端构建
cd frontend
npm run build

# 生产环境运行后端
cd backend
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

## 注意事项

1. **API 密钥安全**：确保 `.env` 文件不要提交到版本控制系统
2. **数据库备份**：定期备份 SQLite 数据库文件
3. **AI 调用限制**：注意 DeepSeek API 的调用频率和配额限制
4. **错误处理**：AI 生成结果可能不稳定，已添加 JSON 解析容错机制

## 许可证

MIT License

## 联系方式

如有问题或建议，请联系项目维护者。

---

**祝您使用愉快！**

