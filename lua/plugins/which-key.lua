return {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
        preset = 'modern',
        delay = 200,
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
