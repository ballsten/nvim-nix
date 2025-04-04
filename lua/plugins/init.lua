-- Set theme
local colorschemeName = nixCats('colorscheme')
vim.cmd.colorscheme(colorschemeName)

require('plugins/lsp')
