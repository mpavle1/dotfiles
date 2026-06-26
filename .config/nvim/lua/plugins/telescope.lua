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
		local lga_actions = require("telescope-live-grep-args.actions")

		local layout_config = {
			height = 100,
			width = 400,
		}

		local ignore_globs = {
			"-g",
			"!.git",
			"-g",
			"!.next",
			"-g",
			"!node_modules",
			"-g",
			"!dist",
			"-g",
			"!public/*.js",
		}

		local vimgrep_arguments = vim.list_extend({
			"rg",
			"--hidden",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		}, ignore_globs)

		local rg_find_files = vim.list_extend({
			"rg",
			"--hidden",
			"--files",
		}, ignore_globs)

		telescope.setup({
			defaults = {
				layout_config = layout_config,
				layout_strategy = "horizontal",
				dynamic_preview_title = true,
				vimgrep_arguments = vimgrep_arguments,
				path_display = { filename_first = true },
			},
			pickers = {
				find_files = {
					find_command = rg_find_files,
				},
				oldfiles = {
					cwd_only = true,
				},
			},
			extensions = {
				fzf = {},
				live_grep_args = {
					auto_quoting = false,
					show_line = false,
					mappings = {
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " -F --iglob " }),
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent files" })
		vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "Telescope git branches" })
		vim.keymap.set("n", "<leader>fd", builtin.git_status, { desc = "Telescope git diff files" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix" })
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
			{ desc = "Telescope grep word under cursor" }
		)
		vim.keymap.set(
			"v",
			"<leader>fs",
			"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>",
			{ desc = "Telescope grep visual selection" }
		)
	end,
}
