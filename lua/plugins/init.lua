require("lze").register_handlers(require('utils.lzUtils').for_cat)

require("lze").load({
  { import = "plugins.colorscheme" },
})

-- set the default colorscheme
local colorschemeName = nixCats('colorscheme')
vim.cmd.colorscheme(colorschemeName)
