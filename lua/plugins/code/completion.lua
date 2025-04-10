return {
  {
    "blink.cmp",
    for_cat = "code.completion",
    event = "DeferredUIEnter",
    after = function(_)
      require('blink.cmp').setup({
        appearance = {
          -- TODO: determine if this is required
          -- sets the fallback highlight groups to nvim-cmp's highlight groups
          -- useful for when your theme doesn't support blink.cmp
          -- will be removed in a future release, assuming themes add support
          use_nvim_cmp_as_default = false,
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
    for_cat = "code.completion",
    dep_of = "blink.cmp",
  },
}
