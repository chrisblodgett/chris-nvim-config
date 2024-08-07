-- Indent guides for Neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "VeryLazy" },
	main = "ibl",
	opts = {
		indent = { char = "|" },
	},
}
