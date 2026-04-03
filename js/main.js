// ===== 全局状态管理 =====
const AppState = {
    currentModule: 'business',
    allData: {},
    filteredTemplates: [],
    activeFilters: []
};

// ===== 模块配置 =====
const ModuleConfig = {
    business: {
        title: '生活工作区',
        description: '商务场景文本生成提示词模板，涵盖客户开发、询盘回复、竞品调研等实用场景',
        dataFile: 'data/business.json'
    },
    image: {
        title: '图像生成区',
        description: '电商视觉素材提示词模板，精选自 PromptHero 等平台，适合市场经营户的圖片需求',
        dataFile: 'data/images.json'
    },
    geo: {
        title: 'GEO 优化区',
        description: '生成式引擎优化模板，提升自己品牌或服务在 AI 搜索引擎中的可见度',
        dataFile: 'data/geo.json'
    }
};

// ===== DOM 元素引用 =====
const DOM = {
    navLinks: document.querySelectorAll('.nav-link'),
    introTitle: document.getElementById('intro-title'),
    introDesc: document.getElementById('intro-desc'),
    searchInput: document.getElementById('search-input'),
    searchBtn: document.getElementById('search-btn'),
    filterTags: document.getElementById('filter-tags'),
    templatesContainer: document.getElementById('templates-container'),
    emptyState: document.getElementById('empty-state'),
    modal: document.getElementById('template-modal'),
    modalClose: document.querySelector('.close-btn'),
    modalTitle: document.getElementById('modal-title'),
    modalScenario: document.getElementById('modal-scenario'),
    modalTags: document.getElementById('modal-tags'),
    modalPrompt: document.getElementById('modal-prompt'),
    modalTips: document.getElementById('modal-tips'),
    modalExample: document.getElementById('modal-example'),
    modalExampleContainer: document.getElementById('modal-example-container'),
    copyPromptBtn: document.getElementById('copy-prompt-btn')
};

// ===== 初始化函数 =====
async function init() {
    console.log('🚀 AI 者华歌提示词库初始化...');
    
    // 加载默认模块
    await loadModule('business');
    
    // 绑定事件监听器
    bindEvents();
    
    console.log('✅ 初始化完成');
}

// ===== 加载模块数据 =====
async function loadModule(moduleName) {
    try {
        const config = ModuleConfig[moduleName];
        const response = await fetch(config.dataFile);
        const data = await response.json();
        
        AppState.currentModule = moduleName;
        AppState.allData[moduleName] = data;
        AppState.filteredTemplates = data.templates;
        
        // 更新 UI
        updateModuleUI(moduleName);
        renderTemplates(data.templates);
        renderFilterTags(data.templates);
        
    } catch (error) {
        console.error('❌ 加载模块数据失败:', error);
        showError('加载数据失败，请刷新页面重试');
    }
}

// ===== 更新模块 UI =====
function updateModuleUI(moduleName) {
    const config = ModuleConfig[moduleName];
    
    // 更新导航激活状态
    DOM.navLinks.forEach(link => {
        link.classList.toggle('active', link.dataset.module === moduleName);
    });
    
    // 更新介绍横幅
    DOM.introTitle.textContent = config.title;
    DOM.introDesc.textContent = config.description;
    
    // 清空搜索和筛选
    DOM.searchInput.value = '';
    AppState.activeFilters = [];
}

// ===== 渲染模板卡片 =====
function renderTemplates(templates) {
    if (!templates || templates.length === 0) {
        DOM.templatesContainer.innerHTML = '';
        DOM.emptyState.style.display = 'block';
        return;
    }
    
    DOM.emptyState.style.display = 'none';
    
    DOM.templatesContainer.innerHTML = templates.map(template => {
        const previewText = template.prompt ? 
            template.prompt.substring(0, 150) + '...' : 
            (template.prompt_cn || template.description);
        
        return `
            <div class="template-card" data-id="${template.id}">
                <h3>${template.title}</h3>
                <span class="scenario">📍 ${template.scenario}</span>
                <div class="tags">
                    ${template.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
                </div>
                <p class="preview">${previewText}</p>
                <div class="action-hint">👆 点击查看详情 →</div>
            </div>
        `;
    }).join('');
    
    // 绑定卡片点击事件
    document.querySelectorAll('.template-card').forEach(card => {
        card.addEventListener('click', () => {
            const templateId = card.dataset.id;
            openTemplateModal(templateId);
        });
    });
}

// ===== 渲染筛选标签 =====
function renderFilterTags(templates) {
    if (!templates) return;
    
    // 提取所有唯一标签
    const allTags = [...new Set(templates.flatMap(t => t.tags))];
    
    DOM.filterTags.innerHTML = allTags.map(tag => `
        <span class="filter-tag" data-tag="${tag}">${tag}</span>
    `).join('');
    
    // 绑定标签点击事件
    document.querySelectorAll('.filter-tag').forEach(tag => {
        tag.addEventListener('click', () => toggleFilter(tag.dataset.tag));
    });
}

