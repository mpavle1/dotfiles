-- Auto close and auto rename html tag
-- ts == treesitter not typescript
return {
	"windwp/nvim-ts-autotag",
	event = { "VeryLazy" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close_on_slash = true,
			},
		})
	end,
}
