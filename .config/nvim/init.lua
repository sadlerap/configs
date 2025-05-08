vim.uv = vim.uv or vim.loop

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.o.number = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = "Lazy",
    callback = function (args)
        vim.api.nvim_set_option_value("number", "false", { buf = args.buf })
    end,
})

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.encoding = utf8

-- Highlight cursor line
vim.o.cursorline = true

-- Automagically indent as needed
vim.o.autoindent = true

-- mouse mode everywhere
vim.o.mouse = 'a'

vim.o.undofile = true
vim.o.undodir = vim.fs.normalize('~/.vim/undo/')

vim.o.showmode = false

vim.o.termguicolors = true

vim.o.grepprg = 'rg --vimgrep'

vim.o.hidden = true

vim.o.completeopt = "menu,menuone,noinsert,preview"

vim.cmd([[colorscheme base16-tomorrow-night]])

vim.keymap.set({ 'i' }, 'jj', '<ESC>', { noremap = true })
vim.keymap.set({ 'c' }, 'w!!', 'w !sudo tee > /dev/null %')
vim.keymap.set({ 'n' }, '<C-l>', ':nohl<CR><C-l>', { noremap = true })
