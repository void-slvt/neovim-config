return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    --separator_style = "slant",
                    show_buffer_icons = true,
                    enforce_regular_tabs = false,
                    always_show_bufferline = false,
                    buffer_close_icon = '󰅖',
                    modified_icon = '●',
                    close_icon = '󰅖',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    diagnostics = "nvim_lsp", -- Показывать ошибки прямо на вкладках
                },
            })
        end,
    },
}
