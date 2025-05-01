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
				md = { "deno_fmt" },
				ts = { "deno_fmt" },
				js = { "deno_fmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
