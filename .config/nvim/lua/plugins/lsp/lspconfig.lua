return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		if vim.fn.filereadable("/tmp/godot.pipe") == 0 then
			vim.fn.serverstart("/tmp/godot.pipe")
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- opts.desc = "Helps finish the function"
				-- vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

				opts.desc = "Show LSP references"
				vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gri", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "grt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config["gdscript"] = {
			cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			filetypes = { "gdscript" },
		}
		vim.lsp.enable("gdscript")

		-- setup like this due to work env setup
		local oxlint_root_dir = vim.lsp.config.oxlint.root_dir
		vim.lsp.config("oxlint", {
			cmd = { "oxlint", "--lsp" },
			root_dir = function(bufnr, on_dir)
				oxlint_root_dir(bufnr, function(dir)
					if dir then
						on_dir(dir)
					end
				end)
			end,
		})
		vim.lsp.enable("oxlint")

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
