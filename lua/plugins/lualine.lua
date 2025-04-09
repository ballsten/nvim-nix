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
}
