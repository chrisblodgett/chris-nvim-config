-- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
-- https://github.com/akinsho/bufferline.nvim
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true -- bufferline setup stuffs
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				indicator = { style = "underline" },
			},
		})
	end,
}
