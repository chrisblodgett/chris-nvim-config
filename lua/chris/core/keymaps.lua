-- the global keymaps of course
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- thanks Josean :>

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear highlights on search when pressing esc in normal mode
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

--window and buffer management

-- using leader s to control splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current Split" })

-- using control+movement to change window focus
--  See `:help wincmd` for a list of all window commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- buffer movement
keymap.set("n", "<leader>n", ":bn<CR>", { desc = "Next Buffer" })
keymap.set("n", "<leader>p", ":bp<CR>", { desc = "Previous Buffer" })
keymap.set("n", "<leader>X", ":bd<CR>", { desc = "Close Buffer" })
keymap.set("n", "<leader>N", "<cmd>enew<CR>", { desc = "New Buffer" })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
