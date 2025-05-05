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
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
