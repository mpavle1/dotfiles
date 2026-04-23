return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			numhl = true,
		})

		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
		vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "Git toggle blame" })
		vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
		vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git show current file diff" }) -- Do i need this?

		-- This is a bit hacky, but it allows us to show the git status in the statusline without having to use an external plugin like lualine.
		local function get_git_status()
			local buf = vim.api.nvim_get_current_buf()
			local dict = vim.b[buf].gitsigns_status_dict

			if not dict then
				return ""
			end

			local added = (dict.added or 0) > 0 and "%#diffAdded#+" .. dict.added .. "%*" or ""
			local changed = (dict.changed or 0) > 0 and "%#diffChanged#~" .. dict.changed .. "%*" or ""
			local removed = (dict.removed or 0) > 0 and "%#diffRemoved#-" .. dict.removed .. "%*" or ""

			local parts = {}
			if added ~= "" then
				table.insert(parts, added)
			end
			if changed ~= "" then
				table.insert(parts, changed)
			end
			if removed ~= "" then
				table.insert(parts, removed)
			end

			local status = table.concat(parts, " ")
			if status == "" then
				return ""
			end
			return "< " .. status
		end

		-- used for statusline
		_G.get_git_status = get_git_status

		vim.o.statusline = "%f %m %= %{get(b:,'gitsigns_head','')} %{%v:lua.get_git_status()%} < %p%% < %l,%c"
	end,
}
