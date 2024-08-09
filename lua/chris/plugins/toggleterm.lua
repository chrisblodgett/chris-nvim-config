-- toggleterm is a neovim plugin to persist and toggle multiple terminals during an editing session
-- https://github.com/akinsho/toggleterm.nvim
local function run_python()
	vim.cmd.write()
	print("Running...")
	local script_path = vim.fn.expand("%:p"):gsub(" ", "\\ ")
	local command = 'python3 "' .. script_path .. '"'
	require("toggleterm").exec(command)
end

local function run_command()
	--prompt the user for the command to run
	local command = vim.fn.input("Enter command: ")
	require("toggleterm").exec(command)
end

local function clear_terminal()
	require("toggleterm").exec("clear")
end

local function toggle_terminal()
	require("toggleterm").toggle()
end
return {

	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			shell = vim.o.shell,
			auto_scroll = true,
			-- open_mapping = [[<c-\>]],
		})
		local keymap = vim.keymap
		keymap.set("n", "<leadel>tp", run_python, { desc = "Run current current python script in a terminal" })
		keymap.set("n", "<leader>tc", clear_terminal, { desc = "Clear terminal" })
		keymap.set("n", "<leader>tt", toggle_terminal, { desc = "Toggle terminal" })
		keymap.set("n", "<leader>tr", run_command, { desc = "Run command in terminal" })
	end,

	-- make a keymap to run the current python script in a terminal
}
