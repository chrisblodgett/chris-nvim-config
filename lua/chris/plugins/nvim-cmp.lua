--A completion plugin for neovim coded in Lua.
--https://github.com/hrsh7th/nvim-cmp

return {
	"hrsh7th/nvim-cmp", -- this is the github repo for nvim-cmp
	event = "InsertEnter", -- this event only runs when you enter insert mode
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load() --vscode stype snips installed plugins
			end,
		},
		"saadparwaiz1/cmp_luasnip",
		-- Adds other completion capabilities.
		--  nvim-cmp does not ship with all sources by default. They are split
		--  into multiple repos for maintenance purposes.
		"hrsh7th/cmp-nvim-lsp", -- this repo is for lsp cmp
		"hrsh7th/cmp-path", -- this repo is for cmp path  completion
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"onsails/lspkind.nvim", --vs-code like pictograms :)
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		luasnip.config.setup({})
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "menu", "abbr", "kind" },
				--fields = {cmp.ItemField.Menu,cmp.ItemField.Abbr,cmp.ItemField.Kind,cmp.ItemField.Source},
				expandable_indicator = true,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					max_width = 50,
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					symbol_map = { Copilot = "" },
					before = function(entry, vim_item) --this function is called before modifications from lspkind so we can control pop customization
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							nvim_lua = "[Nvim Lua]",
							buffer = "[Buffer]",
							path = "[Path]",
							copilot = "[Copilot]",
							--marksman = "[Marksman]",
						})[entry.source.name]
						return vim_item
					end,
				}),
			},
			--completion = { completeopt = 'menu,menuone,preview,noiselect' }, -- completion options
			--
			completion = { completeopt = "menu,menuone,noinsert" }, -- completion options
			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),
				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				--['<C-y>'] = cmp.mapping.confirm { select = true },
				-- If you prefer more traditional completion keymaps,
				-- you can uncomment the following lines
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				--['<Tab>'] = cmp.mapping.select_next_item(),
				--['<S-Tab>'] = cmp.mapping.select_prev_item(),
				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),
				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			}),
			sources = {
				--{ name = 'copilot', group_index = 2 },
				-- {
				--- name = 'lazydev',
				-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
				-- group_index = 0,
				-- },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
				{ name = "path", group_index = 2 },
				{ name = "buffer", group_index = 2 },
			},
		})
	end,
}
