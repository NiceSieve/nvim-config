vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
});
return {{
		'nvim-treesitter/nvim-treesitter',
		build=':TSUpdate',
		branch='main',
		config=function()
			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
				and require("ts_context_commentstring.internal").calculate_commentstring()
				or get_option(filetype, option)
			end
		end 
	},
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
		event = "VeryLazy",
	},
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		branch='main',
		event = "VeryLazy",
	},
	{ -- autopairs for lua
		'RRethy/nvim-treesitter-endwise',
	},
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		event = "VeryLazy",
		config = function()
			require('ts_context_commentstring').setup {
				enable_autocmd = false,
			}
			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
				and require("ts_context_commentstring.internal").calculate_commentstring()
				or get_option(filetype, option)
			end
		end
	},
}
