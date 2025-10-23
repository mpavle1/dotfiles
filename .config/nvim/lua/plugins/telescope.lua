return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.1.0",
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				layout_config = {
					height = 100,
					width = 400,
				},
				layout_strategy = "horizontal",
				dynamic_preview_title = true,
				file_ignore_patterns = {
					"node_modules/.*",
					"dist/.*",
					"public/.*%.js",
					-- ".next/.*%.js",
				},
				path_display = { filename_first = { reverse_directories = true } },
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--hidden",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
					"--glob",
					"!**/.git/**",
				},
			},
			pickers = {
				oldfiles = {
					hidden = true,
					cwd_only = true,
					path_display = { "truncate" },
				},
				find_files = {
					hidden = true,
					cwd_only = true,
					path_display = { "truncate" },
				},
				lsp_references = {
					show_line = false,
				},
			},
			extensions = {
				fzf = {},
				live_grep_args = {
					auto_quoting = false,
					mappings = {
						i = {
							["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
							["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
								postfix = " -FS --iglob **",
							}),
							-- freeze the current list and start a fuzzy search in the frozen list
							-- ["<C-space>"] = lga_actions.to_fuzzy_refine,
						},
					},
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
						"--hidden",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim",
						"--glob",
						"!**/.git/**",
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent files" })
		vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "Telescope live git files" })
		vim.keymap.set("n", "<leader>fd", builtin.git_status, { desc = "Telescope live git diff files" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix files" })
		vim.keymap.set("n", "<leader>fp", builtin.resume, { desc = "Telescope resume last search" })
		vim.keymap.set("n", "<leader>fw", builtin.lsp_document_symbols, { desc = "Telescope document symbols" })
		vim.keymap.set(
			"n",
			"<leader>f/",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Telescope live grep args" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>",
			{ desc = "Telescope live grep under cursor" }
		)
		vim.keymap.set(
			"v",
			"<leader>fs",
			"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>",
			{ desc = "Telescope live grep visual selection" }
		)
	end,
}
