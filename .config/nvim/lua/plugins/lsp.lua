return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "eslint" },
			})
		end,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")

			-- Here go the LSP setups
			lspconfig.ts_ls.setup({})
			lspconfig.lua_ls.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover" })
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ desc = "Go to Definition", silent = true, noremap = true }
			)
			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ desc = "Go to Declaration", silent = true, noremap = true }
			)
			vim.keymap.set(
				"n",
				"gr",
				vim.lsp.buf.references,
				{ desc = "Go to References", silent = true, noremap = true }
			)
			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ desc = "Code Action", silent = true, noremap = true }
			)
		end,
	},
}
