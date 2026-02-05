-- Общее
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.laststatus = 3
vim.opt.undofile = true

-- Табы
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Поиск
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.winborder = 'rounded'
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Подсветка скопированного текста
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",       -- Группа подсветки (можно попробовать 'Visual')
      timeout = 150,               -- Длительность вспышки в мс
    })
  end,
})

-- Цвет MiniIndentscope
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#6CB6FF" })

-- nvim-treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
    if lang then
      pcall(vim.treesitter.start)
    end
  end,
})
