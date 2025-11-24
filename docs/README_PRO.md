# ChatPDF Pro - 专业版文档对话系统

## 🌟 项目亮点

✨ **最新AI模型全支持**
- OpenAI: GPT-5.1, GPT-4.1, o4-mini
- Anthropic: Claude Sonnet 4.5, Opus 4.1, Haiku 4.5
- xAI: Grok 4.1, Grok 4.1 Fast
- 字节: 豆包 1.5 Pro (256K上下文)
- 阿里: Qwen3-Max, Qwen3-Coder-Plus
- MiniMax: ABAB 6.5, MiniMax-M2
- 智谱: GLM-4.6 (355B MoE)
- DeepSeek: DeepSeek-V3.2, DeepSeek-R1
- Moonshot: Kimi K2-Instruct
- Google: Gemini 2.5 Pro, Gemini 2.5 Flash

🎨 **专业UI设计**
- 左右分栏布局：左侧PDF预览 + 右侧AI对话
- PDF原文可选择、复制、缩放、翻页
- 选中文本后直接AI解释
- 流畅的交互体验

⚡ **强大功能**
- PDF智能解析和文本提取
- 基于文档内容的精准问答
- 自动生成文档摘要
- 建议问题推荐
- 支持选中文本提问
- 实时模型切换

## 🚀 快速开始

### 1. 后端部署

```bash
# 安装依赖
pip install fastapi uvicorn python-multipart PyPDF2 httpx pydantic

# 启动后端
python chatpdf_pro_backend.py
```

后端将运行在 `http://localhost:8000`

### 2. 前端部署

```bash
# 创建React项目
npx create-react-app chatpdf-pro
cd chatpdf-pro

# 安装依赖
npm install lucide-react

# 配置Tailwind CSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
```

**配置 `tailwind.config.js`:**
```javascript
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: { extend: {} },
  plugins: [],
}
```

**在 `src/index.css` 添加:**
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

**创建组件:**
```bash
# 将 ChatPDFPro.jsx 复制到 src/components/
mkdir src/components
cp ChatPDFPro.jsx src/components/
```

**修改 `src/App.js`:**
```jsx
import ChatPDFPro from './components/ChatPDFPro';

function App() {
  return <ChatPDFPro />;
}

export default App;
```

**启动前端:**
```bash
npm start
```

## 🔑 API配置指南

### OpenAI GPT

**获取API Key:**
- 访问: https://platform.openai.com/api-keys
- 创建API Key

**配置示例:**
```
提供商: openai
模型: gpt-5.1-2025-11-13 (最强) 或 gpt-4-turbo (经济)
API Key: sk-xxx...
```

**定价:**
- GPT-5.1: $0.20/$0.80 per 1K tokens
- GPT-5 Nano: $0.05/$0.40 per 1K tokens
- GPT-4 Turbo: $0.01/$0.03 per 1K tokens

### Anthropic Claude

**获取API Key:**
- 访问: https://console.anthropic.com/
- Settings → API Keys

**配置示例:**
```
提供商: anthropic
模型: claude-sonnet-4-5-20250929 (推荐)
API Key: sk-ant-xxx...
```

**定价:**
- Claude Sonnet 4.5: $3/$15 per 1M tokens
- Claude Haiku 4.5: $1/$5 per 1M tokens

### xAI Grok

**获取API Key:**
- 访问: https://console.x.ai/
- 创建API Key

**配置示例:**
```
提供商: grok
模型: grok-4.1 (多模态)
API Key: xai-xxx...
```

**定价:**
- Grok 4.1: $0.20/$0.50 per 1M tokens
- 工具调用免费至 2025-12-03

### 字节豆包

**获取API Key:**
- 访问: https://console.volcengine.com/ark
- 创建推理接入点

**配置示例:**
```
提供商: doubao
模型: doubao-1.5-pro-256k
API Key: 你的豆包API Key
端点: https://ark.cn-beijing.volces.com/api/v3
```

