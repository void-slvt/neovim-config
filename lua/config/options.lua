-- Общее
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.laststatus = 3

-- Табы
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local function set_indent(size)
  vim.opt_local.expandtab = true
  vim.opt_local.shiftwidth = size
  vim.opt_local.tabstop = size
end

-- Группируем автокоманды, чтобы они не дублировались при перезагрузке конфига
local indent_group = vim.api.nvim_create_augroup("IndentSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  group = indent_group,
  callback = function()
    set_indent(4)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  group = indent_group,
  callback = function()
    set_indent(2)
  end,
})

-- Поиск
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.o.winborder = 'rounded'

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

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#6CB6FF" })
