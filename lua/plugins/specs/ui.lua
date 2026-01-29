return {
	{ -- colorscheme
		"Mofiqul/dracula.nvim"
	},
	{ -- fuzzy menu
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim', build='make'}
		},
		keys = {
			{'<leader>ff', '<cmd>Telescope find_files<cr>'},
			{'<leader>fg', '<cmd>Telescope live_grep<cr>'},
			{'<leader>fb', '<cmd>Telescope buffers<cr>'},
			{'<leader>fh', '<cmd>Telescope help_tags<cr>'},
			{'<leader>fy', '<cmd>Telescope neoclip default<cr>'},
		},
		config = function()
			local telly = require('telescope')
			telly.setup({
				extensions = {
					fzf = {
						fuzzy = true,                    -- false will only do exact matching
						override_generic_sorter = true,  -- override the generic sorter
						override_file_sorter = true,     -- override the file sorter
						case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
					}
			}})
			telly.load_extension('fzf')
		end
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {"nvim-telescope/telescope.nvim"},
		keys = {{'<leader>fe', '<cmd>Telescope file_browser<cr>'}},
	},
	{ -- clipboard manager
		"AckslD/nvim-neoclip.lua",
		opts={},
		dependencies={
			{'kkharji/sqlite.lua', module = 'sqlite'},
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies={"nvim-tree/nvim-web-devicons"},
		opts={
			options={
				theme='dracula-nvim'
			},
			sections={
				lualine_b={'diagnostics'},
				lualine_c={
					{
						'filename',
						path=2
					}
				},
				lualine_x={},
				lualine_y={
					'filetype'
				}
			},
			tabline={
				lualine_a = {'buffers'},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {'tabs'}
			},
			extensions={'quickfix'}
		} 
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				command_palette = true,
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	}
}
