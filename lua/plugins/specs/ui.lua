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
		event = "TextYankPost",
		keys = {{'<leader>fy', '<cmd>Telescope neoclip default<cr>'}},
		opts={
			enable_persistent_history = true,
		},
		dependencies={
			{'kkharji/sqlite.lua', module = 'sqlite'},
			{"nvim-telescope/telescope.nvim"},
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
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
		"rachartier/tiny-cmdline.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.cmdheight = 0
		end,
		config = function()
			require("vim._core.ui2").enable({})
			require("tiny-cmdline").setup({
				highlighter = true,
				on_reposition = require("tiny-cmdline").adapters.blink,
				native_types = {},
				position = { y = "10%" },
			})
			-- Fetch the live colors table directly from the plugin module
			local dracula_colors = require("dracula").colors()

			-- Apply those plugin values directly to your custom highlight groups
			vim.api.nvim_set_hl(0, "TinyCmdlineNormal", { bg = dracula_colors.menu }) 
			vim.api.nvim_set_hl(0, "CmdlineCommand", { fg = dracula_colors.purple, bg = dracula_colors.menu, bold = true }) 
			vim.api.nvim_set_hl(0, "CmdlineSearch",  { fg = dracula_colors.cyan, bg = dracula_colors.menu, bold = true }) 

			local blink_cmdline_sync = vim.api.nvim_create_augroup("BlinkCmdlineColorSync", { clear = true })

			vim.api.nvim_create_autocmd("CmdlineEnter", {
				group = blink_cmdline_sync,
				callback = function()
					-- Safely acquire live values from the theme
					local colors = require("dracula").colors()
					local current_mode = vim.fn.getcmdtype()

					if current_mode == ":" then
						-- Re-link tiny-cmdline explicitly to the active theme palette
						vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { link = "CmdlineCommand" })
						vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "CmdlineCommand" })

					elseif current_mode == "/" or current_mode == "?" then
						-- Re-link search UI elements explicitly to the active theme palette
						vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { link = "CmdlineSearch" })
						vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "CmdlineSearch" })
					end
				end,
			})

			-- Revert border rules back to normal when exiting command mode
			vim.api.nvim_create_autocmd("CmdlineLeave", {
				group = blink_cmdline_sync,
				callback = function()
					vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuPositionUpdate",
				callback = function()
					if vim.fn.mode() ~= "c" then
						return
					end

					local ok_ui2, ui2 = pcall(require, "vim._core.ui2")
					local cmd_win = ok_ui2 and ui2.wins and ui2.wins.cmd
					if not cmd_win or not vim.api.nvim_win_is_valid(cmd_win) then
						return
					end
					local cmd_cfg = vim.api.nvim_win_get_config(cmd_win)

					local ok_menu, menu = pcall(require, "blink.cmp.completion.windows.menu")
					if ok_menu and menu.win and menu.win:is_open() then
						pcall(function() menu.win:set_width(cmd_cfg.width) end)
						pcall(function() menu.win:set_win_config({relative="editor", row=vim.g.ui_cmdline_pos[1], col=cmd_cfg.col}) end)
					end
				end,
			})
		end,
	}
}
