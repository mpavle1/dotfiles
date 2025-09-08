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

-- Replace word under cursor in buffer
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace string in buffer" }
)

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

-- Yoink to clipboard (this may need to change for Windos)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Smart yoink" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Smart yoink" })

-- Toggle Quickfix List
vim.keymap.set("n", "<leader>q", function()
	local is_open = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			is_open = true
			break
		end
	end
	if is_open then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { desc = "Toggle Quickfix List" })

-- Remove items from quickfix list.
-- `dd` to delete in Normal
-- `d` to delete Visual selection
local function delete_qf_items()
	local mode = vim.api.nvim_get_mode()["mode"]

	local start_idx
	local count

	if mode == "n" then
		-- Normal mode
		start_idx = vim.fn.line(".")
		count = vim.v.count > 0 and vim.v.count or 1
	else
		-- Visual mode
		local v_start_idx = vim.fn.line("v")
		local v_end_idx = vim.fn.line(".")

		start_idx = math.min(v_start_idx, v_end_idx)
		count = math.abs(v_end_idx - v_start_idx) + 1

		-- Go back to normal
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes(
				"<esc>", -- what to escape
				true, -- Vim leftovers
				false, -- Also replace `<lt>`?
				true -- Replace keycodes (like `<esc>`)?
			),
			"x", -- Mode flag
			false -- Should be false, since we already `nvim_replace_termcodes()`
		)
	end

	local qflist = vim.fn.getqflist()

	for _ = 1, count, 1 do
		table.remove(qflist, start_idx)
	end

	vim.fn.setqflist(qflist, "r")
	vim.fn.cursor(start_idx, 1)
end

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("custom", { clear = true }),
	pattern = "qf",
	callback = function()
		-- Do not show quickfix in buffer lists.
		vim.api.nvim_buf_set_option(0, "buflisted", false)

		-- Escape closes quickfix window.
		vim.keymap.set("n", "<ESC>", "<CMD>cclose<CR>", { buffer = true, remap = false, silent = true })

		vim.keymap.set("n", "dd", delete_qf_items, { buffer = true })
		vim.keymap.set("x", "d", delete_qf_items, { buffer = true })
	end,
	desc = "Quickfix tweaks",
})
