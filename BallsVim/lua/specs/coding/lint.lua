return {
	"nvim-lint",
	event = "DeferredUIEnter",
	after = function(_)
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
		}
		-- create autocmd to trigger linter
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
			end,
		})
	end,
}
