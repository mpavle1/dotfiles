return {
	"zbirenbaum/copilot.lua",
	event = "VimEnter",
	name = "copilot",
	config = function()
		vim.defer_fn(function()
			require("copilot").setup({
				copilot_node_command = vim.fn.expand("~/.nvm/versions/node/v22.11.0/bin/node"),
				suggestion = { enabled = true, auto_trigger = true },
				filetypes = {
					sh = function()
						if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
							return false
						end
						return true
					end,
				},
			})
		end, 100)
	end,
}
