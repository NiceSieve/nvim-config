require('lualine').setup{
	options={
		theme='onedark'
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
