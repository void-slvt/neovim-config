return {
    "neovim/nvim-lspconfig",
    config = function()
        -- form blink
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- diagnostic config
        vim.diagnostic.config({
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
                    local source = diagnostic.source and diagnostic.source:gsub("%.$", "") or ""

                    local message = diagnostic.message and diagnostic.message:gsub("%.$", "") or ""
                    local message = diagnostic.message and diagnostic.message:gsub("%.$", "") or ""
                    local code = diagnostic.code and string.format("%s", diagnostic.code):gsub("%.$", "") or ""
                    local message = diagnostic.message and diagnostic.message:gsub("%.$", "") or ""

                    if code ~= "" then
                        return string.format("[%s] %s: %s", source, code, message)
                    else
                        return string.format("[%s] %s", source, message)
                    end
                end,
            }
        })

        -- lua_ls
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                }
            }
        })
        vim.lsp.enable('lua_ls')

        -- pyright
        vim.lsp.config('pyright', {
            capabilities = capabilities,
        })
        vim.lsp.enable('pyright')

        -- ruff
        vim.lsp.config('ruff', {
            capabilities = capabilities,
            settings = {
                configuration = "~/.config/nvim/ruff.toml"
            }
        })
        vim.lsp.enable('ruff')
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
}
