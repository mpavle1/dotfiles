-- Provides context of the current code block at the top of the window when the block is not visible.
return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			multiline_threshold = 1,
		})
	end,
}
