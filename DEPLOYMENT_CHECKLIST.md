# 📋 AI 者华歌提示词库 - 部署检查清单

## ✅ 部署前检查清单

### 1. 文件完整性检查
- [ ] `index.html` 存在且包含完整 HTML 结构
- [ ] `css/style.css` 存在且样式正常
- [ ] `js/main.js` 存在且功能正常
- [ ] `data/business.json` 包含至少 5 个模板
- [ ] `data/images.json` 包含至少 5 个模板
- [ ] `data/geo.json` 包含至少 5 个模板
- [ ] `README.md` 包含品牌说明和部署指南
- [ ] `.gitignore` 已配置（排除 node_modules 等）

**快速检查命令**：
```bash
cd ai-prompt-library
ls -la
```

### 2. 本地测试
- [ ] 双击 `start.bat` 或手动用浏览器打开 `index.html`
- [ ] 三大模块导航切换正常（生活工作区、图像生成区、GEO 优化区）
- [ ] 搜索功能正常工作
- [ ] 筛选标签点击正常
- [ ] 弹窗显示模板详情正常
- [ ] 一键复制功能正常
- [ ] 移动端响应式布局正常（按 F12 切换到手机模式测试）

**测试要点**：
- 每个模块至少点击 2 个模板卡片
- 尝试搜索关键词（如"外贸"、"产品"）
- 检查控制台是否有 JavaScript 错误（F12 → Console）

### 3. Git 仓库初始化
- [ ] 已运行 `git init`
- [ ] 已配置 `user.name` 和 `user.email`
- [ ] 分支名称为 `main`
- [ ] 所有文件已 `git add .`
- [ ] 首次提交已完成：`git commit -m "✨ AI 者华歌提示词库初版完成"`

**验证命令**：
```bash
git status          # 应显示 "nothing to commit"
git branch          # 应显示 "* main"
git log --oneline   # 应看到至少 1 条提交记录
```

### 4. GitHub 远程仓库
- [ ] 已在 GitHub 创建新仓库（建议名：`ai-prompt-library`）
- [ ] 仓库设置为 **Public**（GitHub Pages 免费计划要求）
- [ ] 已复制 SSH 地址：`git@github.com:用户名/ai-prompt-library.git`
- [ ] 本地已添加远程仓库：`git remote add origin <SSH 地址>`
- [ ] 已成功推送：`git push -u origin main`

**验证命令**：
```bash
git remote -v       # 应显示 origin 的 SSH 地址
```

---

## 🚀 GitHub Pages 部署步骤

### Step 1: 推送到 GitHub
```bash
cd ai-prompt-library
git push origin main
```

