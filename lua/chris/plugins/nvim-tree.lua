--A file explorer tree for neovim written in lua
--https://github.com/nvim-tree/nvim-tree.lua

return {
"nvim-tree/nvim-tree.lua",

 lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    indent_markers = {
      enable = true,
      },
       icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
  filters = {
    dotfiles = true,
  },
  actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = { -- show files that are ignored by git 
        ignore = false,
      },
})
--set the keymaps before we return 
--
local keymap = vim.keymap -- same shortcut for conciseness


 keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {desc="Toggle file explorer"})
      keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {desc="Toggle file explore on current file"})
      keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {desc="Collapse file explore"})
      keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {desc="Refresh file explorer"})

  end

}



