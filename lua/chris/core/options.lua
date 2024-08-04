-- DEFAULT OPTIONS FOR MY NVIM SETUP :)
vim.cmd("let g:netrw_liststyle = 3") --make the default file manager ttree style 

-- this just makes it so you don't have to type vim.opt everytime, for conciseness
local opt = vim.opt

--make line numbers default, and relative numbers
opt.number = true
opt.relativenumber = true

-- indicate yes I have nerd font installed 
vim.g.have_nerd_font = true

-- turn off word wrap
opt.wrap = true

--enable mouse mode 
opt.mouse = 'a'

-- use case insensitive searching unless one more more capital letters then search is sensitive
opt.ignorecase = true
opt.smartcase = true

-- enable break indent
opt.breakindent = true

 -- we have a plugin that can do all the tab and shift width stuff 
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

 -- don't show the mode since it already is in the status line
opt.showmode = false

-- show which line the cursor is on 
opt.cursorline = true

 --for tokyonight colorscheme to work 
opt.termguicolors = true

-- give a column for git signs etc.
opt.signcolumn = 'yes'

--decrease the update time :) 
opt.updatetime = 250 

--minimal number of lines to keep above and below the cursor
opt.scrolloff = 8 

 --use system clipboard when yanking
opt.clipboard:append("unnamedplus")

--configure how neovim displays whitespace chars
opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

