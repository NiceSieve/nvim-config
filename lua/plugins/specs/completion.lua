return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = {
		'rafamadriz/friendly-snippets',
		-- luasnip is bigger than I need, but I'll keep a note here
		-- { 
		-- 'L3MON4D3/LuaSnip', version = 'v2.*',
		-- -- install jsregexp (optional!:).
		-- build = "make install_jsregexp"
		-- dependencies = {'honza/vim-snippets'},
		-- config = function
			-- require("luasnip.loaders.from_snipmate").lazy_load()
		-- end
		-- },
	},
	opts = {
		keymap = {
			preset = 'enter',
		},
		completion = {
			keyword = {
				range = 'full',
			},
			ghost_text = {
				enabled = true
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
		},
		cmdline = {
			keymap = {
				preset = 'inherit'
			},
			completion = {
				ghost_text = { enabled = true },
				menu = {
					auto_show = true,
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
			},
		},
		sources = {
			providers = {
				-- show buffer completions even when LSP
				lsp = { fallbacks = {} },
			}
		},
	},
	event = {'InsertEnter', 'CmdlineEnter'},
	version = '1.*',
}

