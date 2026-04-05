# 🚀 AI 者华歌提示词库 - 30 分钟快速上线指南

**目标**：从零开始到网站上线，仅需 30 分钟  
**适用人群**：Git 初学者、首次部署 GitHub Pages  
**前置条件**：已安装 Git、有 GitHub 账号

---

## ⏱️ 时间分配

| 步骤 | 内容 | 预计时间 |
|------|------|----------|
| Step 1 | 创建 GitHub 仓库 | 3 分钟 |
| Step 2 | 运行初始化脚本 | 5 分钟 |
| Step 3 | 推送代码到 GitHub | 5 分钟 |
| Step 4 | 配置 GitHub Pages | 3 分钟 |
| Step 5 | 等待部署并测试 | 10 分钟 |
| Step 6 | （可选）绑定自定义域名 | 4 分钟 |
| **总计** | | **30 分钟** |

---

## Step 1: 创建 GitHub 仓库（3 分钟）

### 1.1 登录 GitHub
访问：https://github.com  
登录你的账号

### 1.2 创建新仓库
1. 点击右上角 **+** → **New repository**
2. 填写仓库信息：
   - **Repository name**: `ai-prompt-library`
   - **Description**: "AI 者华歌 - 市场经营户提示词库"
   - **Public/Private**: 选择 **Public**（必须公开才能使用免费 Pages）
   - **Initialize this repository with**: ❌ 不要勾选任何选项
3. 点击 **Create repository**

### 1.3 复制 SSH 地址
在创建的页面找到并复制：
```
git@github.com:你的用户名/ai-prompt-library.git
```

**✅ 完成标志**：看到空白仓库页面，显示 "Quick setup"

---

## Step 2: 运行初始化脚本（5 分钟）

### 2.1 打开项目目录
```bash
cd C:\Users\ADMIN\.real\users\user-adad75c782b748d067dcac88616ce763\workspace\ai-prompt-library
```

或者直接双击文件夹进入。

### 2.2 运行初始化脚本
双击运行：`init-git.bat`

脚本会提示你输入：
```
请输入你的 Git 用户名（GitHub 账号名）: [输入你的 GitHub 用户名]
请输入你的 Git 邮箱：[输入你的 GitHub 注册邮箱]
```

### 2.3 选择连接方式
```
请选择连接方式:
1. HTTPS（需要每次输入 Token）
2. SSH（推荐，需要先配置 SSH 密钥）

请输入选择 (1 或 2，默认 1): [输入 2 选择 SSH]
```

然后输入你在 Step 1.3 复制的 SSH 地址：
```
请输入 SSH 仓库地址 (格式：git@github.com:用户名/仓库名.git): 
git@github.com:你的用户名/ai-prompt-library.git
```

### 2.4 确认推送
```
是否立即推送到 GitHub？(y/n，默认 n): y
```

**✅ 完成标志**：看到 "🎉 推送成功！" 提示

---

## Step 3: 推送代码到 GitHub（5 分钟）

如果 Step 2 已经自动推送，跳过此步。

如果需要手动推送：
```bash
cd ai-prompt-library
git push -u origin main
```

### 常见问题处理

#### 问题 A：SSH 密钥未配置
**症状**：
```
Permission denied (publickey).
```

**解决**：
1. 生成 SSH 密钥（如果还没有）：
   ```bash
   ssh-keygen -t ed25519 -C "你的邮箱@example.com"
   ```
   一路回车即可

2. 查看公钥内容：
   ```bash
   cat ~/.ssh/id_ed25519.pub
   # Windows PowerShell:
   Get-Content $env:USERPROFILE/.ssh/id_ed25519.pub
   ```

3. 复制公钥内容（从 `ssh-ed25519` 开头到邮箱结束）

4. 添加到 GitHub：
   - 访问：https://github.com/settings/keys
   - 点击 **New SSH key**
   - Title: 随意填写（如 "My Laptop"）
   - Key: 粘贴刚才复制的公钥
   - 点击 **Add SSH key**

5. 重新执行 `git push -u origin main`

#### 问题 B：HTTPS 方式需要 Token
如果你选择了 HTTPS 连接，需要使用 Personal Access Token：

1. 生成 Token：
   - 访问：https://github.com/settings/tokens
   - 点击 **Generate new token (classic)**
   - 勾选 `repo` 和 `workflow` 权限
   - 点击 **Generate token**
   - **立即复制 Token**（只显示一次！）

2. 推送时输入：
   - Username: 你的 GitHub 用户名
   - Password: 刚才复制的 Token（不是账号密码！）

