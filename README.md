# ChatPDF 2.0 - 治愈系AI文档助手

<div align="center">

![ChatPDF Logo](https://img.shields.io/badge/ChatPDF-2.0-blue?style=for-the-badge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Vite](https://img.shields.io/badge/Vite-6.0-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![React](https://img.shields.io/badge/React-18.3-61dafb?style=for-the-badge&logo=react)](https://reactjs.org)
[![Python](https://img.shields.io/badge/Python-3.10+-blue?style=for-the-badge&logo=python)](https://www.python.org)

**中文** | **[English](README_EN.md)**

**全新 ChatPDF 2.0**：治愈系蓝白UI，极速Vite驱动，支持本地模型免费运行！

[快速开始](#快速开始) • [新版特性](#-新版特性) • [技术栈](#-技术栈) • [文档](#-文档)

</div>

---

## ✨ 新版特性 (v2.0)

### 🎨 治愈系蓝白 UI
- **极致视觉体验**: 采用 `#F6F8FA` → `#E9F4FF` 极浅冷色渐变背景，搭配高饱和亮蓝按钮。
- **悬浮卡片布局**: 内容区采用大圆角悬浮玻璃卡片，配合流畅的漂浮动画。
- **强毛玻璃质感**: 深度优化的 Glassmorphism 效果，带来清爽的科技感。
- **深色模式**: 支持一键切换深色/浅色主题，夜间阅读更舒适。

### ⚡ 极速性能
- **Vite 6.0 驱动**: 启动速度提升 10 倍，热更新毫秒级响应。
- **React 18.3**: 采用最新并发特性，交互更丝滑。

### 🦙 本地模型支持 (免费!)
- **Ollama 集成**: 直接支持 **Llama 3**, **Mistral**, **Qwen** 等本地模型。
- **隐私安全**: 本地运行，数据不出本机，完全免费。

### 📸 AI视觉分析
- **智能截图**: 一键截取PDF页面或框选区域。
- **多模态分析**: 支持 GPT-4o, Claude 3.5 Sonnet, Gemini 1.5 Pro 等视觉模型。
- **图表理解**: 精准识别图表、公式、表格数据。

---

## 🚀 快速开始

### 方式一：一键启动 (推荐)

**Windows:**
```bash
start.bat
```

**Linux/Mac:**
```bash
chmod +x start.sh
./start.sh
```

### 方式二：手动启动

**1. 启动后端**
```bash
cd backend
pip install -r requirements.txt
python app.py
```
*后端运行在: http://localhost:8000*

**2. 启动前端**
```bash
cd frontend
npm install
npm run dev
```
*前端运行在: http://localhost:3000*

---

## 🔧 模型配置

### 1. 在线模型 (API Key)
支持所有主流 AI 提供商：
- **OpenAI**: GPT-4o, GPT-4 Turbo
- **Anthropic**: Claude 3.5 Sonnet, Claude 3 Opus
- **Google**: Gemini 1.5 Pro
- **DeepSeek**: DeepSeek Chat

### 2. 本地模型 (Ollama)
1. 下载并安装 [Ollama](https://ollama.com/)
2. 拉取模型: `ollama pull llama3`
3. 在 ChatPDF 设置中选择 **Provider: Local (Ollama)**

---

## 🛠 技术栈

### 前端 (v2.0)
- **构建工具**: Vite 6.0
- **框架**: React 18.3
- **样式**: Tailwind CSS 3.4 + Framer Motion (动画)
- **渲染**: React Markdown + KaTeX (数学公式) + Highlight.js (代码高亮)

### 后端
- **框架**: FastAPI 0.115+
- **AI编排**: LangChain 0.3
- **PDF处理**: PyPDF2 + pdfplumber
- **向量检索**: FAISS + Sentence Transformers

---

## 📄 许可证

本项目采用 [MIT许可证](LICENSE)

<div align="center">
Made with ❤️ by ChatPDF Team
</div>
