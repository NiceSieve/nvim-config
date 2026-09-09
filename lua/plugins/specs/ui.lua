return {
	{ -- colorscheme
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				diffview = true,
				lualine = {
					all = function(colors)
						return {
							normal = {
								a = { bg = colors.lavender },
								b = { fg = colors.lavender },
							}
						}
					end,
				},
				noice = true,
				which_key = true,
			}
		}
	},
	{
		"folke/snacks.nvim",
		priority = 500,
		lazy = false,
		opts = {
			bufdelete = { enabled = true },
			explorer = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
		},
		dependencies = {
			"nvim-mini/mini.icons",
			config = function()
				require('mini.icons').setup()
				MiniIcons.mock_nvim_web_devicons()
			end,
		},
		keys = {
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
			{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
			{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
			{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		opts={
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
		}
	},
	{
		'stevearc/oil.nvim',
		opts = {
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-mini/mini.icons" }, -- use if you prefer nvim-web-devicons
		lazy = false,
},
}
