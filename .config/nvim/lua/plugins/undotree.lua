-- There is a default version of this via :packadd nvim.undotree, however this plugin is still superior
return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })
	end,
}
