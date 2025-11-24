# AI模型配置速查表

## 🚀 一键配置指南

### 1️⃣ OpenAI GPT

**官网:** https://platform.openai.com/  
**API文档:** https://platform.openai.com/docs/api-reference

**获取步骤:**
1. 访问 https://platform.openai.com/api-keys
2. 登录账号（需要国外手机号验证）
3. 点击 "Create new secret key"
4. 复制保存API Key（格式：sk-...）

**界面配置:**
```
提供商: openai
模型选择:
  - gpt-5.1-2025-11-13 (最强，$0.20/$0.80)
  - gpt-4-turbo (推荐，$0.01/$0.03)
  - gpt-3.5-turbo (经济，$0.0005/$0.0015)
API Key: sk-proj-xxxxx...
```

**测试命令:**
```bash
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer YOUR_API_KEY"
```

---

### 2️⃣ Anthropic Claude

**官网:** https://www.anthropic.com/  
**API文档:** https://docs.anthropic.com/

**获取步骤:**
1. 访问 https://console.anthropic.com/
2. 注册账号
3. Settings → API Keys
4. Create Key

**界面配置:**
```
提供商: anthropic
模型选择:
  - claude-sonnet-4-5-20250929 (推荐，$3/$15)
  - claude-opus-4-1-20250805 (高级，更贵)
  - claude-haiku-4-5-20250219 (快速，$1/$5)
API Key: sk-ant-xxxxx...
```

**优势:**
- 长上下文处理能力强（200K-1M）
- 编程和分析能力优秀
- 安全性和可控性好

---

### 3️⃣ xAI Grok

**官网:** https://x.ai/  
**API文档:** https://docs.x.ai/

**获取步骤:**
1. 访问 https://console.x.ai/
2. 注册账号
3. 创建API Key

**界面配置:**
```
提供商: grok
模型选择:
  - grok-4.1 (多模态，$0.20/$0.50)
  - grok-4.1-fast (快速版本)
API Key: xai-xxxxx...
```

**特色:**
- 实时搜索集成
- 多模态支持
- 工具调用免费（至2025-12-03）

---

### 4️⃣ 字节豆包 (Doubao)

**官网:** https://www.volcengine.com/product/doubao  
**控制台:** https://console.volcengine.com/ark

**获取步骤:**
1. 访问火山引擎控制台
2. 开通豆包服务
3. 创建推理接入点
4. 获取API Key

**界面配置:**
```
提供商: doubao
模型选择:
  - doubao-1.5-pro-256k (超长上下文)
  - doubao-1.5-pro-32k (标准版，$0.11/$0.28)
API Key: 你的豆包API Key
```

**优势:**
- 超长上下文（256K）
- 中文优化
- 支持深度思考模式
- 价格实惠

---

### 5️⃣ 阿里通义千问 (Qwen)

**官网:** https://tongyi.aliyun.com/  
**控制台:** https://dashscope.aliyun.com/

**获取步骤:**
1. 访问DashScope控制台
2. 开通服务（需要阿里云账号）
3. API Keys → 创建新Key

**界面配置:**
```
提供商: qwen
模型选择:
  - qwen-max-2025-01-25 (最强，$0.10/$0.30)
  - qwen3-235b-a22b-instruct-2507 (开源)
  - qwen3-coder-plus-2025-09-23 (编程)
API Key: sk-xxxxx...
```

**优势:**
- 开源模型可本地部署
- 中文能力强
- 编程专用版本
- 支持混合思考模式

---

### 6️⃣ MiniMax

**官网:** https://www.minimaxi.com/  
**控制台:** https://platform.minimaxi.com/

**获取步骤:**
1. 访问MiniMax平台
2. 注册账号
3. 创建API Key

**界面配置:**
```
提供商: minimax
模型选择:
  - minimax-m2 (最新，$0.15/$0.60)
  - abab6.5-chat (经典版本)
API Key: 你的MiniMax API Key
```

**特色:**
- MoE架构
- 支持图像/视频生成
- TTS语音合成

---

### 7️⃣ 智谱GLM

**官网:** https://www.zhipuai.cn/  
**控制台:** https://open.bigmodel.cn/

**获取步骤:**
1. 访问智谱AI开放平台
2. 注册并实名认证
3. 创建API Key

**界面配置:**
```
提供商: glm
模型选择:
  - glm-4.6 (355B MoE，$0.60/$2.20)
  - glm-4.5 (标准版)
  - glm-4.5-air (快速版，$0.20/$1.10)
API Key: 你的GLM API Key
```

**优势:**
- 超大规模MoE模型（355B）
- 长上下文支持（200K）
- 工具调用能力强

---

### 8️⃣ DeepSeek

**官网:** https://www.deepseek.com/  
**控制台:** https://platform.deepseek.com/

**获取步骤:**
1. 访问DeepSeek平台
2. 注册账号
3. 创建API Key

