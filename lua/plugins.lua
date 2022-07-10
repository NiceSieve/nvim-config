return require('packer').startup({
	function()
		use 'wbthomason/packer.nvim'
		use 'lewis6991/impatient.nvim'
		use {'dstein64/vim-startuptime', cmd='StartupTime'}

		use {'machakann/vim-sandwich', keys='s'}
		use 'bogado/file-line'
		use {'jghauser/mkdir.nvim', event='BufWritePre'}
		use 'wellle/targets.vim'
		use {'numToStr/Comment.nvim',
				config = function() require('config.comment') end,
				keys = {'<leader>c', '<leader>C'}
			}

		use {'nvim-lualine/lualine.nvim',
				config = function()
					require('lualine').setup{options={theme='onedark'}}
				end
			}
		use {'norcalli/nvim-base16.lua',
				config = function()
					local base16 = require('base16')
					base16(base16.themes['onedark'], true)
				end
			}

		use {'nvim-treesitter/nvim-treesitter',
				requires={
					'romgrk/nvim-treesitter-context',
					'nvim-treesitter/nvim-treesitter-textobjects'
				},
				run=':TSUpdate',
				config=function() require('config.treesitter') end
			}

		use {'nvim-telescope/telescope.nvim',
				requires={
					'nvim-lua/plenary.nvim',
					{'nvim-telescope/telescope-fzf-native.nvim', run='make'},
				},
				cmd='Telescope',
				config=function() require('telescope').load_extension('fzf') end
			}

		use {'hrsh7th/nvim-cmp',
				requires={
					{'hrsh7th/cmp-buffer', after='nvim-cmp'},
					{'hrsh7th/cmp-path', after='nvim-cmp'},
					{'hrsh7th/cmp-cmdline', after='nvim-cmp'},
					{'hrsh7th/cmp-calc', after='nvim-cmp'},
					{'hrsh7th/cmp-nvim-lua', after='nvim-cmp'},
					{'dmitmel/cmp-cmdline-history', after='nvim-cmp'},
					-- 'tamago324/cmp-zsh',
					{'L3MON4D3/LuaSnip',
						config = function()
							require("luasnip.loaders.from_snipmate").lazy_load()
						end,
						after='nvim-cmp'
					},
					{'saadparwaiz1/cmp_luasnip', after='LuaSnip'},
					{'honza/vim-snippets', after='LuaSnip'}
				},
				config = function() require('config.cmp') end,
				event = {'InsertEnter *', 'CmdlineEnter *'}
			}
		use {'chrisbra/NrrwRgn', keys='<leader>nr'}
		use {'kyazdani42/nvim-web-devicons', after={'nvim-cmp','telescope.nvim'}}
		use {
			  'mbbill/undotree',
			  cmd = 'UndotreeToggle',
			  config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
		}
		use { 'TimUntersberger/neogit', cmd = 'Neogit' }
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		}
	}
})
