return {
	{
		"lazydev.nvim",
		ft = "lua",
		cmd = { "LazyDev" },
		dep_of = "blink.cmp",
		after = function(_)
			require("lazydev").setup({
				library = {
					{ words = { "vim%.uv" }, path = "${3rd}/luv/library" },
					{ words = { "Snacks" }, path = "snacks.nvim" },
				},
			})
		end,
	},
}
