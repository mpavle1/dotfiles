return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				columns = { "permissions", "size", "mtime", "icon" },
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
				},
				float = {
					border = "rounded",
				},
				win_options = {
					signcolumn = "yes:2",
				},
			})

			vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
