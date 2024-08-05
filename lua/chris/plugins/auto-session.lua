-- A small automated session manager for Neovim
-- https://github.com/rmagatti/auto-session

return {

  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require('auto-session').setup({
      auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      auto_restore_enabled = false
    })
      local keymap = vim.keymap
      -- keymaps for workspace session saving and restoring
      keymap.set("n", "<leader>wr","<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore session 

      keymap.set("n", "<leader>ws","<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- restore session 
  end,


}
