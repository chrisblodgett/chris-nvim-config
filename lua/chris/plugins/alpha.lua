return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local function read_ascii_art(file_path)
			local lines = {}
			local file = io.open(file_path, "r")
			if not file then
				return lines
			end

			for line in file:lines() do
				table.insert(lines, line)
			end
			file.close()
			return lines
		end
		local config_path = vim.api.nvim_call_function("stdpath", { "config" })
		local file_path = config_path .. "/alpha_header.txt"
		local ascii_art_lines = read_ascii_art(file_path)
		-- Set header
		dashboard.section.header.val = ascii_art_lines
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("SPC ee", "󰥨  > Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰈞  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<CMD>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "  > Restore Session For Current Directory", "<CMD>SessionRestore<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", ":qa<CR>"),
		}
		local greeting
		local current_hour = tonumber(os.date("%H"))
		if current_hour < 5 then
			greeting = "  🌙  Good night!"
		elseif current_hour < 12 then
			greeting = "  🌄  Good morning!"
		elseif current_hour < 17 then
			greeting = "  ☕  Good afternoon!"
		elseif current_hour < 20 then
			greeting = "  🌙  Good evening!"
		else
			greeting = "  🌙  Good night!"
		end
		ascii_art_lines = read_ascii_art(config_path .. "/alpha_footer.txt")
		table.insert(ascii_art_lines, greeting)

		dashboard.section.footer.val = ascii_art_lines
		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
	end,
}
