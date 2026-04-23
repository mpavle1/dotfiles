return {
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
		}

		-- Install all parsers
		for _, parser in ipairs(parsers) do
			ts.install(parser)
		end

		-- Enable highlighting and indentation per filetype
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(event)
				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				-- Enable syntax highlighting
				pcall(vim.treesitter.start, event.buf, lang)

				-- Indentation (experimental, provided by nvim-treesitter)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
