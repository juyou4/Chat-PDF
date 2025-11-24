# 📸 截图功能快速部署清单

## ✅ 部署检查清单

### 🔧 准备工作
- [ ] Python 3.8+ 已安装
- [ ] Node.js 16+ 已安装
- [ ] 有至少一个支持视觉的AI模型API Key
  - [ ] OpenAI gpt-4o
  - [ ] Anthropic claude-sonnet-4-5
  - [ ] Google gemini-2.5-pro
  - [ ] xAI grok-4.1

---

### 🐍 后端部署 (5分钟)

**步骤1: 安装依赖**
```bash
pip install fastapi uvicorn python-multipart PyPDF2 httpx pydantic
```
- [ ] 安装成功，无报错

**步骤2: 启动后端**
```bash
python chatpdf_vision_backend.py
```
- [ ] 看到 "Application startup complete"
- [ ] 访问 http://localhost:8000/health 返回正常
- [ ] 返回包含 "vision_providers" 字段

**测试后端：**
```bash
curl http://localhost:8000/health
```
预期输出：
```json
{
  "status": "ok",
  "message": "ChatPDF Pro with Vision API is running",
  "supported_providers": [...],
  "vision_providers": ["openai", "anthropic", "gemini", "grok"]
}
```
- [ ] 测试通过

---

### ⚛️ 前端部署 (10分钟)

**步骤1: 创建项目**
```bash
npx create-react-app chatpdf-screenshot
cd chatpdf-screenshot
```
- [ ] 项目创建成功

**步骤2: 安装依赖** （重要！）
```bash
npm install lucide-react html2canvas
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
```
- [ ] lucide-react 安装成功
- [ ] **html2canvas 安装成功** ⭐ 必须
- [ ] Tailwind CSS 安装成功

**验证html2canvas安装：**
```bash
npm list html2canvas
```
- [ ] 显示 `html2canvas@1.4.1` 或更高版本

**步骤3: 配置Tailwind**

修改 `tailwind.config.js`:
```javascript
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: { extend: {} },
  plugins: [],
}
```
- [ ] 文件修改完成

修改 `src/index.css`:
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```
- [ ] 文件修改完成

**步骤4: 复制组件**
```bash
mkdir src/components
# 将 ChatPDFWithScreenshot.jsx 复制到 src/components/
```
- [ ] 文件复制完成
- [ ] 文件路径正确：`src/components/ChatPDFWithScreenshot.jsx`

**步骤5: 修改App.js**

修改 `src/App.js`:
```jsx
import ChatPDFWithScreenshot from './components/ChatPDFWithScreenshot';

function App() {
  return <ChatPDFWithScreenshot />;
}

