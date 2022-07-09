require('Comment').setup({
	toggler = {
		---Line-comment toggle keymap
		line = '<leader>cc',
		---Block-comment toggle keymap
		block = '<leader>CC',
	},
	opleader = {
		---Line-comment keymap
		line = '<leader>c',
		---Block-comment keymap
		block = '<leader>C',
	},
	extra = {
		---Add comment on the line above
		above = '<leader>cO',
		---Add comment on the line below
		below = '<leader>co',
		---Add comment at the end of line
		eol = '<leader>cA',
	},
})
