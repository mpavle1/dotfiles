return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "wave",
			})

			vim.cmd("colorscheme kanagawa")

			vim.cmd("highlight Normal guibg=black")
		end,
	},
}
