return {
	"conform.nvim",
	cmd = "ConformInfo",
	event = "DeferredUIEnter",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Format",
		},
	},
	after = function(_)
		require("conform").setup({
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nixfmt" },
				css = { "biome" },
				json = { "biome" },
				javascript = { "biome" },
				typescript = { "biome" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				biome = {
					require_cwd = true,
				},
			},
		})
	end,
}
