return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local js_tools = require("js-tools")

		local function js_formatters(bufnr)
			local formatters = js_tools.linters(bufnr)
			table.insert(formatters, js_tools.formatter(bufnr))
			return formatters
		end

		local function other_formatters(bufnr)
			return { js_tools.formatter(bufnr) }
		end

		conform.setup({
			formatters_by_ft = {
				javascript = js_formatters,
				typescript = js_formatters,
				javascriptreact = js_formatters,
				typescriptreact = js_formatters,
				css = other_formatters,
				html = other_formatters,
				json = other_formatters,
				yaml = other_formatters,
				markdown = other_formatters,
				lua = { "stylua" },
				php = {},
			},
			formatters = {
				oxfmt = { command = "oxfmt" },
				oxlint = { command = "oxlint" },
			},
			format_on_save = function(bufnr)
				-- Disable formatting on save for php files
				if vim.bo[bufnr].filetype == "php" then
					return nil
				end

				return {
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
