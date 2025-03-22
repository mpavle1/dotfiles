return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		require("telescope").load_extension("live_grep_args")

		telescope.setup({
			defaults = {
				path_display = {
					filename_first = {
						reverse_directories = true,
					},
				},
				vimgrep_arugments = {
					"--color=never",
					"--no-heading",
					"--hidden",
					"--with-filename",
					"--smart-case",
					"--trim",
				},
				file_ignore_patterns = {
					"public/.*%.js",
				},
			},
			pickers = {
				oldfiles = {
					theme = "ivy",
					hidden = "true",
					cwd_only = true,
					path_display = { "truncate" },
				},
				find_files = {
					theme = "ivy",
					hidden = "true",
					cwd_only = true,
					path_display = { "truncate" },
				},
			},
			extension = {
				fzf = {},
				live_grep_args = {
					theme = "ivy", -- Ovo ne radi
					path_display = {
						filename_first = {
							reverse_directories = true,
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent files" })
		vim.keymap.set("n", "<leader>fg", builtin.git_status, { desc = "Telescope live git files" })
		vim.keymap.set(
			"n",
			"<leader>f/",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Live Grep" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			"<cmd>lua require('telescope').extensions.live_grep_args.grep_word_under_cursor()<CR>",
			{ desc = "Telescope live grep under cursor" }
		)
		-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		-- vim.keymap.set("n", "<leader>fc", function()
		-- 	builtin.live_grep({
		-- 		glob_pattern = "!{spec,test}",
		-- 	})
		-- end, { desc = "Live Grep Code" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.grep_string({
				path_display = { "smart" },
				only_sort_text = true,
				word_match = "-w",
				search = "",
			})
		end, { desc = "Live Grep String" })
	end,
}
