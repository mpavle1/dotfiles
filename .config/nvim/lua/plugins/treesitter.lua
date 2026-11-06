return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			local parsers = {
				"diff",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"gdscript",
			}

			ts.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterAttach", { clear = true }),
				callback = function(event)
					local lang = vim.treesitter.language.get_lang(event.match) or event.match

					if not pcall(vim.treesitter.start, event.buf, lang) then
						return
					end

					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				multiline_threshold = 1,
			})
		end,
	},
}
