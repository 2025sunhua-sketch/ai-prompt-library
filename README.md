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
- **部署平台**：GitHub Pages（推荐）或 Cloudflare Pages
- **核心特性**：零成本、纯前端、本地化处理、隐私安全

## 非商业化声明
⚠️ **重要声明**：
- 本项目由"AI 者华歌"维护，完全免费开放
- 所有提示词模板仅供学习参考，不构成商业建议
- 纯前端运行，不收集任何用户数据
- 禁止将本项目的模板库用于商业售卖或付费课程
- 欢迎个人学习使用和商业场景应用，无需授权

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

### 方式一：GitHub Pages 部署（推荐）

#### 快速部署（使用 init-git.bat）
```bash
# Windows 用户直接运行
cd ai-prompt-library
init-git.bat

# 脚本会自动执行以下操作：
# 1. 初始化 Git 仓库
# 2. 配置 Git 用户信息（需要手动输入）
# 3. 创建 main 分支
# 4. 提交所有文件
# 5. 推送到 GitHub 远程仓库
```

#### 手动部署步骤
```bash
# 1. 进入项目目录
cd ai-prompt-library

# 2. 初始化 Git 仓库（如果还没有）
git init

# 3. 配置 Git 用户身份（必须）
git config --global user.name "你的 GitHub 用户名"
git config --global user.email "你的 GitHub 邮箱"

# 4. 添加所有文件并提交
git add .
git commit -m "✨ AI 者华歌提示词库初版完成"

# 5. 重命名分支为 main（GitHub 默认分支名）
git branch -M main

# 6. 添加远程仓库地址（替换为你的仓库 URL）
git remote add origin git@github.com:你的用户名/ai-prompt-library.git

# 7. 推送到 GitHub
git push -u origin main
```

#### 启用 GitHub Pages
1. 打开 GitHub 仓库页面
2. 点击 **Settings** → **Pages**
3. Source 选择：**Deploy from a branch**
4. Branch 选择：**main** / folder: **/** (root)
5. 点击 **Save**
6. 等待 1-2 分钟，页面会显示访问地址
   - 格式：`https://你的用户名.github.io/ai-prompt-library/`

#### 绑定自定义域名（可选）
1. 在 GitHub Pages 设置页面，点击 **Custom domain**
2. 输入你的域名：`prompt.from2045.com`
3. 点击 **Save**
4. 在 DNS 服务商处添加 CNAME 记录：
   ```
   类型：CNAME
   主机记录：prompt
   记录值：你的用户名.github.io
   TTL: 自动
   ```

### 方式二：Cloudflare Pages 部署

#### Direct Upload（无需 Git）
1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com)
2. 左侧菜单：**Workers & Pages** → **Create application**
3. 选择 **Pages** → **Direct upload**
4. 将整个 `ai-prompt-library/` 文件夹拖拽到上传区域
5. 点击 **Deploy**
6. 等待 10-30 秒即可上线

#### 绑定自定义域名
1. Pages 设置 → **Custom domains**
2. 添加域名：`prompt.from2045.com`
3. Cloudflare 会自动配置 DNS 记录

### 故障排查

#### 问题 1：Git 推送失败，报错 "no upstream branch"
**原因**：分支名称与远程不一致
**解决**：
```bash
git branch -M main
git push -u origin main
```

#### 问题 2：SSH 连接被代理软件劫持
**原因**：Clash Verge 虚拟网卡模式劫持 Git SSH 流量
**解决**：
- 方案 A：临时关闭 Clash 的 TUN 模式
- 方案 B：在 Clash 规则中添加 GitHub 域名直连 (DIRECT)

#### 问题 3：部署后样式丢失（CSS 不生效）
**原因**：HTML/CSS/JS 文件换行符丢失，被保存为单行
**解决**：
- 重新上传包含正确换行符的文件
- 检查文件编码是否为 UTF-8
- 清除浏览器缓存后重试

#### 问题 4：首次 SSH 连接卡住
**原因**：需要手动确认 GitHub 主机密钥
**解决**：
```bash
ssh -T git@github.com
# 当出现提示时，输入 yes 并回车
```

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
