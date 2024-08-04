-- telescope Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim
return {
  event = 'VimEnter',
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
      {
      'nvim-telescope/telescope-fzf-native.nvim', 
      build = 'make', --is used to run some commands as plugin is installed or updated not everytime
      --cond is used to detrmine whether the plugin shoudl be installed or loaded (condition)
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- useful for getting nice icons need to have a nerd font to enable :) 
    {'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },--dependencies
    config = function()

      local telescope = require('telescope')
      local actions = require('telescope.actions')

      require('telescope').setup ({
        -- You can put your default mappings / updates / etc. in here
        defaults = {
          path_display = {"smart"},
          mappings = {
            i = { -- these are for insert mode selections in telescope 
              ['<c-k>'] = actions.move_selection_previous, --prev result
              ['<c-j>'] = actions.move_selection_next, --prev result
              ['<c-q>'] = actions.send_selected_to_qflist + actions.open_qflist, 
          },
         },
        },
      })
      telescope.load_extension('fzf')

      local keymap = vim.keymap -- thanks Josean again

      keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = '[F]ind [F]iles fuzzily' })
      keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = '[F]ind [R}ecent files fuzzily' })
      keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = '[F]ind [S]tring in cwd' })
      keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = '[F]ind [C]ursor string in cwd'})
    end,
}

