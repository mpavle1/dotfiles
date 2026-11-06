return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			numhl = true,
		})

		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Next Git Hunk" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Previous Git Hunk" })

		vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
		vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "Git toggle blame" })
		vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
		vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Git show current file diff" })
		vim.keymap.set("n", "<leader>gD", ":Gitsigns diffthis ", {
			silent = false,
			desc = "Diff this against revision",
		})
	end,
}
