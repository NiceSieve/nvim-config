require 'nvim-treesitter.configs'.setup {
	ensure_installed = {'lua', 'c', 'cpp', 'python', 'perl', 'vim', 'sql'},
	highlight = {
		enable = true,
		custom_captures = {
			-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
			-- ["foo.bar"] = "Identifier",
		},
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ap"] = "@block.outer",
				["ip"] = "@block.inner",
			},
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			-- init_selection = "<leader>r",
			node_incremental = "+",
			-- scope_incremental = "<leader>rc",
			node_decremental = "-",
		},
	},
	matchup = {
		enable = true
	},
	endwise = {
		enable = true
	}
}
