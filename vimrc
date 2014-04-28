" While much of it is beneficial for general use, I would
" recommend picking out the parts you want and understand,
" as I have done from other notable vim purists
"

set nocompatible "Use Vim settings, rather than Vi settings
"Be IMproved

filetype off "required!

let mapleader = ","
let maplocalleader = "\\"

" I use Vundle https://github.com/gmarik/vundle as my
" preferred plugin manager.... never got the hang of
" vim-pathogen (no offence to the pathogen community)
"
"
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()

if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', 'fancy', 'os', 'coding', 'python', 'html', 'css', 'js', 'color', 'erlang']
endif

Bundle 'gmarik/vundle'

" PACKAGES {{{

" Install user-supplied Bundles {{{
let s:extrarc = expand($HOME . '/.vim/extra.vimrc')
if filereadable(s:extrarc)
    exec ':so ' . s:extrarc
endif
" }}}

" _. General {{{
if count(g:vimified_packages, 'general')
    "Bundle 'editorconfig/editorconfig-vim'

    Bundle 'rking/ag.vim'
    nnoremap <leader>a :Ag -i<space>

    Bundle 'matthias-guenther/hammer.vim'
    nmap <leader>p :Hammer<cr>

    Bundle 'tsaleh/vim-align'
    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'maxbrunsfeld/vim-yankstack'
    Bundle 'tpope/vim-eunuch'

    Bundle 'scrooloose/nerdtree'
    nmap <C-i> :NERDTreeToggle<CR>
" Disable the scrollbars (NERDTree)
    set guioptions-=r
    set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
     let NERDTreeShowBookmarks=1
     set winfixwidth


    Bundle 'kana/vim-textobj-user'
    Bundle 'vim-scripts/YankRing.vim'
    let g:yankring_replace_n_pkey = '<leader>['
    let g:yankring_replace_n_nkey = '<leader>]'
    let g:yankring_history_dir = '~/vimfiles/tmp/'
    nmap <leader>y :YRShow<cr>

    Bundle 'michaeljsmith/vim-indent-object'
    let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

    Bundle 'Spaceghost/vim-matchit'
    Bundle 'kien/ctrlp.vim'
    let g:ctrlp_working_path_mode = ''

    Bundle 'vim-scripts/scratch.vim'

    Bundle 'troydm/easybuffer.vim'
    nmap <leader>be :EasyBufferToggle<enter>

    Bundle 'terryma/vim-multiple-cursors'
endif
" }}}

" _. Fancy {{{
if count(g:vimified_packages, 'fancy')
    Bundle 'bling/vim-airline'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_branch_prefix = ''
endif
" }}}

" _. Indent {{{
if count(g:vimified_packages, 'indent')
  Bundle 'Yggdroot/indentLine'
  set list lcs=tab:\|\
  let g:indentLine_color_term = 111
  let g:indentLine_color_gui = '#DADADA'
  let g:indentLine_char = 'c'
"let g:indentLine_char = '??|'
  let g:indentLine_char = '?'
endif
" }}}

" _. OS {{{
if count(g:vimified_packages, 'os')
    Bundle 'zaiste/tmux.vim'
    Bundle 'benmills/vimux'
    map <Leader>rp :VimuxPromptCommand<CR>
    map <Leader>rl :VimuxRunLastCommand<CR>

    map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>
endif
" }}}

" _. Coding {{{

if count(g:vimified_packages, 'coding')
    Bundle 'majutsushi/tagbar'
    nmap <leader>t :TagbarToggle<CR>

    Bundle 'gregsexton/gitv'

    Bundle 'scrooloose/nerdcommenter'
    nmap <leader># :call NERDComment(0, "invert")<cr>
    vmap <leader># :call NERDComment(0, "invert")<cr>

" - Bundle 'msanders/snipmate.vim'
    Bundle 'sjl/splice.vim'

    Bundle 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Bundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }

" --

    Bundle 'vim-scripts/Reindent'

    autocmd FileType gitcommit set tw=68 spell
    autocmd FileType gitcommit setlocal foldmethod=manual
endif
" }}}

" _. Python {{{
if count(g:vimified_packages, 'python')
    Bundle 'klen/python-mode'
    let g:pymode = 0
    Bundle 'python.vim'
    Bundle 'python_match.vim'
    Bundle 'pythoncomplete'
    Bundle 'sophacles/vim-bundle-mako'
endif
" }}}


" _. HTML {{{
if count(g:vimified_packages, 'html')
    Bundle 'tpope/vim-haml'
    Bundle 'juvenn/mustache.vim'
    Bundle 'tpope/vim-markdown'
    Bundle 'digitaltoad/vim-jade'
    Bundle 'slim-template/vim-slim'
    Bundle 'othree/html5.vim'

    au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
endif
" }}}

" _. CSS {{{
if count(g:vimified_packages, 'css')
    Bundle 'wavded/vim-stylus'
    Bundle 'lunaru/vim-less'
    nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
endif
" }}}

" _. JS {{{
if count(g:vimified_packages, 'js')
    Bundle 'kchmck/vim-coffee-script'
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

    Bundle 'alfredodeza/jacinto.vim'
    au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
    au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    
    Bundle 'walm/jshint.vim'
    Bundle 'shutnik/jshint2.vim'
endif
" }}}

" _. Erlang {{{
" http://stackoverflow.com/questions/13668583/how-to-start-erlang-shell-from-inside-vim
if count(g:vimified_packages, 'erlang')
    Bundle 'oscarh/vimerl'
    let g:erlangHighlightErrors = 1
    let g:erlangHighlightBif = 1
    let g:erlangCompletionDisplayDoc = 1
endif
" }}}

"Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/nerdtree'
"Bundle 'bling/vim-airline'

filetype plugin indent on "required!

set backspace=indent,eol,start "allow backspacing over everything in insert mode

set history=50 "keep 50 lines of command line history

set ruler "show the cursor position all the time

set showcmd "display incomplete commands

set incsearch "do incremental searching

set nu "show line numbers

set expandtab "use spaces instead of tabs

set tabstop=4 "insert 4 spaces whenever the tab key is pressed

set shiftwidth=4 "set indentation to 4 spaces

set hlsearch "highlight search terms

set ic "Ignore Case during searches

set autoindent "start new line at the same indentation level

syntax enable "syntax highlighting

set cmdheight=1 "The commandbar height

set showmatch "Show matching bracets when text indicator is over them

set nobackup " do not keep backup files, it's 70's style cluttering

set noswapfile " do not write annoying intermediate swap files,
" who did ever restore from swap files
" anyway?
" https://github.com/nvie/vimrc/blob/master/vimrc#L141
" VIM powerline setups
set laststatus=2
set noshowmode

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END


set splitbelow " Horizontal splits open below current file

set splitright " Vertical splits open to the right of the current file

"add by Jude
inoremap <Esc> <Esc>:w<CR>

"add by Jude, inspired by http://stackoverflow.com/questions/16642366/snipmate-is-not-working-in-vim
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

"added by Jude
Bundle 'mrxd/bufkill'

"added by Jude
autocmd FileType python setlocal foldmethod=indent
