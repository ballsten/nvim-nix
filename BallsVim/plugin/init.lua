-- set leader before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load plugin specs
require('lze').register_handlers(require('lzextras').lsp)
require("lze").load("specs")

-- load configuration
require("config")

-- load plugins
-- require("plugins")
