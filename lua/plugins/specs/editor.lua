return {
	{
		"folke/flash.nvim",
		event="VeryLazy",
		opts={
			modes={
				char={
					highlight={
						backdrop=false,
					},
				},
			},
		},
		keys={
			{ "gs", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
			{ "s", mode = { "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		}
	},
	{
		"folke/which-key.nvim",
		event="VeryLazy",
		opts={win={border='single'}},
	},
	{ -- surround text with stuff
		'machakann/vim-sandwich',
		keys='s',
	},
	{ -- auto close parens etc.
		"windwp/nvim-autopairs",
		event='InsertEnter',
		opts={},
	},
	{ -- open files with line/column
		'wsdjeg/vim-fetch',
	},
	{ -- be able to edit files in nonexistent dirs
		'jghauser/mkdir.nvim',
		event='BufWritePre',
	},
	{ -- smarter lookahead text objects
		'wellle/targets.vim',
		event='VeryLazy',
	},
	{ -- visual undo tree
		'mbbill/undotree',
		init=function() vim.g.undotree_SetFocusWhenToggle = 1 end,
		keys={{'<leader>u', '<cmd>UndotreeToggle<cr>', desc="Open Undo Tree"}},
	},
	{ -- turn lines into columns
		'FooSoft/vim-argwrap',
		keys={{'<leader>a', '<cmd>ArgWrap<cr>'}},
	},
	{ -- better quickfix window
		'kevinhwang91/nvim-bqf',
		ft = 'qf',
		keys={
			{
				'<leader>cc',
				function()
					local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
					if qf_winid > 0
					then vim.cmd 'cclose'
					else vim.cmd 'copen'
					end
				end,
				desc="Toggle quickfix list"
			},
			{'<leader>cn', ':cnext<CR>'},
			{'<leader>cp', ':cprev<CR>'},
		}
	},
	{
		'stevearc/quicker.nvim',
		ft = "qf",
		opts = {},
	},
	{
		'chrisbra/NrrwRgn',
		keys = {
			{'<leader>nr', mode='v'},
			{'<leader>nd', '<cmd>NR<CR>', ft='diff'},
		},
		cmd = {'NR', 'NUD'},
	},
	{
		'andymass/vim-matchup',
		init=function()
			vim.g.matchup_matchparen_offscreen = {method="popup", fullwidth=1}
		end,
	},
	{
		'NeogitOrg/neogit',
		opts={},
		keys={{'<leader>gg', function() require('neogit').open() end}},
		dependencies={
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		}
	},
	{
		'FabijanZulj/blame.nvim',
		opts={},
		keys={{'<leader>gb', ':BlameToggle<CR>'}},
	},
	{'Shatur/neovim-tasks',
		cmd = "Task",
		opts={},
	},
}
