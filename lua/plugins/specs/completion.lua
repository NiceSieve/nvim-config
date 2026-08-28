vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuPositionUpdate",
	callback = function()
		if vim.fn.mode() ~= "c" then
			return
		end

		local ok, cmdline = pcall(require, "noice.ui.cmdline")
		local cmd_win = ok and cmdline.win()
		if not cmd_win or not vim.api.nvim_win_is_valid(cmd_win) then
			return
		end
		local cmd_cfg = vim.api.nvim_win_get_config(cmd_win)

		local ok_menu, menu = pcall(require, "blink.cmp.completion.windows.menu")
		if ok_menu and menu.win and menu.win:is_open() then
			pcall(function() menu.win:set_win_config({relative="win",row=cmd_cfg.row+cmd_cfg.height, col=-2, width=cmd_cfg.width+2, win=cmd_win, anchor="NW"}) end)
		end
	end,
})

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
	version = '1.*',
	event = 'VeryLazy',
}
