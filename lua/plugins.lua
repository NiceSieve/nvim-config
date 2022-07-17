return require('packer').startup({
	function()
		use 'wbthomason/packer.nvim' -- plugin manager
		use {'nvim-lua/plenary.nvim', module='plenary'} -- dependency
		-- Performance:
		use 'lewis6991/impatient.nvim' -- lua cache
		use {'dstein64/vim-startuptime', cmd='StartupTime'} -- profiling
		use "nathom/filetype.nvim" -- faster builtin replacement
		-- Editing:
		use {'machakann/vim-sandwich', keys='s'} -- surround text
		use 'wsdjeg/vim-fetch' -- open files with line/column
		use {'svermeulen/vim-NotableFt', keys={'f','F','t','T'}} -- multiline, case insensitive, smart f/t
		use {'jghauser/mkdir.nvim', event='BufWritePre'} -- be able to edit files in nonexistent dirs
		use 'wellle/targets.vim' -- smarter lookahead text objects
		use {'andymass/vim-matchup', -- smart pair highlighting and %
				config=function()
					vim.g.matchup_matchparen_offscreen = {method="popup", fullwidth=1, border=1}
				end
			}
		use {"windwp/nvim-autopairs", -- auto close parens etc.
				config = function() require("nvim-autopairs").setup {} end,
				event = 'InsertEnter'
			}
		use {'numToStr/Comment.nvim', -- comment and uncomment code
				config = function() require('config.comment') end,
				keys = {'<leader>c', '<leader>C'}
			}
		use {'FooSoft/vim-argwrap', -- turn lines into columns
				cmd="ArgWrap"
			}
		use {'chrisbra/NrrwRgn', keys='<leader>nr'} -- create new buffer of just this area
		use {'mbbill/undotree', -- visualize undo tree
				cmd = 'UndotreeToggle',
				config = function() vim.g.undotree_SetFocusWhenToggle = 1 end
			}
		use {'kevinhwang91/nvim-bqf', ft = 'qf'} -- nicer quickfix buffer
		use {'TimUntersberger/neogit', module = 'neogit'} -- git frontend
		-- Looks
		use {'nvim-lualine/lualine.nvim', -- statusline
				config = function() require('config.line') end
			}
		use {'norcalli/nvim-base16.lua', -- color scheme
				config = function()
					local base16 = require('base16')
					base16(base16.themes['onedark'], true)
				end
			}
		use {'kyazdani42/nvim-web-devicons', after={'nvim-cmp','telescope.nvim'}} -- pretty icons
		-- Syntax handling
		use {'nvim-treesitter/nvim-treesitter',
				requires={
					'romgrk/nvim-treesitter-context', -- show context at top
					'nvim-treesitter/nvim-treesitter-textobjects',
					{'RRethy/nvim-treesitter-endwise', event='InsertEnter'} -- autopairs for lua
				},
				run=':TSUpdate',
				config=function() require('config.treesitter') end
			}
		-- Fuzzy menu
		use {'nvim-telescope/telescope.nvim',
				requires={
					{'nvim-telescope/telescope-fzf-native.nvim', -- faster backend
						run='make',
						module='telescope'
					},
				},
				cmd='Telescope',
				config=function() require('telescope').load_extension('fzf') end
			}
		use {"AckslD/nvim-neoclip.lua", -- clipboard history
				requires='telescope.nvim',
				config = function()
					require('neoclip').setup()
				end,
				after='telescope.nvim'
			}
		-- Completion
		use {'hrsh7th/nvim-cmp',
				requires={
					{'hrsh7th/cmp-buffer', after='nvim-cmp'}, -- search in buffer(s)
					{'hrsh7th/cmp-calc', after='nvim-cmp'}, -- do maths
					{'hrsh7th/cmp-cmdline', after='nvim-cmp'}, -- complete commands
					{'hrsh7th/cmp-nvim-lua', after='nvim-cmp'}, -- nvim lua API
					{'hrsh7th/cmp-nvim-lsp', after='nvim-cmp', disable=true}, -- LSP, when I do that
					{'hrsh7th/cmp-path', after='nvim-cmp'}, -- complete paths
					{'dmitmel/cmp-cmdline-history', after='nvim-cmp'}, -- command history
					-- 'tamago324/cmp-zsh', -- shell completion, looking into
					{'L3MON4D3/LuaSnip', -- snippet engine
						config = function()
							require('luasnip').filetype_extend("all", { "_" })
							require("luasnip.loaders.from_snipmate").lazy_load()
						end,
						after='nvim-cmp',
						requires={'honza/vim-snippets', after='LuaSnip'} -- snippet collection
					},
					{'saadparwaiz1/cmp_luasnip', after='LuaSnip'} -- snippet completion
				},
				config = function() require('config.cmp') end,
				event = {'InsertEnter *', 'CmdlineEnter *'}
			}
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		}
	}
})
