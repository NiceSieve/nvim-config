local o = vim.opt

o.number = true --line numbers
o.relativenumber = true --relative line numbers
o.cursorline = true --mark current line
o.inccommand = "split" --incremental :s preview
o.undofile = true --remember undo history
o.hidden = true --don't close buffers when opening another
o.list = true --show whitespace
o.tabstop = 4 --tab size
o.shiftwidth = 0 --follow tabstop
o.wrap = false -- nice for text, but makes code unreadable

-- search configs
o.incsearch = true  -- incremental search
o.ignorecase = true -- case insensitive
o.wildignorecase = true -- case insensitive completion too

vim.g.mapleader = ' ' -- space is the leader cuz it's the biggest
vim.g.maplocalleader = "\\"
o.timeout = false -- I'm slow
o.updatetime = 200
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>') -- exit term mode easier
vim.keymap.set('n', '<Esc>', function() vim.fn.setreg("/", nil) end) -- clear search results
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- load plugins
require("plugins.lazy")

vim.cmd "colorscheme dracula"

vim.lsp.enable('clangd')

if vim.g.neovide then
	vim.o.guifont = "Input Mono:h13"
end
