return {
	{
		"lazydev.nvim",
		ft = "lua",
		cmd = { "LazyDev" },
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
