--Maximizes and restores the current window in Vim.
--https://github.com/declancm/maximize.nvim

return {
  'declancm/maximize.nvim',
  config = true,
  keys = {
  { "<leader>sm","<cmd>Maximize<CR>",desc = "Maximize/minimize a split"},
  },
}
