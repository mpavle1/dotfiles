local M = {}

function M.path()
	local buf = vim.api.nvim_get_current_buf()

	if vim.bo[buf].filetype == "oil" then
		local dir = require("oil").get_current_dir(buf)
		if dir then
			local relative = vim.fn.fnamemodify(dir, ":p:~:.")
			return relative ~= "" and relative or "./"
		end
	end

	local name = vim.api.nvim_buf_get_name(buf)
	if name == "" then
		return "[No Name]"
	end

	return vim.fn.fnamemodify(name, ":~:.")
end

local diff_parts = {
	{ key = "added", hl = "diffAdded", sign = "+" },
	{ key = "changed", hl = "diffChanged", sign = "~" },
	{ key = "removed", hl = "diffRemoved", sign = "-" },
}

function M.git_diff()
	local dict = vim.b[vim.api.nvim_get_current_buf()].gitsigns_status_dict
	if not dict then
		return ""
	end

	local parts = {}
	for _, part in ipairs(diff_parts) do
		local count = dict[part.key] or 0
		if count > 0 then
			table.insert(parts, ("%%#%s#%s%d%%*"):format(part.hl, part.sign, count))
		end
	end

	if #parts == 0 then
		return ""
	end

	return "< " .. table.concat(parts, " ")
end

vim.o.statusline = table.concat({
	"%{v:lua.require'statusline'.path()} %m",
	"%=",
	"%{get(b:,'gitsigns_head','')}",
	"%{%v:lua.require'statusline'.git_diff()%}",
	"< %p%% < %l,%c",
}, " ")

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("StatuslineGitRefresh", { clear = true }),
	pattern = "GitSignsUpdate",
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

return M
