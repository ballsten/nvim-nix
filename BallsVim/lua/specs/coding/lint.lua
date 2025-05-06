return {
	"nvim-lint",
	event = "DeferredUIEnter",
	after = function(_)
		require("lint").linters_by_ft = {
			-- insert linters here
			-- TODO: determine if I really want linting
			-- javascript = { "eslint_d", "ESLint" },
			-- typescript = { "eslint_d", "ESLint" },
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
