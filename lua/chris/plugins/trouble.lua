--A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
--https://github.com/folke/trouble.nvim
return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Open/close trouble list",
		},
		{
			"<leader>xw",
			"<cmd>Trouble toggle diagnostics focus=true<CR>",
			desc = "Open Workspace Diagnostics (Trouble)",
		},
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>",
			desc = "Open Document Diagnostics (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle focus=true<cr>",
			desc = "Quickfix list (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle focus=true<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xt",
			"<cmd>Trouble todo toggle focus=true<cr>",
			desc = "Quickfix list (Trouble)",
		},
	},
}
