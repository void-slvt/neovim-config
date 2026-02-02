return {
  "neovim/nvim-lspconfig",
  dependencies = { "Saghen/blink.cmp" },
  opts = {
  servers = {
    lua_ls = {
    settings = {
      Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
      },
    },
    },
    pyright = {},
    ruff = {
    settings = {
      configuration = "~/.config/ruff/ruff.toml",
    },
    },
  },
  diagnostics = {
    underline = true,
    update_in_insert = false,
    signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
    },
    virtual_text = {
    prefix = '',
    format = function(diagnostic)
      local source = diagnostic.source:gsub("%.$", "") or ""
      local message = diagnostic.message:gsub("%.$", "") or ""
      if diagnostic.code then
      return string.format("[%s] %s: %s", source, diagnostic.code, message)
      end
      return string.format("[%s] %s", source, message)
    end,
    },
  },
  },
  config = function(_, opts)
  -- 1. Применяем настройки диагностики
  vim.diagnostic.config(opts.diagnostics)

  -- 2. Получаем возможности от blink.cmp
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  -- 3. Проходим циклом по всем серверам в нашем списке opts.servers
  for server, config in pairs(opts.servers) do
    config.capabilities = capabilities
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
  end

  -- 4. Автокоманда для Python (Ruff)
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
    vim.lsp.buf.format({ async = false })
    end,
  })
  end,
}
