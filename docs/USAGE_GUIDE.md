# ChatPDF 使用指南

## 📋 目录
1. [快速开始](#快速开始)
2. [详细配置](#详细配置)
3. [功能使用](#功能使用)
4. [常见问题](#常见问题)
5. [进阶使用](#进阶使用)

---

## 🚀 快速开始

### 方法一：使用启动脚本（推荐）

**后端启动：**
```bash
chmod +x start_backend.sh
./start_backend.sh
```

**前端启动：**
```bash
cd chatpdf-frontend
npm install
npm start
```

### 方法二：手动启动

**1. 启动后端**
```bash
# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt

# 启动服务
python chatpdf_backend.py
```

**2. 启动前端**
```bash
# 创建React项目
npx create-react-app chatpdf-frontend
cd chatpdf-frontend

# 安装依赖
npm install lucide-react
npm install -D tailwindcss postcss autoprefixer

# 配置Tailwind
npx tailwindcss init

# 复制组件文件
# 将ChatPDF.jsx复制到src/components/

# 启动开发服务器
npm start
```

### 方法三：使用Docker

```bash
# 构建并启动所有服务
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down
```

---

## ⚙️ 详细配置

### 1. API配置

#### OpenAI配置
```
API提供商: openai
模型: gpt-3.5-turbo (经济) 或 gpt-4 (高质量)
API Key: 从 https://platform.openai.com/api-keys 获取
```

#### Anthropic Claude配置
```
API提供商: anthropic
模型: claude-3-sonnet-20240229 (推荐) 或 claude-3-opus-20240229
API Key: 从 https://console.anthropic.com/ 获取
```

### 2. 环境变量配置

创建 `.env` 文件：
```env
# 可选：设置默认配置
DEFAULT_API_PROVIDER=openai
DEFAULT_MODEL=gpt-3.5-turbo
MAX_FILE_SIZE=10485760
```

### 3. 高级配置

**修改后端端口：**
```python
# 在 chatpdf_backend.py 底部修改
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)  # 改为8080
```

**修改前端API地址：**
```javascript
// 在 ChatPDF.jsx 中修改
const API_BASE_URL = 'http://your-backend-url:8000';
```

---

## 📖 功能使用

### 1. 上传PDF文档

**步骤：**
1. 打开应用 `http://localhost:3000`
2. 点击"选择PDF文件"按钮
3. 选择要分析的PDF文档
4. 等待上传完成

**支持的文档：**
- ✅ 文本型PDF（可复制文本）
- ❌ 扫描型PDF（需要OCR，当前版本不支持）
- 📏 建议大小：< 10MB
- 📄 建议页数：< 100页

### 2. 查看文档摘要

**自动生成：**
- 文档上传后自动生成摘要
- 显示文档核心要点
- 提供5个建议问题

**手动刷新：**
```javascript
// 可以在代码中添加刷新按钮
<button onClick={() => generateSummary(docId)}>
  重新生成摘要
</button>
```

### 3. 与文档对话

**提问技巧：**

**✅ 好的问题：**
- "这篇文档的主要观点是什么？"
- "文档中提到了哪些关键数据？"
- "请解释第3页的图表含义"
- "作者的结论是什么？"

**❌ 避免的问题：**
- "你觉得这个观点对吗？"（AI只基于文档内容）
- "帮我写一篇新文章"（超出文档范围）

**提问示例：**

```
📄 研究论文分析：
- "这项研究的方法论是什么？"
- "实验结果支持假设吗？"
- "文章的局限性在哪里？"

📊 商业报告分析：
- "本季度的主要财务指标是什么？"
- "报告中提到了哪些风险？"
- "未来的增长策略是什么？"

📖 技术文档分析：
- "如何配置这个功能？"
- "有哪些API接口？"
- "文档中的示例代码是什么意思？"
```

### 4. 使用建议问题

**快速提问：**
1. 查看摘要下方的建议问题
2. 点击任意问题
3. 问题自动填充到输入框
4. 发送或修改后发送

---

## ❓ 常见问题

### Q1: 上传失败怎么办？

**可能原因：**
1. PDF文件过大（>10MB）
2. PDF文件损坏
3. 网络连接问题

**解决方案：**
```bash
# 检查后端是否运行
curl http://localhost:8000/health

# 检查文件大小
ls -lh your_file.pdf

# 压缩PDF
# 使用在线工具或PDF压缩软件
```

### Q2: AI回答不准确？

**改进方法：**
1. **使用更强模型**：改用GPT-4或Claude-3-Opus
2. **优化问题**：提问更具体明确
3. **检查文档**：确保PDF文本提取正确
4. **分段提问**：将复杂问题拆分

### Q3: API调用失败？

**检查清单：**
```bash
✅ API Key是否正确
✅ API Key是否有余额
✅ 网络是否能访问API
✅ 模型名称是否正确
```

**测试API连接：**
```bash
# OpenAI测试
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer YOUR_API_KEY"

# Anthropic测试
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: YOUR_API_KEY" \
  -H "anthropic-version: 2023-06-01"
```

### Q4: 文档内容显示乱码？

**原因：**
- PDF使用特殊编码
- 包含非文本元素（图片、公式）

**解决方案：**
```bash
# 使用pdfplumber替代PyPDF2
pip install pdfplumber

# 在backend中修改导入
import pdfplumber
# 然后修改extract_text_from_pdf函数
```

### Q5: 部署到服务器后CORS错误？

**解决方案：**
```python
# 在chatpdf_backend.py中修改CORS配置
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "http://your-domain.com",  # 添加你的域名
        "https://your-domain.com"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

## 🎓 进阶使用

### 1. 添加向量数据库（提升准确性）

**为什么需要？**
- 文档太长，超出token限制
- 提高信息检索准确性
- 支持语义搜索

**实现方案：**

```bash
# 安装依赖
pip install chromadb sentence-transformers
```

```python
# 集成ChromaDB
import chromadb
from sentence_transformers import SentenceTransformer

# 初始化
client = chromadb.Client()
model = SentenceTransformer('all-MiniLM-L6-v2')

# 存储文档向量
def store_document_embeddings(doc_id, pages):
    collection = client.create_collection(doc_id)
    
    for page in pages:
        embedding = model.encode(page['content'])
        collection.add(
            embeddings=[embedding.tolist()],
            documents=[page['content']],
            metadatas=[{"page": page['page']}],
            ids=[f"page_{page['page']}"]
        )

# 检索相关内容
def search_relevant_content(doc_id, question, n_results=3):
    collection = client.get_collection(doc_id)
    question_embedding = model.encode(question)
    
    results = collection.query(
        query_embeddings=[question_embedding.tolist()],
        n_results=n_results
    )
    
    return results['documents'][0]
```

### 2. 添加OCR支持（扫描版PDF）

```bash
# 安装Tesseract OCR
# Ubuntu/Debian
sudo apt-get install tesseract-ocr

# macOS
brew install tesseract

# 安装Python库
pip install pytesseract pdf2image
```

```python
# 添加OCR功能
from pdf2image import convert_from_path
import pytesseract

def extract_text_with_ocr(pdf_path):
    images = convert_from_path(pdf_path)
    text = ""
    
    for i, image in enumerate(images):
        text += f"\n--- Page {i+1} ---\n"
        text += pytesseract.image_to_string(image, lang='chi_sim+eng')
    
    return text
```

### 3. 添加用户认证系统

```bash
pip install python-jose[cryptography] passlib[bcrypt]
```

```python
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from passlib.context import CryptContext
from jose import JWTError, jwt

# 配置
SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
pwd_context = CryptContext(schemes=["bcrypt"])
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

# 创建token
def create_access_token(data: dict):
    to_encode = data.copy()
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

# 验证token
async def get_current_user(token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(status_code=401)
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
    except JWTError:
        raise credentials_exception
    return username
```

### 4. 数据库持久化

```bash
pip install sqlalchemy alembic
```

```python
from sqlalchemy import create_engine, Column, String, Text, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class Document(Base):
    __tablename__ = "documents"
    
    id = Column(String, primary_key=True)
    filename = Column(String)
    content = Column(Text)
    upload_time = Column(DateTime)
    user_id = Column(String)

# 创建数据库
engine = create_engine('sqlite:///chatpdf.db')
Base.metadata.create_all(engine)
```

### 5. 添加文档翻译功能

```python
async def translate_document(doc_id: str, target_lang: str, api_key: str):
    """翻译整个文档"""
    doc = documents_store[doc_id]
    
    messages = [
        {
            "role": "system",
            "content": f"请将以下文档翻译成{target_lang}，保持原有格式和结构。"
        },
        {
            "role": "user",
            "content": doc["data"]["full_text"][:8000]
        }
    ]
    
    response = await call_ai_api(messages, api_key, model, provider)
    return response["choices"][0]["message"]["content"]
```

---

## 📊 性能优化建议

### 1. 缓存策略

```python
from functools import lru_cache
import hashlib

# 缓存摘要结果
summary_cache = {}

def get_cache_key(doc_id, model):
    return hashlib.md5(f"{doc_id}:{model}".encode()).hexdigest()

async def generate_summary_cached(request):
    cache_key = get_cache_key(request.doc_id, request.model)
    
    if cache_key in summary_cache:
        return summary_cache[cache_key]
    
    result = await generate_summary(request)
    summary_cache[cache_key] = result
    return result
```

### 2. 异步任务队列

```bash
pip install celery redis
```

```python
from celery import Celery

celery_app = Celery('chatpdf', broker='redis://localhost:6379')

@celery_app.task
def generate_summary_task(doc_id, api_key, model):
    # 异步处理摘要生成
    pass
```

### 3. 文档分块处理

```python
def chunk_text(text, chunk_size=2000, overlap=200):
    """将文本分块"""
    chunks = []
    start = 0
    
    while start < len(text):
        end = start + chunk_size
        chunk = text[start:end]
        chunks.append(chunk)
        start = end - overlap
    
    return chunks
```

---

## 🔒 安全最佳实践

1. **永远不要暴露API Key**
2. **使用环境变量存储敏感信息**
3. **添加请求频率限制**
4. **验证上传文件类型和大小**
5. **使用HTTPS加密传输**
6. **定期更新依赖包**
7. **添加日志记录和监控**

---

## 📞 获取帮助

- 📖 查看完整文档：`README.md`
- 🐛 报告问题：提交GitHub Issue
- 💬 技术讨论：加入社区

---

**祝使用愉快！如有问题随时查阅本指南。** 🎉
