return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261" })
  end,
}
