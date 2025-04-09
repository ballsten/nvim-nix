return {
  {
    "lualine.nvim",
    for_cat = "core.default",
    event = "DeferredUIEnter",
    -- TODO: revist after Snacks is configured, check out LazyVIM
    after = function(plugin)
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = nixCats('colorscheme'),
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_c = {
            {
              'filename', path = 1, status = true,
            },
          },
        },
        inactive_sections = {
          lualine_b = {
            {
              'filename', path = 3, status = true,
            },
          },
          lualine_x = {'filetype'},
        },
        tabline = {},
      })
    end,
  },
  {
    "bufferline.nvim",
    for_cat = "core.default",
    event = "DeferredUIEnter",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    after = function(_)
      -- TODO: revisit after snacks
      require('bufferline').setup({})
    end,
  },
  {
    "snacks.nvim",
    for_cat = "core.default",
    lazy = false,
    cmd = { "Snacks" },
    after = function(_)
      require('snacks').setup({
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        toggle = {},
        words = { enabled = true },
        -- TODO: dashboard
      })
    end,
  }

}
