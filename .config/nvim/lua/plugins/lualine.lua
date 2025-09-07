return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = {},
				lualine_x = {},
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
		})
	end,
}
