return {
    {
      "echasnovski/mini.indentscope",

      opts = {
        symbol = "│",

        draw = {
          delay = 100,

          animation = function()
            return 20
          end,
        },

        options = {
          indent_at_cursor = true,
          try_as_border = true,
        },
      },
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "help", "alpha", "dashboard", "neo-tree", "Trouble",
            "lazy", "mason", "notify", "toggleterm", "lazyterm",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })
      end,
  },
  {
      "echasnovski/mini.trailspace",
      opts = {}
  }
}
