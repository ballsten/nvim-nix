require("lze").register_handlers(require('utils.lzUtils').for_cat)
require('lze').register_handlers(require('lzextras').lsp)

require("lze").load({
  { import = "plugins.colorscheme" },
  { import = "plugins.core.ui" },
  { import = "plugins.core.editor" },
  { import = "plugins.code.completion" },
  { import = "plugins.treesitter" },
  { import = "plugins.lsp" },
})

-- set the default colorscheme
local colorschemeName = nixCats('colorscheme')
vim.cmd.colorscheme(colorschemeName)
