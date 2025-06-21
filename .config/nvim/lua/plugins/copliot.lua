return {
	{
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					suggestion = { enabled = true, auto_trigger = true },
				})
			end, 100)
		end,
	},
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	opts = {},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
	-- {
	-- 	"yetone/avante.nvim",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 		{
	-- 			-- support for image pasting
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				-- recommended settings
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 					-- required for Windows users
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			opts = { file_types = { "markdown", "Avante" } },
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- 	build = "make",
	-- 	-- opts = { provider = "copilot", behavior = { enable_cursor_planning_mode = true } },
	-- 	opts = { provider = "copilot" },
	-- },
}
