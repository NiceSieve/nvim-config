require('impatient')
local o = vim.opt

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
	'black',
	'gzip',
	'python3_provider',
	'tarPlugin',
	'tar',
	'zipPlugin',
	'zip',
}

for i = 1, #(disabled_built_ins) do
	vim.g['loaded_' .. disabled_built_ins[i]] = true
end

o.number = true --line numbers
o.inccommand = "split" --incremental :s preview
o.undofile = true --remember undo history
o.hidden = true --don't close buffers when opening another
o.list = true --show whitespace
o.tabstop = 4 --tab size
o.shiftwidth = 0 --follow tabstop

-- terminal bettering settings
o.mouse = "a"
o.termguicolors = true

-- search configs
o.incsearch = true
o.ignorecase = true
o.wildignorecase = true

vim.g.mapleader = ' '
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>')
vim.keymap.set('n', '<Esc>', function() vim.fn.setreg("/", nil) end)

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])