**定价:**
- Pro-32K: $0.11/$0.28 per 1M tokens
- Pro-256K: 更高容量

### 阿里通义千问 (Qwen)

**获取API Key:**
- 访问: https://dashscope.aliyun.com/
- 开通DashScope服务

**配置示例:**
```
提供商: qwen
模型: qwen-max-2025-01-25
API Key: sk-xxx...
```

**定价:**
- Qwen-Max: $0.10/$0.30 per 1M tokens
- 开源模型可本地部署

### MiniMax

**获取API Key:**
- 访问: https://platform.minimaxi.com/
- 创建API Key

**配置示例:**
```
提供商: minimax
模型: minimax-m2 或 abab6.5-chat
API Key: 你的MiniMax API Key
```

**定价:**
- MiniMax-M2: $0.15/$0.60 per 1M tokens

### 智谱GLM

**获取API Key:**
- 访问: https://open.bigmodel.cn/
- 创建API Key

**配置示例:**
```
提供商: glm
模型: glm-4.6 (355B MoE)
API Key: 你的GLM API Key
```

**定价:**
- GLM-4.5: $0.60/$2.20 per 1M tokens
- GLM-4.5-Air: $0.20/$1.10 per 1M tokens

### DeepSeek

**获取API Key:**
- 访问: https://platform.deepseek.com/
- 创建API Key

**配置示例:**
```
提供商: deepseek
模型: deepseek-v3.2-exp 或 deepseek-reasoner
API Key: sk-xxx...
```

**定价:**
- DeepSeek-V3.2: $0.28/$0.42 per 1M tokens
- 50%折扣至2025-09-05

### Moonshot Kimi

**获取API Key:**
- 访问: https://platform.moonshot.cn/
- 创建API Key

**配置示例:**
```
提供商: kimi
模型: kimi-k2-instruct-0905
API Key: sk-xxx...
```

**定价:**
- Kimi K2: $0.10/$0.30 per 1M tokens
- 支持256K上下文

### Google Gemini

**获取API Key:**
- 访问: https://makersuite.google.com/app/apikey
- 创建API Key

**配置示例:**
```
提供商: gemini
模型: gemini-2.5-pro
API Key: AIzaSy...
```

**定价:**
- Gemini 2.5 Pro: $0.35/$1.05 per 1M tokens
- Gemini 2.5 Flash: $0.15/$0.60 per 1M tokens

## 💡 使用技巧

### 1. PDF预览功能

**缩放控制:**
- 点击 `-` / `+` 按钮调整显示大小
- 支持 50% - 200% 缩放

**翻页导航:**
- 使用 `←` / `→` 箭头切换页面
- 显示当前页码和总页数

**文本选择:**
1. 在PDF内容中拖动鼠标选择文本
2. 弹出操作菜单
3. 选择"复制"或"AI解释"

### 2. AI对话技巧

**提问示例:**

📚 **学术论文:**
```
- 这篇论文的研究方法是什么？
- 实验结果是否支持作者的假设？
- 文中提到的局限性有哪些？
```

📊 **商业报告:**
```
- 本季度的核心财务指标是什么？
- 报告中指出了哪些市场风险？
- 未来增长策略的重点在哪里？
```

💻 **技术文档:**
```
- 如何配置这个功能？
- API接口的调用方式是什么？
- 有哪些最佳实践建议？
```

### 3. 选中文本提问

1. 在PDF中选中相关段落
2. 点击"AI解释"按钮
3. AI会基于选中内容回答

或者：
1. 选中文本
2. 在输入框输入具体问题
3. AI会结合选中内容和问题作答

### 4. 模型选择建议

**追求性能:**
- GPT-5.1 (最强，但贵)
- Claude Opus 4.1 (专业写作)
- Grok 4.1 (多模态)

**性价比:**
- Claude Sonnet 4.5 (推荐)
- GPT-4 Turbo
- Qwen-Max

