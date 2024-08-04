return {
  'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
-- Set header
local function read_ascii_art(file_path)
    local lines = {}
    for line in io.lines(file_path) do
        table.insert(lines, line)
    end
    return lines
end
local config_path = vim.api.nvim_call_function('stdpath', {'config'})
local file_path = config_path .. "/alpha_header.txt"
local ascii_art_lines = read_ascii_art(file_path)
dashboard.section.header.val = ascii_art_lines
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "󰥨  > Find file", ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "󰈆  > Quit NVIM", ":qa<CR>"),
}
    local greeting
    local current_hour = tonumber(os.date "%H")
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
dashboard.section.footer.val = read_ascii_art(config_path .. "/alpha_footer.txt")
-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
end,
}
