-- Navigate between panes
vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { silent = true })

-- Display diagnostics for line
vim.api.nvim_set_keymap("n", "<leader>cd", ":lua vim.diagnostic.open_float()<CR>", { desc = "Line Diagnostics" })

-- Navigate through diagnostics
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })

-- Navigate through error diagnostics
vim.api.nvim_set_keymap(
	"n",
	"]e",
	"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
	{ desc = "Next Error" }
)
vim.api.nvim_set_keymap(
	"n",
	"[e",
	"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
	{ desc = "Prev Error" }
)

-- Navigate through warning diagnostics
vim.api.nvim_set_keymap(
	"n",
	"]w",
	"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>",
	{ desc = "Next Warning" }
)
vim.api.nvim_set_keymap(
	"n",
	"[w",
	"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>",
	{ desc = "Prev Warning" }
)

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up
