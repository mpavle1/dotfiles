-- Navigate between panes
vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", { silent = true })

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

-- Shift visual selected line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { silent = true })

-- Line jump stays in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search term stays in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste does not change the current buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Smart paste" })

-- Yoink to clipboard (this may need to change for macOS and Windos)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Smart yoink" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Smart yoink" })

-- LSP keymaps
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover" })
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", silent = true, noremap = true })
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration", silent = true, noremap = true })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References", silent = true, noremap = true })
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", silent = true, noremap = true })