**界面配置:**
```
提供商: deepseek
模型选择:
  - deepseek-v3.2-exp (最新，$0.28/$0.42)
  - deepseek-reasoner (推理模型，DeepSeek-R1)
  - deepseek-chat (对话模型)
API Key: sk-xxxxx...
```

**优势:**
- 强大的推理能力（R1模型）
- 编程和数学能力优秀
- 价格实惠
- 50%折扣至2025-09-05

---

### 9️⃣ Moonshot Kimi

**官网:** https://www.moonshot.cn/  
**控制台:** https://platform.moonshot.cn/

**获取步骤:**
1. 访问Moonshot AI平台
2. 注册账号
3. 创建API Key

**界面配置:**
```
提供商: kimi
模型选择:
  - kimi-k2-instruct-0905 (推荐，$0.10/$0.30)
  - kimi-k2-thinking (思考模式)
API Key: sk-xxxxx...
```

**优势:**
- 1T参数MoE架构
- 超长上下文（256K）
- 中文优化
- 代理能力强

---

### 🔟 Google Gemini

**官网:** https://ai.google.dev/  
**控制台:** https://makersuite.google.com/app/apikey

**获取步骤:**
1. 访问Google AI Studio
2. 登录Google账号
3. Get API Key
4. Create API Key

**界面配置:**
```
提供商: gemini
模型选择:
  - gemini-2.5-pro (最强，$0.35/$1.05)
  - gemini-2.5-flash-preview-09-2025 (快速)
  - gemini-2.0-flash (实时)
API Key: AIzaSy...
```

**优势:**
- 超长上下文（1M+）
- 多模态支持全面
- 低延迟
- 免费额度较高

---

## 📊 快速对比表

| 提供商 | 推荐模型 | 价格 (输入/输出) | 上下文 | 特点 |
|--------|---------|-----------------|--------|------|
| OpenAI | GPT-4 Turbo | $0.01/$0.03 | 128K | 综合最强 |
| Anthropic | Claude Sonnet 4.5 | $3/$15 | 200K | 编码/分析 |
| xAI | Grok 4.1 | $0.20/$0.50 | 128K | 多模态 |
| 豆包 | Doubao 1.5 Pro | $0.11/$0.28 | 256K | 超长上下文 |
| 通义 | Qwen-Max | $0.10/$0.30 | 128K | 中文优化 |
| MiniMax | MiniMax-M2 | $0.15/$0.60 | 200K | MoE架构 |
| 智谱 | GLM-4.6 | $0.60/$2.20 | 200K | 355B参数 |
| DeepSeek | DeepSeek-V3.2 | $0.28/$0.42 | 128K | 推理/编程 |
| Kimi | Kimi K2 | $0.10/$0.30 | 256K | 代理能力 |
| Gemini | Gemini 2.5 Flash | $0.15/$0.60 | 1M | 多模态 |

*价格单位：美元/百万token*

---

## 💡 选型建议

### 按用途选择

**📚 学术研究:**
- Claude Sonnet 4.5 (分析能力强)
- GPT-4 Turbo (综合能力)
- Gemini 2.5 Pro (长文档)

**💻 编程开发:**
- DeepSeek-Coder
- Qwen3-Coder-Plus
- Claude Sonnet 4.5

**📊 商业分析:**
- Claude Opus 4.1
- GPT-5.1
- GLM-4.6

**🌏 中文场景:**
- Qwen-Max (阿里)
- GLM-4.6 (智谱)
- Doubao 1.5 Pro (字节)
- Kimi K2 (Moonshot)

**💰 预算有限:**
- DeepSeek-Chat (便宜)
- GPT-3.5 Turbo
- Claude Haiku 4.5
- GLM-4.5-Air

**📄 超长文档:**
- Gemini 2.5 Pro (1M)
- Doubao 1.5 Pro (256K)
- Kimi K2 (256K)

---

## 🔧 配置问题排查

### 问题1: API Key无效

**检查步骤:**
1. 确认API Key格式正确
2. 检查是否有余额
3. 验证提供商选择正确
4. 确认模型名称准确

### 问题2: 网络连接失败

**解决方案:**
- 检查网络连接
- 某些API需要特殊网络环境
- 尝试使用代理

### 问题3: 模型不可用

**可能原因:**
- 账户权限不足
- 模型未开通
- 区域限制

### 问题4: 余额不足

**充值地址:**
- OpenAI: https://platform.openai.com/account/billing
- Anthropic: https://console.anthropic.com/settings/billing
- 其他平台查看对应控制台

---

## 📞 技术支持

各平台官方文档：
- OpenAI: https://platform.openai.com/docs
- Anthropic: https://docs.anthropic.com/
- Grok: https://docs.x.ai/
- 豆包: https://www.volcengine.com/docs/82379
- 通义: https://help.aliyun.com/zh/dashscope/
- MiniMax: https://platform.minimaxi.com/document
- 智谱: https://open.bigmodel.cn/dev/api
- DeepSeek: https://platform.deepseek.com/docs
- Kimi: https://platform.moonshot.cn/docs
- Gemini: https://ai.google.dev/docs

---

**祝配置顺利！** 🎉
