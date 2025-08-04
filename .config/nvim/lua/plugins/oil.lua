-- function _G.get_oil_winbar()
-- 	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
-- 	local dir = require("oil").get_current_dir(bufnr)
-- 	if dir then
-- 		return vim.fn.fnamemodify(dir, ":~")
-- 	else
-- 		-- If there is no current directory (e.g. over ssh), just show the buffer name
-- 		return vim.api.nvim_buf_get_name(0)
-- 	end
-- end

return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				columns = { "permissions", "size", "mtime", "icon" },
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
				},
				float = {
					border = "rounded",
				},
				win_options = {
					signcolumn = "yes:2",
					-- winbar = "%!v:lua.get_oil_winbar()",
				},
			})

			vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
