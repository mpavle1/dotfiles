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
				lsp_references = {
					-- TODO: Videti da li ovo treba
					show_line = false,
				},
			},
			extension = {
				fzf = {},
				live_grep_args = {
					auto_quoting = true,
					path_display = {
						filename_first = {
							reverse_directories = true,
						},
					},
					show_line = false,
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

		local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent files" })
		vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "Telescope live git files" })
		vim.keymap.set("n", "<leader>fd", builtin.git_status, { desc = "Telescope live git files" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix files" })
		vim.keymap.set(
			"n",
			"<leader>fw",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			{ desc = "Telescope workspace symbols" }
		)
		vim.keymap.set(
			"n",
			"<leader>f/",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Live Grep" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			live_grep_args_shortcuts.grep_word_under_cursor,
			{ desc = "Telescope live grep under cursor" }
		)
		vim.keymap.set("n", "<leader>fp", "<cmd>Telescope resume<cr>", { desc = "Telescope resume last search" })
	end,
}
