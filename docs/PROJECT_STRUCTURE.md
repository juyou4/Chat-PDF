# ChatPDF 项目结构

```
chatpdf/
│
├── 后端文件
│   ├── chatpdf_backend.py          # FastAPI后端主文件
│   ├── requirements.txt            # Python依赖
│   ├── Dockerfile.backend          # 后端Docker配置
│   └── .env.example                # 环境变量示例
│
├── 前端文件
│   ├── ChatPDF.jsx                 # React主组件
│   ├── package.json                # Node.js依赖
│   ├── tailwind.config.js          # Tailwind CSS配置
│   └── Dockerfile.frontend         # 前端Docker配置
│
├── 部署文件
│   ├── docker-compose.yml          # Docker Compose配置
│   ├── nginx.conf                  # Nginx配置
│   └── start_backend.sh            # 快速启动脚本
│
└── 文档
    ├── README.md                   # 项目说明文档
    ├── USAGE_GUIDE.md              # 详细使用指南
    └── PROJECT_STRUCTURE.md        # 本文件
```

## 文件说明

### 核心文件

**chatpdf_backend.py**
- FastAPI后端服务
- 处理PDF上传、解析、AI对话
- 提供RESTful API接口

**ChatPDF.jsx**
- React前端组件
- 用户界面和交互逻辑
- 与后端API通信

### 配置文件

**requirements.txt**
- Python项目依赖
- FastAPI, PyPDF2, httpx等

**package.json**
- Node.js项目依赖
- React, Tailwind CSS, Lucide React等

**tailwind.config.js**
- Tailwind CSS样式配置

**.env.example**
- 环境变量模板
- 包含API配置示例

### 部署文件

**docker-compose.yml**
- Docker多容器编排
- 一键启动前后端服务

**Dockerfile.backend / Dockerfile.frontend**
- Docker镜像构建配置
- 支持容器化部署

**nginx.conf**
- Nginx反向代理配置
- 生产环境部署使用

**start_backend.sh**
- 快速启动脚本
- 自动创建虚拟环境并启动

### 文档

**README.md**
- 项目概述
- 快速开始指南
- API文档

**USAGE_GUIDE.md**
- 详细使用教程
- 常见问题解答
- 进阶功能说明

## 创建React项目步骤

### 1. 创建基础项目
```bash
npx create-react-app chatpdf-frontend
cd chatpdf-frontend
```

### 2. 安装依赖
```bash
npm install lucide-react
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
```

### 3. 配置Tailwind

将 `tailwind.config.js` 内容替换为项目提供的配置。

在 `src/index.css` 中添加：
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### 4. 添加组件

创建目录：
```bash
mkdir src/components
```

将 `ChatPDF.jsx` 复制到 `src/components/ChatPDF.jsx`

### 5. 修改App.js

```jsx
import ChatPDF from './components/ChatPDF';

function App() {
  return <ChatPDF />;
}

export default App;
```

### 6. 启动开发服务器
```bash
npm start
```

## 后端启动步骤

### 方法1：使用脚本
```bash
chmod +x start_backend.sh
./start_backend.sh
```

### 方法2：手动启动
```bash
# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt

# 启动服务
python chatpdf_backend.py
```

## Docker部署步骤

```bash
# 构建并启动
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down
```

## 生产部署建议

### 1. 使用独立服务器
- 后端：VPS/云服务器运行FastAPI
- 前端：Vercel/Netlify托管静态文件

### 2. 环境变量配置
```bash
# 生产环境.env
DATABASE_URL=postgresql://...
REDIS_URL=redis://...
API_KEY_ENCRYPTION_KEY=...
```

### 3. 反向代理
使用Nginx或Caddy作为反向代理：
```nginx
server {
    listen 80;
    server_name api.yourdomain.com;
    
    location / {
        proxy_pass http://localhost:8000;
    }
}
```

### 4. 进程管理
使用PM2、Supervisor或systemd管理后端进程：
```bash
# 使用systemd
sudo systemctl start chatpdf-backend
sudo systemctl enable chatpdf-backend
```

## 安全建议

1. **API Key管理**
   - 不要在前端硬编码
   - 使用环境变量
   - 考虑后端代理模式

2. **CORS配置**
   - 限制允许的域名
   - 生产环境不使用通配符

3. **文件上传**
   - 限制文件大小
   - 验证文件类型
   - 扫描恶意内容

4. **请求频率限制**
   - 防止API滥用
   - 保护服务器资源

## 维护建议

1. **日志记录**
   - 记录所有API调用
   - 监控错误和异常

2. **监控告警**
   - 服务健康检查
   - 资源使用监控

3. **定期更新**
   - 更新依赖包
   - 修复安全漏洞

4. **备份策略**
   - 定期备份数据库
   - 备份用户上传文件

## 扩展建议

1. **功能扩展**
   - 添加用户系统
   - 支持多文档对话
   - 添加文档翻译
   - 集成OCR识别

2. **性能优化**
   - 使用向量数据库
   - 添加缓存机制
   - 异步任务处理
   - CDN加速

3. **商业化**
   - 订阅制付费
   - API调用计费
   - 企业版功能

## 技术栈

### 后端
- **Python 3.8+**
- **FastAPI** - Web框架
- **PyPDF2** - PDF处理
- **httpx** - HTTP客户端
- **Pydantic** - 数据验证

### 前端
- **React 18** - UI框架
- **Tailwind CSS** - 样式框架
- **Lucide React** - 图标库

### 可选集成
- **ChromaDB** - 向量数据库
- **Tesseract** - OCR识别
- **SQLAlchemy** - ORM
- **Redis** - 缓存
- **Celery** - 任务队列

## 开发工具

- **VSCode** - 代码编辑器
- **Postman** - API测试
- **Docker** - 容器化
- **Git** - 版本控制

## 相关资源

- FastAPI文档: https://fastapi.tiangolo.com/
- React文档: https://react.dev/
- Tailwind CSS: https://tailwindcss.com/
- OpenAI API: https://platform.openai.com/docs
- Anthropic API: https://docs.anthropic.com/

---

如有问题，请参考 USAGE_GUIDE.md 或提交Issue。
