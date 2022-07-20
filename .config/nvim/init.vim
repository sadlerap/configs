" Vim/Neovim init file
" Writen by Andy Sadler

" -----------------------------------------------------------------------------
" ---------------------------------VS Codium-----------------------------------
" -----------------------------------------------------------------------------

if !exists('g:vscode')

" -----------------------------------------------------------------------------
" ---------------------------------Plugins-------------------------------------
" -----------------------------------------------------------------------------
" Specify a location for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Colorscheme stuff
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Airline - Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Completion framework
" if has('nvim')
"     " For nvim
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     " For vim
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Ctags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Directory management
Plug 'tpope/vim-vinegar'

" Comments
Plug 'tpope/vim-commentary'

" Auto-close delimiters
Plug 'Raimondi/delimitMate'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" DevIcons
Plug 'ryanoasis/vim-devicons'

" =================Languages================

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'

" Tree Sitter (semantic highlighting for languages)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" (La)TeX
Plug 'lervag/vimtex', { 'for': 'tex' }

" Rust
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'

Plug 'zchee/deoplete-jedi', { 'for': 'python' }

call plug#end()

" -----------------------------------------------------------------------------
" --------------------------------Settings-------------------------------------
" -----------------------------------------------------------------------------

" Set correct encoding
set encoding=utf8

" Line numbers
set number

" Enable mouse mode
set mouse=a

" Solve the tabs/spaces argument
set expandtab
set tabstop=4
set shiftwidth=4

" Automagically indent as needed
set autoindent

" Highlight cursor line
set cursorline

" Code folding
set foldmethod=syntax

" Highlight matches
set hlsearch

" Highlight [{()}]
set showmatch

" Show last command run
set showcmd

" Set persistent undo
set undofile
set undodir=~/.vim/undo

" Disable mode display - Airline does this already
set noshowmode

" truecolor (16 million colors) mode
set termguicolors

" use ripgrep
set grepprg=rg\ --vimgrep

" Required for operations modifying multiple buffers like rename.
set hidden

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Change the cursor style for different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Colorscheme
colorscheme base16-tomorrow-night
let g:rehash256 = 1

" ale configuration
let g:airline#extensions#ale#enabled = 1

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'term'
set laststatus=2

" Gutentags configuration
" let g:gutentags_enabled = 1
" set statusline+=%{gutentags#statusline('[Generating...]')}
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_file_list_command = {
"     \ 'markers': {
"         \ '.git':   'git ls-files',
"         \ '.hg':    'hg files',
"         \ },
"     \ }

" Promptline Configuration
" sections (a, b, c, x, y, z, warn) are optional
" let g:promptline_preset = {
"         \'a' : [ promptline#slices#host() ],
"         \'b' : [ promptline#slices#user() ],
"         \'c' : [ promptline#slices#cwd() ],
"         \'y' : [ promptline#slices#vcs_branch() ],
"         \'warn' : [ promptline#slices#last_exit_code() ]}

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
" promptline#slices#conda_env() - display which conda env is active (empty is none)
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`


" Vimtex stuff

let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

function! SetupLatexMode()
    " Enable gutentags
    " let g:gutentags_enabled = 1
    " let g:gutentags_add_default_project_roots = 0

    set completeopt+=noselect
    " let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
    " call deoplete#custom#var('omni_patterns', 'input_patterns', {
    "             \ 'tex': g:vimtex#re#deoplete,
    "             \ })
endfunction

autocmd FileType tex :call SetupLatexMode()

" ----------------------------------REMAPS-------------------------------------

" Get rid of search highlighting on demand
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Remap escape to jj in insert mode
:imap jj <Esc>

" Map bindings for nerdtree
map <C-n> :NERDTreeToggle<CR>

" Map bindings for tagbar
nmap <C-t> :TagbarToggle<CR>

cmap w!! w !sudo tee > /dev/null %

" function! SetupCMode()
"     map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
"     imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
" endfunction

" au FileType c :call SetupCMode()
" au FileType cpp :call SetupCMode()

" -----------------------------------LSP---------------------------------------
" see https://sharksforarms.dev/posts/neovim-rust/ for more info

" set completeopt=menuone,noinsert,noselect
" set shortmess+=c

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa',  '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr',  '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl',  '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D',   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca',  '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<space>ca',  '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e',   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d',         '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d',         '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q',   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f',   '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('v', '<space>f',   '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer', 'clangd' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "rust", "toml", "lua", "vim", "make", "bash" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enabled = true,
    },
}

EOF

" Use nasm file syntax
au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.S set filetype=asm

endif " VSCODIUM
