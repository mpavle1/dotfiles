return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
		vim.keymap.set("n", "g1", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "g2", "<cmd>diffget //3<CR>")
	end,
}