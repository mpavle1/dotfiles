return {
	{
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					suggestion = { auto_trigger = true },
				})
			end, 100)
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		branch = "main",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false,
			window = {
				width = 0.25,
			},
		},
		keys = {
			{
				"<leader>ch",
				":'<,'>CopilotChat<CR>",
				mode = { "v" },
				desc = "Copilot Chat Selection",
			},
			{
				"<leader>ch",
				":CopilotChatToggle<CR>",
				mode = { "n" },
				desc = "Toggle Copilot Chat",
			},
		},
	},
}
