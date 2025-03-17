return {
	{
		'svermeulen/vim-NotableFt',
		keys={'f','F','t','T'},
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
		keys={{'<leader>u', '<cmd>UndotreeToggle<cr>'}},
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
	}
}
