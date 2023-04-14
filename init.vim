:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
set hidden

" Turn off word wrap
:set nowrap

" Always center cursor in pane
:set scrolloff=999

:autocmd Filetype javascript,javascriptreact,typescript,typescriptreact setlocal ts=2 sw=2 expandtab

" Automatically indent based on context
:set smartindent

" Hightlight columns 81
:set cc=81

call plug#begin()

Plug 'jubnzv/virtual-types.nvim'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'mattn/emmet-vim' " Emmet vim
Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status
Plug 'neoclide/jsonc.vim' " Vim syntax highlighting plugin for JSON
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline
Plug 'pangloss/vim-javascript' " Improve javascript indent and syntax
Plug 'MaxMEllon/vim-jsx-pretty' " JSX and TSX syntax pretty highlighting for vim
Plug 'peitalin/vim-jsx-typescript' " React JSX syntax highlighting for vim and Typescript
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Extra syntax and highlight for nerdtree files

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :vsplit<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>F :CocCommand eslint.executeAutofix<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" This makes the time before it updates your hover faster, other
:set updatetime=300

" This makes it so that you can click a variable and a float window pops up

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" NERDTree ---- {{{

map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1

" Open a NERDTree automatically when vim starts up and focus on file
autocmd vimenter * NERDTree | wincmd p
" Close vim if the only window left open is a NERDTree
autocmd bufenter *
			\ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
			\ | q | endif

" Reveal current file in NERDTree
nnoremap <leader>f :NERDTreeFind<CR>

" ---- }}}
