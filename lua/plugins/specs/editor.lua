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
		'nvim-mini/mini.surround',
		config=true,
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
		'Wansmer/treesj',
		keys={{'<leader>a', '<cmd>TSJToggle<cr>'}},
		opts={
			use_default_keymaps = false,
		}
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
	{
		'Shatur/neovim-tasks',
		cmd = "Task",
		opts={},
	},
	{ -- clipboard manager
		"gbprod/yanky.nvim",
		event = "TextYankPost",
		keys = {
			{'<leader>fy', '<cmd>Telescope yank_history<cr>'},
			{ "<leader>p", "<cmd>YankyRingHistory<cr>", mode = { "n", "x" }, desc = "Open Yank History" },
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor and leave cursor after" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor and leave cursor after" },
			{ "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
			{ "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
			{ "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
			{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
			{ "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
			{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
			{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
			{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
			{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
			{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
			{ "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
			{ "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
		},
		opts={
			ring = {
				history_length = 1000,
				storage = "sqlite",
			}
		},
		dependencies={
			{'kkharji/sqlite.lua', module = 'sqlite'},
			{"nvim-telescope/telescope.nvim"},
		}
	},
}
