# AI 者华歌 - 市场经营户提示词库

## 项目定位
专为市场经营户、外贸从业者打造的垂直领域提示词工具箱，提供商务文本、图像生成、GEO 优化三大模块的实战模板。

## 模块划分

### 1. 生活工作区 (Business Templates)
**目标场景**：日常商务沟通与市场拓展
- 客户开发信 (Cold Email)
- 询盘回复 (Inquiry Response)
- 竞品调研 (Competitor Analysis)
- 目标国家介绍 (Country Profile)
- 合同条款 (Contract Terms)
- 营销文案 (Marketing Copy)

### 2. 图像生成区 (Image Generation)
**目标场景**：电商视觉素材快速生成
- 产品展示图 (Product Photography)
- 营销海报 (Promotional Posters)
- 包装设计 (Packaging Design)
- 社交媒体配图 (Social Media Graphics)
- 场景渲染图 (Scene Rendering)

### 3. GEO 优化区 (Generative Engine Optimization)
**目标场景**：提升品牌在 AI 搜索引擎中的可见度
- 品牌描述优化 (Brand Description)
- 关键词策略 (Keyword Strategy)
- 结构化数据模板 (Structured Data)
- 多语言适配 (Multilingual Adaptation)

## 技术栈
- **前端**：HTML5 + CSS3 + Vanilla JavaScript
- **数据格式**：JSON (存储在 `/data/` 目录)
- **部署平台**：Cloudflare Pages (Direct Upload)
- **核心特性**：零成本、纯前端、本地化处理、隐私安全

## 目录结构
```
ai-prompt-library/
├── index.html              # 主页面
├── css/
│   └── style.css          # 样式文件
├── js/
│   ├── main.js            # 核心交互逻辑
│   └── modules/           # 模块化功能
│       ├── business.js    # 生活工作区逻辑
│       ├── image.js       # 图像生成区逻辑
│       └── geo.js         # GEO 优化区逻辑
├── data/
│   ├── business.json      # 商务模板数据
│   ├── images.json        # 图像提示词数据
│   └── geo.json           # GEO 优化模板数据
├── assets/
│   └── images/            # 示例图片（可选）
└── README.md              # 项目说明
```

## 核心功能
1. **模板浏览**：分类展示所有提示词模板
2. **智能搜索**：支持关键词、标签、场景多维度筛选
3. **一键复制**：点击即可复制提示词到剪贴板
4. **个性化定制**：用户可基于模板修改并保存（本地存储）
5. **响应式设计**：适配桌面端和移动端

## 部署步骤
1. 完成本地开发测试
2. 登录 Cloudflare Dashboard → Pages → Create a project
3. 选择 "Direct upload" 模式
4. 上传整个项目文件夹
5. 绑定自定义域名（可选）

## 与通用提示词平台的差异化
- **垂直聚焦**：专注市场经营户场景，非通用型库
- **实战导向**：所有模板经过实际业务验证
- **教育属性**：每个模板附带使用说明和优化思路
- **零成本运营**：无 API 调用费用，完全免费开放

## 后续扩展计划
- 增加用户投稿功能（通过 Formspree 收集）
- 添加提示词效果评分系统
- 集成简单的 A/B 测试工具
- 提供 PDF 版本下载（常用模板合集）
