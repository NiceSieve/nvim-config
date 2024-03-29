require('impatient')
local o = vim.opt

o.number = true --line numbers
o.inccommand = "split" --incremental :s preview
o.undofile = true --remember undo history
o.hidden = true --don't close buffers when opening another
o.list = true --show whitespace
o.tabstop = 4 --tab size
o.shiftwidth = 0 --follow tabstop
o.wrap = false -- nice for text, but makes codn unreadable

-- terminal bettering settings
o.mouse = "a"
o.termguicolors = true

-- search configs
o.incsearch = true  -- incremental search
o.ignorecase = true -- case insensitive
o.wildignorecase = true -- case insensitive completion too

vim.g.mapleader = ' ' -- space is the leader cuz it's the biggest
o.timeout = false -- I'm slow
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>') -- exit term mode easier
vim.keymap.set('n', '<Esc>', function() vim.fn.setreg("/", nil) end) -- clear search results

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fy', '<cmd>Telescope neoclip default<cr>')

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')
vim.keymap.set('n', '<leader>a', '<cmd>ArgWrap<cr>')
vim.keymap.set('n', '<leader>g', function() require('neogit').open() end)

vim.api.nvim_create_autocmd("BufWritePost",
	{
		group=vim.api.nvim_create_augroup('packer_user_config', {clear=true}),
		pattern='plugins.lua',
		callback=function(t)
			dofile(t.file)
			require'packer'.sync()
		end
	}
)
