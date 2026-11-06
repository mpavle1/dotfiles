return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		local js_tools = require("js-tools")

		lint.linters_by_ft = {
			php = { "phpstan" },
		}

		local js_filetypes = {
			javascript = true,
			typescript = true,
			javascriptreact = true,
			typescriptreact = true,
		}

		local function try_lint()
			local bufnr = vim.api.nvim_get_current_buf()
			if js_filetypes[vim.bo[bufnr].filetype] then
				lint.try_lint(js_tools.uses("eslint", bufnr) and { "eslint_d" } or {})
			else
				lint.try_lint()
			end
		end

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = try_lint,
		})
		vim.keymap.set("n", "<leader>l", try_lint, { desc = "Trigger linting for current file" })
	end,
}