**✅ 完成标志**：看到类似输出：
```
Enumerating objects: 15, done.
Counting objects: 100% (15/15), done.
To github.com:你的用户名/ai-prompt-library.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

---

## Step 4: 配置 GitHub Pages（3 分钟）

### 4.1 进入 Pages 设置
1. 打开你的仓库页面：https://github.com/你的用户名/ai-prompt-library
2. 点击顶部导航的 **Settings**
3. 左侧菜单找到 **Pages**

### 4.2 配置部署源
在 **Build and deployment** 部分：
- **Source**: 选择 **Deploy from a branch**
- **Branch**: 选择 **main**
- **Folder**: 选择 **/** (root)
- 点击 **Save**

### 4.3 查看部署状态
保存后，页面顶部会显示：
> Building your site…

**✅ 完成标志**：看到 "Building..." 状态

---

## Step 5: 等待部署并测试（10 分钟）

### 5.1 等待 GitHub 构建
- GitHub Actions 会自动运行
- 通常 1-3 分钟完成
- 刷新页面查看状态

### 5.2 获取网站地址
部署成功后，页面会显示：
> Your site is live at `https://你的用户名.github.io/ai-prompt-library/`

### 5.3 访问并测试网站
点击链接或用浏览器打开：
```
https://你的用户名.github.io/ai-prompt-library/
```

**测试清单**：
- [ ] 页面标题显示："AI 者华歌 - 市场经营户提示词库"
- [ ] Logo 显示："🎯 AI 者华歌"
- [ ] 三大模块导航可点击
- [ ] 生活工作区显示 5 个模板
- [ ] 图像生成区显示 5 个模板
- [ ] GEO 优化区显示 5 个模板
- [ ] 搜索功能正常
- [ ] 点击模板卡片弹出详情
- [ ] 一键复制功能可用

### 5.4 排查问题
如果看到 404 错误：
1. 检查 Pages 配置是否正确（Branch=main, Folder=/）
2. 确认仓库是 Public（Settings → General → Danger Zone）
3. 清除浏览器缓存（Ctrl + Shift + Delete）

**✅ 完成标志**：网站正常显示，所有功能可用

---

## Step 6: 绑定自定义域名（可选，4 分钟）

### 6.1 GitHub Pages 配置
1. 在 GitHub Pages 设置页面
2. 找到 **Custom domain**
3. 输入：`prompt.from2045.com`
4. 点击 **Save**
5. 勾选 **Enforce HTTPS**

### 6.2 DNS 服务商配置
登录你的域名管理后台（阿里云/腾讯云/Cloudflare），添加 CNAME 记录：

| 字段 | 值 |
|------|-----|
| 记录类型 | CNAME |
| 主机记录 | prompt |
| 记录值 | 你的用户名.github.io |
| TTL | 自动 |

**示例（阿里云）**：
- 登录阿里云控制台
- 域名与网站 → 域名解析
- 找到 `from2045.com`
- 点击 **解析设置** → **添加记录**
- 填写上述信息

### 6.3 验证域名
等待 DNS 生效（5-10 分钟）：
```bash
ping prompt.from2045.com
```

应该解析到 GitHub 的 IP 地址。

然后在浏览器访问：
```
http://prompt.from2045.com
```

**✅ 完成标志**：自定义域名可以正常访问网站

---

## 🎉 部署成功！

恭喜你！AI 者华歌提示词库已成功上线！

### 下一步行动

1. **分享你的网站**
   - 发送给朋友和同事测试
   - 在社交媒体宣传
   - 收集用户反馈

2. **持续优化**
   - 根据反馈调整模板
   - 定期更新内容
   - 增加新功能

3. **监控访问**
   - 考虑集成 Google Analytics
   - 查看 GitHub Pages 访问统计
   - 了解用户使用习惯

---

## 📞 需要帮助？

### 文档资源
- **完整部署清单**：查看 `DEPLOYMENT_CHECKLIST.md`
- **项目状态报告**：查看 `PROJECT_STATUS.md`
- **README**：查看 `README.md`

### 故障排查
- GitHub Pages 官方文档：https://pages.github.com/
- Git 官方文档：https://git-scm.com/doc
- SSH 配置指南：https://docs.github.com/en/authentication/connecting-to-github-with-ssh

### 常见问题速查
| 问题 | 解决方案 |
|------|----------|
| 推送失败 "no upstream branch" | `git push -u origin main` |
| SSH 连接被代理劫持 | 关闭 Clash TUN 模式或配置直连规则 |
| 样式丢失 | 检查 CSS 文件路径，清除浏览器缓存 |
| 404 错误 | 确认 Pages 已启用，仓库为 Public |

---

**祝你部署顺利！** 🚀

**AI 者华歌** - 市场经营户的 AI 实战工具箱  
© 2026 免费提示词库
