-- define key mappings to reference in plugin config

local opts = {
	mappings = {
		add = "gsa", -- Add surrounding in Normal and Visual modes
		delete = "gsd", -- Delete surrounding
		find = "gsf", -- Find surrounding (to the right)
		find_left = "gsF", -- Find surrounding (to the left)
		highlight = "gsh", -- Highlight surrounding
		replace = "gsr", -- Replace surrounding
		update_n_lines = "gsn", -- Update `n_lines`
	},
}

return {
	{
		"mini.surround",
		event = "DeferredUIEnter",
		keys = {
			{ opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
			{ opts.mappings.delete, desc = "Delete Surrounding" },
			{ opts.mappings.find, desc = "Find Right Surrounding" },
			{ opts.mappings.find_left, desc = "Find Left Surrounding" },
			{ opts.mappings.highlight, desc = "Highlight Surrounding" },
			{ opts.mappings.replace, desc = "Replace Surrounding" },
			{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
		},
		after = function(_)
			require("mini.surround").setup(opts)
		end,
	},
}
