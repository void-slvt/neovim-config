return {
    'saghen/blink.cmp',
    version = '*',

    config = function()
        require('blink.cmp').setup({
            keymap = { preset = 'super-tab' },
            appearance = {
                -- Использовать иконки из Nerd Font (если есть)
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            -- Источники данных
            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },

            -- Оформление окна
            completion = {
                menu = { border = 'rounded' },
                documentation = { window = { border = 'rounded' } },
            },

            -- Настройка подписей функций (signature help)
            signature = { enabled = true, window = { border = 'rounded' } },
        })
    end,
}
