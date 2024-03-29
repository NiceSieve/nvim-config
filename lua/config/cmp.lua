vim.opt.completeopt='menu,menuone,noselect'
local cmp = require'cmp'
local luasnip = require'luasnip'

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}
function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-n>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end,{ 'i', 'c' }),
		['<C-p>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-0)
				else
					fallback()
				end
			end, { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, -- for LSP
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'nvim_lua' }
	},{
		{ name = 'calc' }
	},{
		{
			name = 'buffer',
			option = {
				get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end
			}
		},
		{ name = 'path' }
	}),
	formatting = {
		  format = function(entry, vim_item)
			  -- Kind icons
			  vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			  -- Source
			  vim_item.menu = ({
				  buffer = "[buff]",
				  nvim_lsp = "[LSP]",
				  luasnip = "[snip]",
				  nvim_lua = "[lua]",
				  latex_symbols = "[LaTeX]",
				  cmdline_history = "[hist]",
				  cmdline = "[cmd]",
				  calc = "[calc]",
				  path = "[path]",
			  })[entry.source.name]
			  return vim_item
		  end
	  }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
cmp.setup.cmdline('?', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline_history' },
		{ name = 'cmdline' }
	},{
		{ name = 'buffer' }
	})
})
