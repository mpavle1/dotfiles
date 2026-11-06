return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa-wave")
			vim.cmd("highlight Normal guibg=black")

			-- vim.cmd("colorscheme kanagawa-lotus")
			-- vim.cmd("highlight Normal guibg=white")
		end,
	},
}
