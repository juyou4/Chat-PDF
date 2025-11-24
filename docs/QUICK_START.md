# ChatPDF 快速开始指南

本指南帮助您快速启动ChatPDF项目。

## 📋 前提条件

### 必需软件
- **Python 3.8+** - [下载](https://www.python.org/downloads/)
- **Node.js 16+** - [下载](https://nodejs.org/)
- **Git** - [下载](https://git-scm.com/)

### 可选软件
- **Docker** - 用于容器化部署
- **Redis** - 用于缓存（可选）

## 🚀 快速启动

### 1. 克隆项目

```bash
git clone <your-repository-url>
cd ChatPDF
```

### 2. 启动后端

#### Windows:
```bash
# 双击运行
scripts\start_backend.bat

# 或在命令行:
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements_ultimate.txt
python chatpdf_ultimate_backend.py
```

#### Linux/Mac:
```bash
chmod +x scripts/start_backend.sh
./scripts/start_backend.sh

# 或手动:
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements_ultimate.txt
python chatpdf_ultimate_backend.py
```

后端启动后访问：
- API服务: http://localhost:8000
- API文档: http://localhost:8000/docs

### 3. 启动前端

打开新终端：

```bash
cd frontend
npm install
npm start
```

前端启动后自动打开: http://localhost:3000

## 🔑 配置API密钥

### 获取API Key

选择一个AI提供商并获取API Key：

**OpenAI:**
1. 访问 https://platform.openai.com/api-keys
2. 点击"Create new secret key"
3. 复制密钥保存

**DeepSeek (推荐-便宜):**
1. 访问 https://platform.deepseek.com/
2. 注册并获取API Key
3. 复制保存

### 在应用中配置

1. 启动应用后，点击右上角⚙️设置图标
2. 选择API提供商（OpenAI、Anthropic等）
3. 输入模型名称：
   - OpenAI: `gpt-3.5-turbo` 或 `gpt-4`
   - DeepSeek: `deepseek-chat`
   - Anthropic: `claude-3-sonnet-20240229`
4. 粘贴API Key
5. 设置自动保存

## 📝 第一次使用

1. **上传PDF文档**
   - 点击"选择PDF文件"按钮
   - 选择要分析的PDF

2. **查看自动摘要**
   - 上传后自动生成文档摘要
   - 显示建议问题

3. **开始对话**
   - 输入框输入问题
   - 点击发送或按Enter
   - AI基于文档内容回答

4. **（可选）启用向量检索**
   - 上传文档后，可创建向量索引
   - 提升长文档检索准确性

## 🐳 Docker快速启动

如果您安装了Docker：

```bash
cd docker
docker-compose up --build
```

服务自动启动：
- 后端: http://localhost:8000
- 前端: http://localhost:3000

## 🔧 版本选择

### 基础版（简单快速）

```bash
cd backend
pip install -r requirements.txt
python chatpdf_backend.py
```

特点：
- ✅ 快速安装
- ✅ 基础对话功能
- ❌ 无向量检索
- ❌ 无流式响应

### Ultimate版（功能完整，推荐）

```bash
cd backend
pip install -r requirements_ultimate.txt
python chatpdf_ultimate_backend.py
```

特点：
- ✅ 向量检索
- ✅ 流式响应
- ✅ 表格提取
- ✅ 更准确的长文档处理

## ⚠️ 常见问题

### 后端启动失败

**问题**: `ModuleNotFoundError`  
**解决**: 
```bash
pip install -r requirements_ultimate.txt
```

**问题**: 端口8000已被占用  
**解决**: 
```bash
# 修改端口
uvicorn chatpdf_ultimate_backend:app --port 8001
```

### 前端启动失败

**问题**: `npm install` 失败  
**解决**:
```bash
# 清除缓存
npm cache clean --force
npm install
```

**问题**: 无法连接后端  
**解决**: 确保后端在8000端口运行，或修改前端API地址

### API调用失败

**问题**: "API Key无效"  
**解决**: 检查API Key是否正确，是否有足够额度

**问题**: "超时"  
**解决**: 检查网络连接，某些地区可能需要代理

## 📚 下一步

- 查看 [详细使用指南](USAGE_GUIDE.md)
- 了解 [API配置](API_CONFIG_GUIDE.md)
- 探索 [高级功能](UPGRADE_GUIDE.md)

## 🆘 获取帮助

如遇到问题：
1. 查看 [常见问题文档](USAGE_GUIDE.md#常见问题)
2. 提交 GitHub Issue
3. 查看API文档: http://localhost:8000/docs

---

**祝使用愉快！** 🎉
