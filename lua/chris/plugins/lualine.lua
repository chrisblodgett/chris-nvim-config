-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim
local function maximize_status()
  return vim.t.maximized and '   ' or ''
end
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") 
      local colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#112638",
        inactive_bg = "#2c3043",
      }
      local my_lualine_theme = 
      {
        normal = {
          a = {bg = colors.blue, fg=colors.bg, gui="bold"},
          b = {bg = colors.bg, fg = colors.fg },
          c = {bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = {bg = colors.green, fg=colors.bg, gui="bold"},
          b = {bg = colors.bg, fg = colors.fg },
          c = {bg = colors.bg, fg = colors.fg },
        },
       visual = {
          a = {bg = colors.violet, fg=colors.bg, gui="bold"},
          b = {bg = colors.bg, fg = colors.fg },
          c = {bg = colors.bg, fg = colors.fg },
        },
       command = {
          a = {bg = colors.yellow, fg=colors.bg, gui="bold"},
          b = {bg = colors.bg, fg = colors.fg },
          c = {bg = colors.bg, fg = colors.fg },
        },
      }
      lualine.setup({ 
        options = {
          theme = my_lualine_theme
        },
        sections = {
          lualine_x = { -- x section of lua line
            {
              lazy_status.updates, -- the component to show pendign updates
              cond = lazy_status.has_updates, -- only show up if there are updates
              color = {fg = "#ff9e64"}, 
            },
            {"encoding"},
            {"fileformat"},
            {"filetype"},
          },
          lualine_c = 
        {
            {maximize_status},
        },
        },
      })
    end,
}