// ===== 切换筛选标签 =====
function toggleFilter(tag) {
    const index = AppState.activeFilters.indexOf(tag);
    
    if (index > -1) {
        // 取消筛选
        AppState.activeFilters.splice(index, 1);
        document.querySelector(`.filter-tag[data-tag="${tag}"]`).classList.remove('active');
    } else {
        // 添加筛选
        AppState.activeFilters.push(tag);
        document.querySelector(`.filter-tag[data-tag="${tag}"]`).classList.add('active');
    }
    
    applyFilters();
}

// ===== 应用筛选和搜索 =====
function applyFilters() {
    const searchTerm = DOM.searchInput.value.toLowerCase().trim();
    const moduleData = AppState.allData[AppState.currentModule];
    
    if (!moduleData) return;
    
    let filtered = moduleData.templates;
    
    // 应用标签筛选
    if (AppState.activeFilters.length > 0) {
        filtered = filtered.filter(template => 
            AppState.activeFilters.some(filter => template.tags.includes(filter))
        );
    }
    
    // 应用搜索
    if (searchTerm) {
        filtered = filtered.filter(template => {
            const searchText = [
                template.title,
                template.scenario,
                template.prompt,
                template.prompt_cn,
                ...template.tags
            ].join(' ').toLowerCase();
            
            return searchText.includes(searchTerm);
        });
    }
    
    AppState.filteredTemplates = filtered;
    renderTemplates(filtered);
}

// ===== 打开模板详情弹窗 =====
function openTemplateModal(templateId) {
    const template = AppState.filteredTemplates.find(t => t.id === templateId);
    if (!template) return;
    
    DOM.modalTitle.textContent = template.title;
    DOM.modalScenario.textContent = `📍 ${template.scenario}`;
    DOM.modalTags.textContent = `🏷️ ${template.tags.join(', ')}`;
    DOM.modalPrompt.textContent = template.prompt;
    DOM.modalTips.textContent = template.usage_tips;
    
    // 处理示例输出（可选字段）
    if (template.example_output) {
        DOM.modalExample.textContent = template.example_output;
        DOM.modalExampleContainer.style.display = 'block';
    } else {
        DOM.modalExampleContainer.style.display = 'none';
    }
    
    // 重置复制按钮状态
    DOM.copyPromptBtn.textContent = '📋 一键复制';
    DOM.copyPromptBtn.classList.remove('copied');
    
    // 显示弹窗
    DOM.modal.style.display = 'block';
    document.body.style.overflow = 'hidden';
}

// ===== 关闭弹窗 =====
function closeModal() {
    DOM.modal.style.display = 'none';
    document.body.style.overflow = 'auto';
}

// ===== 复制到剪贴板 =====
async function copyToClipboard(text) {
    try {
        await navigator.clipboard.writeText(text);
        
        DOM.copyPromptBtn.textContent = '✅ 已复制！';
        DOM.copyPromptBtn.classList.add('copied');
        
        setTimeout(() => {
            DOM.copyPromptBtn.textContent = '📋 一键复制';
            DOM.copyPromptBtn.classList.remove('copied');
        }, 2000);
        
    } catch (error) {
        console.error('复制失败:', error);
        alert('复制失败，请手动选择文本复制');
    }
}

// ===== 显示错误提示 =====
function showError(message) {
    DOM.templatesContainer.innerHTML = `
        <div style="grid-column: 1/-1; text-align: center; padding: 3rem; color: #e53e3e;">
            <p style="font-size: 1.2rem;">⚠️ ${message}</p>
        </div>
    `;
}

// ===== 绑定事件监听器 =====
function bindEvents() {
    // 导航切换
    DOM.navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const moduleName = link.dataset.module;
            loadModule(moduleName);
        });
    });
    
    // 搜索功能
    DOM.searchBtn.addEventListener('click', applyFilters);
    DOM.searchInput.addEventListener('keyup', (e) => {
        if (e.key === 'Enter') applyFilters();
    });
    
    // 实时搜索（可选）
    DOM.searchInput.addEventListener('input', () => {
        clearTimeout(window.searchTimeout);
        window.searchTimeout = setTimeout(applyFilters, 300);
    });
    
    // 弹窗关闭
    DOM.modalClose.addEventListener('click', closeModal);
    window.addEventListener('click', (e) => {
        if (e.target === DOM.modal) closeModal();
    });
    
    // 复制提示词
    DOM.copyPromptBtn.addEventListener('click', () => {
        const promptText = DOM.modalPrompt.textContent;
        copyToClipboard(promptText);
    });
    
    // ESC 键关闭弹窗
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && DOM.modal.style.display === 'block') {
            closeModal();
        }
    });
}

// ===== 页面加载完成后初始化 =====
document.addEventListener('DOMContentLoaded', init);
