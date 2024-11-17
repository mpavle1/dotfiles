return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
			},
		})

		-- telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>f/", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope live git files" })
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Telescope live grep under cursor" })
		-- Uncomment if i ever add back buffers
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
