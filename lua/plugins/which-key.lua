return {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
        preset = 'helix',
        icons = {
            plugin = true,
            rules = {
                { plugin = "telescope", icon = " ", color = "cyan" },
                { desc = "git", icon = "󰊢 ", color = "orange" },
                { desc = "file", icon = "󰈔 ", color = "blue" },
                { desc = "config", icon = " ", color = "gray" },
                { desc = "buffer", icon = "󰈙 ", color = "green" },
                { desc = "search", icon = " ", color = "cyan" },
                { desc = "save", icon = "󰆓 ", color = "green" },
                { desc = "quit", icon = "󰈆 ", color = "red" },
            },
        }
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
