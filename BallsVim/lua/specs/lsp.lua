return {
	{
		"nvim-lspconfig",
		lsp = function(plugin)
			if plugin.lsp ~= {} then
				vim.lsp.config(plugin.name, plugin.lsp or {})
			end
			vim.lsp.enable(plugin.name)
		end,
		before = function(plugin)
			vim.lsp.config("*", {
				-- capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Your on_attach function should set buffer-local lsp related settings
					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end
					-- TODO: flesh these out
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					-- etc...
				end,
			})
		end,
	},
	{
		"lua_ls",
		lsp = {},
	},
	{
		"nixd",
		lsp = {},
	},
	{
		"vtsls",
		lsp = {},
	},
	{
		"none-ls.nvim",
		event = "DeferredUIEnter",
		after = function(_)
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = null_ls.builtins.formatting.biome,
			})
		end,
	},
}