**快速响应:**
- Claude Haiku 4.5
- GPT-5 Nano
- DeepSeek-Chat

**中文优化:**
- Qwen3-Max (阿里)
- GLM-4.6 (智谱)
- 豆包 1.5 Pro (字节)
- Kimi K2 (Moonshot)

**编程相关:**
- DeepSeek-Coder
- Qwen3-Coder-Plus
- GPT-4 Turbo

**长文档处理:**
- 豆包 1.5 Pro (256K)
- Kimi K2 (256K)
- Claude Sonnet 4.5 (200K)

## 🔧 高级配置

### 环境变量

创建 `.env` 文件：
```env
# 默认API配置（可选）
DEFAULT_PROVIDER=openai
DEFAULT_MODEL=gpt-4-turbo
DEFAULT_API_KEY=your-api-key

# 服务器配置
HOST=0.0.0.0
PORT=8000

# CORS
ALLOWED_ORIGINS=http://localhost:3000
```

### Docker部署

**后端 Dockerfile:**
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY chatpdf_pro_backend.py .
EXPOSE 8000
CMD ["uvicorn", "chatpdf_pro_backend:app", "--host", "0.0.0.0", "--port", "8000"]
```

**启动:**
```bash
docker build -t chatpdf-pro-backend .
docker run -p 8000:8000 chatpdf-pro-backend
```

## 📊 性能优化

### 1. 文档缓存

后端会自动缓存已上传的文档，避免重复处理。

### 2. 长文档处理

对于超长文档：
- 使用支持大上下文的模型（如豆包256K、Kimi 256K）
- 或者只传递相关页面的内容

### 3. API调用优化

- 使用较小的模型进行快速问答
- 复杂问题使用高级模型
- 合理设置 `max_tokens` 参数

## ❓ 常见问题

### Q: 如何处理扫描版PDF？

A: 当前版本只支持文本型PDF。扫描版需要集成OCR：
```bash
pip install pytesseract pdf2image
```

### Q: 支持的PDF大小限制？

A: 建议 < 20MB，可在后端调整：
```python
MAX_FILE_SIZE = 20 * 1024 * 1024  # 20MB
```

### Q: API调用失败怎么办？

检查清单：
1. API Key是否正确
2. 账户是否有余额
3. 模型名称是否准确
4. 网络连接是否正常

### Q: 如何切换不同的AI模型？

点击设置按钮，选择提供商和模型，输入对应的API Key即可。

### Q: 价格如何计算？

不同模型价格不同，参考上面的API配置指南。一般文档问答：
- 短文档(10页): ~$0.01-0.05
- 中等文档(50页): ~$0.05-0.20
- 长文档(200页): ~$0.20-0.80

## 🛡️ 安全建议

1. ⚠️ **不要硬编码API Key** - 使用环境变量或后端代理
2. 🔒 **HTTPS部署** - 生产环境必须使用HTTPS
3. 🚦 **请求限流** - 添加速率限制防止滥用
4. 📁 **文件验证** - 验证上传文件类型和大小
5. 🔐 **用户认证** - 生产环境添加登录系统

## 🎓 进阶功能

### 添加向量数据库

提升长文档检索准确性：
```bash
pip install chromadb sentence-transformers
```

### 添加OCR支持

处理扫描版PDF：
```bash
pip install pytesseract pdf2image
```

### 多文档对话

同时处理多个文档，实现跨文档问答。

### 文档翻译

集成翻译功能，支持多语言文档。

## 📈 路线图

- [ ] 支持Word、Excel、PPT等格式
- [ ] 添加文档标注功能
- [ ] 支持文档对比分析
- [ ] 添加语音输入/输出
- [ ] 移动端适配
- [ ] 协作功能
- [ ] 云端同步

## 🤝 贡献

欢迎提交Issue和Pull Request！

## 📄 许可证

MIT License

---

**享受AI驱动的文档阅读体验！** 🎉
