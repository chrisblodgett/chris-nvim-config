-- global autocmd that trigger things and yeah...
--
-- a friendly reminder to try to make things Etc (easy to change )
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   desc =  'reminder that code should be easy to change',
--   group = vim.api.nvim_create_augroup('pragmatic-programmer-etc-reminder', { clear = true }),
--   pattern = '*',
--   callback = function()
--   vim.notify('Etc?') -- print Etc (easy to change?) reminder on save
--   end,
-- })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
