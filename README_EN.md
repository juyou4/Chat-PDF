# ChatPDF 2.0 - Healing AI Document Assistant

<div align="center">

![ChatPDF Logo](https://img.shields.io/badge/ChatPDF-2.0-blue?style=for-the-badge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Vite](https://img.shields.io/badge/Vite-6.0-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vitejs.dev/)
[![React](https://img.shields.io/badge/React-18.3-61dafb?style=for-the-badge&logo=react)](https://reactjs.org)
[![Python](https://img.shields.io/badge/Python-3.10+-blue?style=for-the-badge&logo=python)](https://www.python.org)

**[中文](README.md)** | **English**

**The All-New ChatPDF 2.0**: Healing Blue UI, Blazing Fast Vite, and Free Local Model Support!

[Quick Start](#quick-start) • [New Features](#-new-features) • [Tech Stack](#-tech-stack) • [Docs](#-docs)

</div>

---

## ✨ New Features (v2.0)

### 🎨 Healing Blue UI
- **Visual Excellence**: Featuring a calming `#F6F8FA` → `#E9F4FF` gradient background with high-saturation blue accents.
- **Floating Glass Cards**: Content floats in beautiful glassmorphism cards with smooth animations.
- **Modern Aesthetics**: Deeply optimized UI for a refreshing, tech-savvy feel.
- **Dark Mode**: Toggle between Light and Dark themes for comfortable reading at night.

### ⚡ Blazing Performance
- **Powered by Vite 6.0**: 10x faster startup and millisecond-level HMR.
- **React 18.3**: Leveraging the latest concurrent features for silky smooth interactions.

### 🦙 Local Model Support (Free!)
- **Ollama Integration**: Native support for **Llama 3**, **Mistral**, **Qwen**, and more.
- **Privacy First**: Run AI locally on your machine. Your data never leaves your device.

### 📸 AI Vision Analysis
- **Smart Screenshot**: Capture full pages or select specific areas.
- **Multimodal Analysis**: Support for GPT-4o, Claude 3.5 Sonnet, Gemini 1.5 Pro.
- **Chart Understanding**: Accurately recognize charts, formulas, and table data.

---

## 🚀 Quick Start

### Option 1: One-Click Start (Recommended)

**Windows:**
```bash
start.bat
```

**Linux/Mac:**
```bash
chmod +x start.sh
./start.sh
```

### Option 2: Manual Start

**1. Start Backend**
```bash
cd backend
pip install -r requirements.txt
python app.py
```
*Backend runs at: http://localhost:8000*

**2. Start Frontend**
```bash
cd frontend
npm install
npm run dev
```
*Frontend runs at: http://localhost:3000*

---

## 🔧 Model Configuration

### 1. Online Models (API Key)
Supports all major AI providers:
- **OpenAI**: GPT-4o, GPT-4 Turbo
- **Anthropic**: Claude 3.5 Sonnet, Claude 3 Opus
- **Google**: Gemini 1.5 Pro
- **DeepSeek**: DeepSeek Chat

### 2. Local Models (Ollama)
1. Download and install [Ollama](https://ollama.com/)
2. Pull a model: `ollama pull llama3`
3. Select **Provider: Local (Ollama)** in ChatPDF Settings.

---

## 🛠 Tech Stack

### Frontend (v2.0)
- **Build Tool**: Vite 6.0
- **Framework**: React 18.3
- **Styling**: Tailwind CSS 3.4 + Framer Motion (Animations)
- **Rendering**: React Markdown + KaTeX (Math) + Highlight.js (Code)

### Backend
- **Framework**: FastAPI 0.115+
- **AI Orchestration**: LangChain 0.3
- **PDF Processing**: PyPDF2 + pdfplumber
- **Vector Search**: FAISS + Sentence Transformers

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

<div align="center">
Made with ❤️ by ChatPDF Team
</div>
