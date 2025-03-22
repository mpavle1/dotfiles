return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>gb",
		-- 	":Gitsigns toggle_current_line_blame<CR>",
		-- 	{ desc = "Git toggle current line blame" }
		-- )
		-- Do i need this?
		vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git show current file diff" })
	end,
}
