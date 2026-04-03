# 🚀 部署指南 - Cloudflare Pages Direct Upload

## 前置准备

1. **注册 Cloudflare 账号**（免费）
   - 访问 https://dash.cloudflare.com/sign-up
   - 使用邮箱注册并验证

2. **完成本地测试**
   ```bash
   # 在项目根目录打开终端
   # 方法 1: 使用 VS Code Live Server 插件
   # 方法 2: 使用 Python 简易服务器
   python -m http.server 8000
   
   # 浏览器访问 http://localhost:8000 测试功能
   ```

## 部署步骤

### 步骤 1: 登录 Cloudflare Dashboard
1. 访问 https://dash.cloudflare.com/
2. 登录你的账号

### 步骤 2: 创建 Pages 项目
1. 点击左侧菜单 **"Workers & Pages"**
2. 点击 **"Create application"**
3. 选择 **"Pages"** 标签
4. 点击 **"Upload assets"** (Direct upload 模式)

### 步骤 3: 配置项目
1. **Project name**: 输入项目名称（如 `ai-prompt-library`）
2. **Production branch**: 保持默认 `main`
3. 点击 **"Create project"**

### 步骤 4: 上传文件
1. 点击 **"Browse"** 或直接将整个项目文件夹拖拽到上传区域
2. **必须包含的文件结构**：
   ```
   ai-prompt-library/
   ├── index.html          ← 必须存在
   ├── css/
   │   └── style.css
   ├── js/
   │   └── main.js
   ├── data/
   │   ├── business.json
   │   ├── images.json
   │   └── geo.json
   └── README.md           ← 可选
   ```
3. 等待上传完成（通常几秒到几十秒）

### 步骤 5: 部署发布
1. 上传完成后，点击 **"Save and Deploy"**
2. 系统会自动构建并分配一个 `*.pages.dev` 域名
3. 点击预览链接查看网站

### 步骤 6: 绑定自定义域名（可选）
1. 在项目页面，进入 **"Custom domains"** 标签
2. 点击 **"Add custom domain"**
3. 输入你的域名（如 `prompt.huage.com`）
4. 按照提示配置 DNS 记录（CNAME 指向 `your-project.pages.dev`）

## 更新部署

当需要更新内容时：

1. **修改本地文件**
   - 编辑 JSON 数据文件添加新模板
   - 修改 HTML/CSS/JS 优化功能

2. **重新上传**
   - 回到 Cloudflare Pages 项目
   - 进入 **"Deployments"** 标签
   - 点击 **"New deployment"** → **"Upload assets"**
   - 重新上传整个文件夹（覆盖旧版本）
   - 系统自动发布新版本

3. **回滚版本**
   - 如果新版本有问题，可在 **"Deployments"** 中找到旧版本
   - 点击 **"Rollback to this version"** 一键回滚

## 故障排查

### 问题 1: 页面显示但无样式
- **原因**: CSS 文件路径错误或文件编码问题
- **解决**: 
  - 检查 `index.html` 中 `<link>` 标签路径是否正确
  - 确保 CSS 文件保存为 UTF-8 编码（带换行符）

### 问题 2: 数据加载失败
- **原因**: JSON 文件路径错误或格式错误
- **解决**:
  - 检查 `js/main.js` 中的 `dataFile` 路径配置
  - 使用 JSON 验证器检查 JSON 文件格式
  - 浏览器 F12 控制台查看详细错误信息

### 问题 3: 搜索功能无效
- **原因**: JavaScript 未正确加载
- **解决**:
  - 检查 `index.html` 底部 `<script src="js/main.js">` 是否存在
  - 查看浏览器控制台是否有 JS 错误

### 问题 4: 移动端显示异常
- **原因**: 响应式样式未生效
- **解决**:
  - 确认 CSS 文件中 `@media` 查询语法正确
  - 在 Chrome DevTools 中使用设备模拟器测试

## 性能优化建议

### 1. 图片资源（如有）
- 使用 WebP 格式替代 PNG/JPG
- 添加 `loading="lazy"` 属性延迟加载
- 压缩图片至合理大小（单张 < 200KB）

### 2. JSON 数据优化
- 定期清理无用模板
- 对大型 JSON 文件进行压缩（可使用 Gzip）
- 考虑分页加载（当模板超过 100 条时）

### 3. CDN 缓存
- Cloudflare 自动提供全球 CDN 加速
- 可在 **"Caching"** 设置中调整缓存策略
- 静态资源（CSS/JS/图片）可设置长期缓存

## 安全注意事项

✅ **本站优势**：纯前端运行，不收集用户数据，无需数据库

⚠️ **注意**：
- 不要在代码中硬编码任何 API Key
- 如需接入后端服务，使用 Cloudflare Workers 代理请求
- 定期检查依赖库的安全更新

## 成本说明

**Cloudflare Pages 免费版额度**：
- ✅ 无限次请求
- ✅ 每月 10 万次读取操作
- ✅ 每月 1GB 存储空间
- ✅ 全球 CDN 加速
- ✅ 自动 HTTPS 证书

对于提示词库这类静态网站，**完全够用且零成本**。

## 后续扩展方向

1. **用户投稿功能**
   - 集成 Formspree 表单收集用户提交的模板
   - 审核后手动添加到 JSON 数据文件

2. **访问统计**
   - 使用 Umami 或 Plausible（隐私友好的分析工具）
   - 避免使用 Google Analytics（合规成本高）

3. **离线 PWA 支持**
   - 添加 Service Worker 实现离线访问
   - 用户可将网站"安装"到桌面

4. **多语言切换**
   - 增加英文版 JSON 数据文件
   - 添加语言切换按钮

---

**祝你部署顺利！** 如有问题，可查看 Cloudflare 官方文档：https://developers.cloudflare.com/pages/
