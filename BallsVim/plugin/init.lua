-- load configuration
require("config")

-- load plugin specs
require('lze').register_handlers(require('lzextras').lsp)
require("lze").load("specs")

-- set default colorscheme
vim.cmd.colorscheme("catppuccin-mocha")

-- load plugins
-- require("plugins")
