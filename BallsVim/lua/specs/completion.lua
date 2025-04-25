return {
  {
    "blink.cmp",
    event = "DeferredUIEnter",
    after = function(_)
      require('blink.cmp').setup({
        appearance = {
          -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- adjusts spacing to ensure icons are aligned
          nerd_font_variant = "mono",
        },
        completion = {
          accept = {
            -- experimental auto-brackets support
            auto_brackets = {
              enabled = true,
            },
          },
          menu = {
            draw = {
              treesitter = { "lsp" },
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
          },
          ghost_text = {
            enabled = true,
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        cmdline = {
          enabled = false,
        },
        keymap = {
          preset = "enter",
          ["<C-y>"] = { "select_and_accept" },
        },
      })
    end,
  },
  {
    "friendly-snippets",
    dep_of = "blink.cmp",
  },
}
