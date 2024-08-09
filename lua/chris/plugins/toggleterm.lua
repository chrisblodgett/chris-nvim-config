-- toggleterm is a neovim plugin to persist and toggle multiple terminals during an editing session
-- https://github.com/akinsho/toggleterm.nvim
--
--
-- write some helper functions to run the current python script in a terminal
local function run_python()
	vim.cmd.write()
	print("Running...")
	local script_path = vim.fn.expand("%:p"):gsub(" ", "\\ ") -- the vim.fn.expand will take the current folder and escape any spaces
	-- the %:p means to get the full path of the current file, expand makes it a full path and the : uses it as a modifier
	-- so we can use gsub to escape any spaces
	local python_path
	--check to see if there is a venv and use that python otherwise use the system python
	if vim.fn.filereadable("venv/bin/python") == 1 then
		python_path = "venv/bin/python" -- this will make sure the local venv and modules are used
	else
		python_path = "python3"
	end
	local command = python_path .. " " .. script_path
	--local command = python_path .. script_path .. '"'
	require("toggleterm").exec(command)
end
-- a function to run a command in the terminal
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
		local keymap = vim.keymap -- use this abbreviation for concise code
		keymap.set("n", "<leadel>tp", run_python, { desc = "Run current file with python in terminal" })
		keymap.set("n", "<leader>tc", clear_terminal, { desc = "Clear terminal" })
		keymap.set("n", "<leader>tt", toggle_terminal, { desc = "Toggle terminal" })
		keymap.set("n", "<leader>tr", run_command, { desc = "Run command in terminal" })
	end,

	-- make a keymap to run the current python script in a terminal
}
