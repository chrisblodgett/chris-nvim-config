--Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
--and About Lua plugin to turn github copilot into a cmp source
--https://github.com/zbirenbaum/copilot.lua
-- https://github.com/zbirenbaum/copilot-cmp
--
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		version = "*",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({ suggestion = { enabled = false }, panel = { enabled = false } })
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		version = "*",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
