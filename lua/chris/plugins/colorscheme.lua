-- COLOR SCHEME STUFF tokyho night is cool 
return {

    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm','tokyonight-night' 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      --vim.keymap.set('n', '<leader> ', ':colorscheme tokyonight-day<CR>', { noremap = true, silent = true, desc = 'Change colorscheme to Tokyo Night Day' })
      -- set some keymaps for switching the themes
      -- You can configure highlights by doing something like:
    end,
}
