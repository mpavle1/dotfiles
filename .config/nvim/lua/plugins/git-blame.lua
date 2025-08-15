-- Git blame for one line and for accessing blame information (Commit sha, commit url etc.)
return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	config = function()
		vim.g.gitblame_enabled = false

		vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Git toggle current line blame" })
	end,
}
