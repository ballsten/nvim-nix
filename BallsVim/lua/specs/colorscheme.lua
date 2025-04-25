return {
  {
    "catppuccin-nvim",
    colorscheme = {
      "catppuccin",
      "catppuccin-frappe",
      "catppuccin-macchiato",
      "catppuccin-mocha",
    },
    deps_of = "bufferline.nvim",
    after = function (_)
      require("catppuccin").setup({
        integrations = {
          blink_cmp = true,
          flash = true,
          gitsigns = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          noice = true,
          semantic_tokens = true,
          snacks = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        }
      })
    end,
  }
}
