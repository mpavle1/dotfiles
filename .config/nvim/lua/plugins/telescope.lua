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

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules/.*",
					"dist/.*",
					"public/.*%.js",
				},
				path_display = {
					filename_first = {
						reverse_directories = true,
					},
				},
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
					-- TODO: Videti da li ovo treba
					show_line = false,
				},
			},
			extensions = {
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
						"--hidden",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim",
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

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
			live_grep_args_shortcuts.grep_word_under_cursor,
			{ desc = "Telescope live grep under cursor" }
		)

		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Telescope grep string" })

		vim.keymap.set("n", "<leader>ws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Telescope grep word under cursor" })

		vim.keymap.set("n", "<leader>Ws", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Telescope grep WORD under cursor" })
	end,
}
