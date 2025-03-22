return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				-- Configuration options
				columns = { "icon" }, -- Add columns like icons, sizes, etc.
				view_options = {
					show_hidden = true, -- Show hidden files
				},
				float = {
					border = "rounded", -- Floating window style
				},
				win_options = {
					signcolumn = "yes:2",
				},
			})

			vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