### Step 2: 启用 GitHub Pages
1. 打开 GitHub 仓库页面
2. 点击顶部导航的 **Settings**（设置）
3. 左侧菜单找到 **Pages**
4. **Build and deployment** 部分：
   - Source: 选择 **Deploy from a branch**
   - Branch: 选择 **main**
   - Folder: 选择 **/** (root)
5. 点击 **Save**

### Step 3: 等待部署完成
- GitHub 会显示 "Building..." 状态
- 通常等待 1-2 分钟
- 刷新页面后，顶部会显示成功消息：
  > Your site is live at `https://你的用户名.github.io/ai-prompt-library/`

### Step 4: 访问网站
- 点击显示的链接或使用命令打开：
```bash
# macOS
open https://你的用户名.github.io/ai-prompt-library/

# Windows
start https://你的用户名.github.io/ai-prompt-library/
```

---

## 🌐 绑定自定义域名（可选）

### 目标域名：`prompt.from2045.com`

### Step 1: GitHub Pages 配置
1. 在 GitHub Pages 设置页面，找到 **Custom domain**
2. 输入：`prompt.from2045.com`
3. 点击 **Save**
4. 勾选 **Enforce HTTPS**（强制使用 HTTPS）

### Step 2: DNS 服务商配置
登录你的域名管理后台（如阿里云、腾讯云、Cloudflare），添加以下记录：

| 类型 | 主机记录 | 记录值 | TTL |
|------|----------|--------|-----|
| CNAME | prompt | 你的用户名.github.io | 自动 |

**示例（阿里云）**：
- 记录类型：CNAME
- 主机记录：prompt
- 记录值：sunqihan.github.io（假设你的 GitHub 用户名是 sunqihan）
- TTL：自动

### Step 3: 验证域名
- 等待 DNS 生效（通常 5-10 分钟，最长 24 小时）
- 在浏览器访问：`http://prompt.from2045.com`
- 应该能正常打开网站

**验证命令**：
```bash
ping prompt.from2045.com
# 应解析到 GitHub 的 IP 地址
```

---

## 🔧 常见问题排查

### 问题 1：Git 推送失败 - "no upstream branch"
**症状**：
```
fatal: The current branch main has no upstream branch.
```

**解决方案**：
```bash
git push -u origin main
```

---

### 问题 2：SSH 连接被代理软件劫持
**症状**：
```
ssh: connect to host github.com port 22: Connection reset by proxy
```

**原因**：Clash Verge 虚拟网卡模式劫持了 Git SSH 流量

**解决方案 A**：临时关闭 TUN 模式
1. 打开 Clash Verge
2. 关闭 **Tun Mode**（虚拟网卡）
3. 重新执行 `git push`

**解决方案 B**：配置 GitHub 域名直连
1. 打开 Clash Verge 规则配置
2. 添加以下规则：
   ```yaml
   - DOMAIN-SUFFIX,github.com,DIRECT
   - DOMAIN-SUFFIX,githubusercontent.com,DIRECT
   - DOMAIN-SUFFIX,githubassets.com,DIRECT
   ```

**解决方案 C**：使用 HTTPS 协议（不推荐，需每次输入密码）
```bash
git remote set-url origin https://github.com/用户名/ai-prompt-library.git
git push
```

---

### 问题 3：部署后样式丢失（CSS 不生效）
**症状**：网页能打开，但没有任何样式，纯文本显示

**可能原因**：
1. CSS 文件路径错误
2. 文件换行符丢失（被保存为单行）
3. MIME 类型配置错误

**解决方案**：
1. 检查 `index.html` 中的 CSS 引用：
   ```html
   <link rel="stylesheet" href="css/style.css">
   ```
2. 确认 `css/style.css` 文件存在且包含正确格式
3. 重新上传文件（确保保留换行符）
4. 清除浏览器缓存：`Ctrl + Shift + Delete`

---

### 问题 4：首次 SSH 连接卡住
**症状**：
```
The authenticity of host 'github.com (IP)' can't be established.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

**解决方案**：
1. 在终端输入 `yes` 并回车
2. 系统会保存 GitHub 的主机密钥
3. 后续操作不会再提示

**或者跳过确认**：
```bash
ssh -o StrictHostKeyChecking=no git@github.com
```

---

### 问题 5：GitHub Pages 显示 404
**症状**：访问网站显示 404 Not Found

**可能原因**：
1. GitHub Pages 未启用
2. 分支选择错误（不是 main）
3. 仓库是私有的（Free 计划不支持私有仓库的 Pages）

**解决方案**：
1. 检查 Settings → Pages 是否已配置
2. 确认 Branch 选择的是 **main**
3. 将仓库改为 Public：Settings → General → Danger Zone → Change visibility

---

### 问题 6：Git 用户身份未配置
**症状**：
```
*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
```

**解决方案**：
```bash
git config --global user.name "孙启涵"
git config --global user.email "你的 GitHub 注册邮箱"
```

---

## 📊 部署后验证

### 功能测试清单
访问部署后的网站，逐项测试：

- [ ] 页面加载正常，无 404 错误
- [ ] Logo 和标题显示："🎯 AI 者华歌"
- [ ] 副标题显示："市场经营户的 AI 实战工具箱"
- [ ] 三大模块导航可点击切换
- [ ] 生活工作区显示 5 个模板
- [ ] 图像生成区显示 5 个模板
- [ ] GEO 优化区显示 5 个模板
- [ ] 搜索框可以输入并搜索
- [ ] 筛选标签可以点击过滤
- [ ] 点击模板卡片弹出详情
- [ ] 弹窗中提示词内容完整显示
- [ ] "一键复制"按钮正常工作
- [ ] 页脚版权信息正确
- [ ] 移动端适配正常（F12 切换设备测试）

### 性能检查
- [ ] 首屏加载时间 < 2 秒
- [ ] 无 JavaScript 错误（F12 → Console）
- [ ] 无 404 资源请求（F12 → Network）

---

## 🎉 部署成功标志

当你看到以下内容时，表示部署完全成功：

✅ GitHub Pages 显示：
> Your site is live at `https://你的用户名.github.io/ai-prompt-library/`

✅ 访问网站显示：
- 标题栏："AI 者华歌 - 市场经营户提示词库"
- Logo："🎯 AI 者华歌"
- 三大模块正常切换
- 15 个模板全部可访问

✅ 自定义域名（如果配置）：
- `prompt.from2045.com` 可以正常访问
- HTTPS 证书有效

---

## 📞 需要帮助？

如果遇到以上未列出的问题：

1. 查看 GitHub Pages 官方文档：https://pages.github.com/
2. 检查项目 README.md 中的故障排查章节
3. 在 GitHub Issues 中提问（如果这是开源项目）

**祝部署顺利！** 🚀