export default App;
```
- [ ] 文件修改完成

**步骤6: 启动前端**
```bash
npm start
```
- [ ] 浏览器自动打开 http://localhost:3000
- [ ] 页面正常显示
- [ ] 看到 "ChatPDF Pro" 标题和 "📸 截图版" 标签
- [ ] 无控制台错误

---

### ⚙️ API配置 (2分钟)

**步骤1: 打开设置**
- [ ] 点击右上角 ⚙️ 按钮
- [ ] 设置面板展开

**步骤2: 选择提供商和模型**
- [ ] 选择API提供商（如：openai）
- [ ] 选择支持视觉的模型（标有📸）
- [ ] 输入API Key
- [ ] 设置自动保存

**验证配置：**
- [ ] 刷新页面后配置依然存在
- [ ] 在浏览器开发者工具 → Application → Local Storage 中能看到保存的配置

---

### 🧪 功能测试

**测试1: 上传PDF**
- [ ] 点击"选择 PDF 文件"
- [ ] 选择一个包含图表的PDF
- [ ] 上传成功，显示文档信息
- [ ] 左侧显示PDF内容

**测试2: 整页截图**
- [ ] 点击左上角 "📷 整页" 按钮
- [ ] 等待1-2秒
- [ ] 弹出 "✅ 整页截图成功" 提示
- [ ] 右侧输入框上方显示截图预览
- [ ] 输入框提示变为 "询问关于截图的问题..."

**测试3: AI分析截图**
```
输入问题："这个页面显示了什么内容？"
```
- [ ] 点击发送
- [ ] AI开始回复（显示加载动画）
- [ ] 收到详细的分析结果
- [ ] 截图自动清除

**测试4: 区域截图**
- [ ] 点击 "✂️ 区域" 按钮
- [ ] 看到黄色提示条
- [ ] 拖动鼠标框选区域
- [ ] 释放鼠标完成截图
- [ ] 弹出 "✅ 区域截图成功" 提示
- [ ] 右侧显示截图预览

**测试5: 文本选择**
- [ ] 在PDF中选择一段文本
- [ ] 弹出 [复制] [AI解释] 菜单
- [ ] 点击 "AI解释" 正常工作

---

### 🐛 故障排查

**问题1: 截图按钮点击无反应**

检查：
```bash
# 确认 html2canvas 已安装
npm list html2canvas
```
- [ ] 如果未安装，执行：`npm install html2canvas`
- [ ] 重启开发服务器：`npm start`

**问题2: 截图失败报错**

打开浏览器开发者工具 (F12) → Console
- [ ] 检查是否有 html2canvas 相关错误
- [ ] 检查是否有 CORS 错误
- [ ] 检查是否有内存不足警告

解决方案：
- [ ] 刷新页面重试
- [ ] 缩小PDF缩放比例
- [ ] 使用区域截图代替整页截图

**问题3: AI不支持视觉**

错误提示：`模型 xxx 不支持图片输入`

解决方案：
- [ ] 打开设置
- [ ] 切换到标有 📸 的模型
- [ ] 重新发送

**问题4: API调用失败**

检查：
- [ ] API Key是否正确
- [ ] 账户是否有余额
- [ ] 网络连接是否正常
- [ ] 后端是否正常运行

---

### 📊 性能验证

**响应时间测试：**
- [ ] 整页截图 < 3秒
- [ ] 区域截图 < 2秒
- [ ] AI分析 < 15秒（取决于网络和模型）

**质量测试：**
- [ ] 截图清晰可辨
- [ ] AI能正确识别文字
- [ ] AI能理解图表含义
- [ ] AI能提取表格数据

---

## 🎯 完成标准

### 基础功能 (必须)
- [x] 后端正常运行
- [x] 前端正常显示
- [x] 能上传PDF文档
- [x] 能进行整页截图
- [x] 能进行区域截图
- [x] AI能分析截图内容

### 高级功能 (可选)
- [ ] 多个AI模型都能正常使用
- [ ] 截图质量令人满意
- [ ] 响应速度达到预期
- [ ] 成本在可接受范围内

---

## 💡 使用建议

### 首次使用流程

**第一步：熟悉界面** (5分钟)
1. 上传一个测试PDF
2. 尝试翻页和缩放
3. 尝试选择文本
4. 了解各个按钮的位置

**第二步：测试截图** (5分钟)
1. 先做一次整页截图
2. 再做一次区域截图
3. 观察截图预览
4. 熟悉清除截图的方法

**第三步：AI分析** (10分钟)
1. 从简单问题开始："这是什么？"
2. 尝试具体问题："提取表格数据"
3. 尝试复杂问题："分析趋势并给出建议"
4. 对比不同模型的效果

**第四步：实际应用** (后续)
1. 用于工作文档分析
2. 总结最佳实践
3. 优化提问方式
4. 控制成本

---

## 📈 成功案例

### 案例1：财报分析
```
场景：分析公司Q3财报中的表格
操作：区域截图 → "提取所有数据并计算增长率"
结果：完整数据表格 + 增长率分析
时间：< 10秒
成本：~$0.03
```

### 案例2：论文图表
```
场景：理解研究论文中的实验结果图
操作：整页截图 → "解释这个图表的含义和结论"
结果：详细的实验结果解读
时间：< 15秒
成本：~$0.05
```

### 案例3：技术文档
```
场景：理解系统架构图
操作：区域截图 → "分析架构的优缺点"
结果：架构分析 + 改进建议
时间：< 12秒
成本：~$0.04
```

---

## 🎉 部署完成！

如果上述所有检查项都✅，恭喜你！截图功能已成功部署。

**下一步：**
- 📖 阅读 [SCREENSHOT_GUIDE.md](./SCREENSHOT_GUIDE.md) 了解详细用法
- 🎯 开始实际使用，体验AI视觉分析
- 💡 总结最佳实践，优化工作流程
- 🚀 探索更多应用场景

**需要帮助？**
- 查看 SCREENSHOT_GUIDE.md 的常见问题部分
- 检查浏览器控制台错误
- 查看后端运行日志
- 确认所有依赖都已正确安装

---

**祝使用愉快！** 📸✨🎉
