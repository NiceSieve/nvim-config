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
		event='VeryLazy',
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
	},
	{
		'chrisbra/NrrwRgn',
		event='VeryLazy',
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
		keys={{'<leader>g', function() require('neogit').open() end}},
	},
	{'numToStr/Comment.nvim', opts={}},
}
