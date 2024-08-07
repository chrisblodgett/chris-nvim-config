return {
	-- TODO:  make a change
	-- this is a change i have to 2024-08-06T01:00:09
	--
	--
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local todo_comments = require("todo-comments")
			local keymap = vim.keymap
			keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			-- You can also specify a list of valid jump keywords

			keymap.set("n", "]t", function()
				require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
			end, { desc = "Next error/warning todo comment" })
			require("todo-comments").setup()
		end,
	},
}
