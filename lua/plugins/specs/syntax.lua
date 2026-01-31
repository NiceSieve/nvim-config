return {
	'nvim-treesitter/nvim-treesitter',
	build=':TSUpdate',
	branch='main',
	dependencies={
		{
			'romgrk/nvim-treesitter-context', 
			opts = { -- show context at top
				enable=true,
				multiwindow=true,
				mode='topline',
			},
			init = function()
				vim.cmd "hi TreesitterContextBottom gui=underline guisp=Purple"
				vim.cmd "hi TreesitterContextLineNumberBottom gui=underline guisp=Purple"
			end,
		},
		{'nvim-treesitter/nvim-treesitter-textobjects',
			branch='main'
		},
		{'RRethy/nvim-treesitter-endwise'}, -- autopairs for lua
		{'JoosepAlviste/nvim-ts-context-commentstring', opts={enable_autocmd=false}},
	},
	config=function()
		local get_option = vim.filetype.get_option
		vim.filetype.get_option = function(filetype, option)
			return option == "commentstring"
			and require("ts_context_commentstring.internal").calculate_commentstring()
			or get_option(filetype, option)
		end
	end 
}
