#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${BLUE}========================================"
echo "   ChatPDF - 一键启动（完整版）"
echo -e "========================================${NC}"
echo ""
echo "包含所有功能："
echo -e "  ${GREEN}✅${NC} PDF文本对话"
echo -e "  ${GREEN}✅${NC} 向量检索"
echo -e "  ${GREEN}✅${NC} 流式响应"
echo -e "  ${GREEN}✅${NC} 表格提取"
echo -e "  ${PURPLE}✅ 📸 整页截图${NC}"
echo -e "  ${PURPLE}✅ 📸 区域截图${NC}"
echo -e "  ${PURPLE}✅ 📸 AI视觉分析${NC}"
echo ""

# 检查环境
echo "检查环境..."
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ 未找到Python3${NC}"
    echo "安装方法:"
    echo "  Ubuntu/Debian: sudo apt-get install python3 python3-pip python3-venv"
    echo "  macOS: brew install python3"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ 未找到Node.js${NC}"
    echo "安装方法:"
    echo "  Ubuntu/Debian: curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs"
    echo "  macOS: brew install node"
    exit 1
fi

echo -e "${GREEN}✅ 环境检查通过${NC}"
echo ""

# 启动后端
echo -e "${BLUE}========================================${NC}"
echo -e "${YELLOW}🚀 启动后端服务...${NC}"
echo -e "${BLUE}========================================${NC}"
cd backend

if [ ! -d "venv" ]; then
    echo -e "${YELLOW}📦 首次运行，创建虚拟环境...${NC}"
    python3 -m venv venv
fi

source venv/bin/activate

echo -e "${YELLOW}📥 安装/更新依赖...${NC}"
pip install -r requirements.txt > /dev/null 2>&1

echo -e "${GREEN}✨ 启动后端...${NC}"
nohup python app.py > ../backend.log 2>&1 &
BACKEND_PID=$!
echo $BACKEND_PID > ../backend.pid

cd ..
sleep 3

# 启动前端
echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${YELLOW}🎨 启动前端服务...${NC}"
echo -e "${BLUE}========================================${NC}"
cd frontend

if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}📦 首次运行，安装依赖（需要几分钟）...${NC}"
    npm install
fi

# 确保html2canvas已安装
if ! npm list html2canvas > /dev/null 2>&1; then
    echo -e "${YELLOW}📥 安装截图功能依赖...${NC}"
    npm install html2canvas
fi

# 配置使用完整版组件
echo "配置前端..."
cat > src/App.js << 'EOF'
import React from 'react';
import ChatPDF from './components/ChatPDF';
import './index.css';

function App() {
  return (
    <div className="App">
      <ChatPDF />
    </div>
  );
}

export default App;
EOF

echo -e "${GREEN}✨ 启动前端...${NC}"
nohup npm start > ../frontend.log 2>&1 &
FRONTEND_PID=$!
echo $FRONTEND_PID > ../frontend.pid

cd ..

# 等待服务启动
sleep 3

echo ""
echo -e "${GREEN}========================================"
echo "✅ ChatPDF 启动成功！"
echo -e "========================================${NC}"
echo ""
echo -e "🌐 后端API:  ${BLUE}http://localhost:8000${NC}"
echo -e "📚 API文档:  ${BLUE}http://localhost:8000/docs${NC}"
echo -e "🎨 前端界面: ${BLUE}http://localhost:3000${NC}"
echo ""
echo -e "${YELLOW}💡 提示:${NC}"
echo "   - 前端会自动在浏览器中打开"
echo "   - 首次运行请在设置中配置API Key"
echo "   - 截图功能需选择支持视觉的模型（标有📸）"
echo "   - 查看日志: tail -f backend.log 或 tail -f frontend.log"
echo ""
echo -e "${GREEN}停止服务请运行: ./stop.sh${NC}"
echo ""

# 尝试打开浏览器
sleep 3
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:3000 2>/dev/null
elif command -v open &> /dev/null; then
    open http://localhost:3000 2>/dev/null
fi
