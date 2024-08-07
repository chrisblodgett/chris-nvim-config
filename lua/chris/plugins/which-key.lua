--Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
--https://github.com/folke/which-key.nvim

return {
	"folke/which-key.nvim",
	version = "*",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {},
} -- force it to call setup and load by passing opts (options)
