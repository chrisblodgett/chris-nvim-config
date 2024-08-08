-- telescope Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim
return {
	event = "VimEnter",
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make", --is used to run some commands as plugin is installed or updated not everytime
			--cond is used to detrmine whether the plugin shoudl be installed or loaded (condition)
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		-- useful for getting nice icons need to have a nerd font to enable :)
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		"folke/todo-comments.nvim",
	}, --dependencies
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = { -- these are for insert mode selections in telescope
						["<c-p>"] = actions.move_selection_previous, --prev result
						["<c-n>"] = actions.move_selection_next, --prev result
						["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
		telescope.load_extension("fzf")

		local keymap = vim.keymap -- thanks Josean again

		local builtin = require("telescope.builtin")
		keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles Fuzzily" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R}ecent files Fuzzily" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]tring in cwd" })
		keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind [C]ursor string in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odo" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		keymap.set(
			"n",
			"<leader>/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "[/] Fuzzily search in current buffer" }
		)

		keymap.set("n", "<leader>fe", builtin.resume, { desc = "[F]ind R[e]sume, continue your find" })
		keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F] [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end, --config function
}
