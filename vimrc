" While much of it is beneficial for general use, I would
" recommend picking out the parts you want and understand,
" as I have done from other notable vim purists
"

set nocompatible "Use Vim settings, rather than Vi settings
"Be IMproved

filetype off "required!


" I use Vundle https://github.com/gmarik/vundle as my
" preferred plugin manager.... never got the hang of
" vim-pathogen (no offence to the pathogen community)
"
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', 'fancy', 'os', 'coding', 'python', 'html', 'css', 'js', 'color', 'erlang']
endif

Plugin 'gmarik/Vundle.vim'

let mapleader = ","
let maplocalleader = "\\"

" PACKAGES {{{

" Install user-supplied Bundles {{{
let s:extrarc = expand($HOME . '/.vim/extra.vimrc')
if filereadable(s:extrarc)
    exec ':so ' . s:extrarc
endif
" }}}

" _. General {{{
if count(g:vimified_packages, 'general')
    "Plugin 'editorconfig/editorconfig-vim'

    Plugin 'rking/ag.vim'
    nnoremap <leader>a :Ag -i<space>

    Plugin 'matthias-guenther/hammer.vim'
    nmap <leader>p :Hammer<cr>

    Plugin 'tsaleh/vim-align'
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-speeddating'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'maxbrunsfeld/vim-yankstack'
    Plugin 'tpope/vim-eunuch'
    Plugin 'Raimondi/delimitMate'

    Plugin 'scrooloose/nerdtree'
    nmap <C-i> :NERDTreeToggle<CR>
" Disable the scrollbars (NERDTree)
    set guioptions-=r
    set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
     let NERDTreeShowBookmarks=1
     set winfixwidth


    Plugin 'kana/vim-textobj-user'
    Plugin 'vim-scripts/YankRing.vim'
    let g:yankring_replace_n_pkey = '<leader>['
    let g:yankring_replace_n_nkey = '<leader>]'
    let g:yankring_history_dir = '~/.vim/tmp/'
    nmap <leader>y :YRShow<cr>

    Plugin 'michaeljsmith/vim-indent-object'
    let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

    Plugin 'Spaceghost/vim-matchit'
    Plugin 'kien/ctrlp.vim'
    let g:ctrlp_working_path_mode = ''

    Plugin 'vim-scripts/scratch.vim'

    Plugin 'troydm/easybuffer.vim'
    nmap <leader>be :EasyBufferToggle<enter>

    Plugin 'terryma/vim-multiple-cursors'
endif
" }}}

" _. Fancy {{{
if count(g:vimified_packages, 'fancy')
    Plugin 'bling/vim-airline'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_branch_prefix = ''
endif
" }}}

" _. Indent {{{
if count(g:vimified_packages, 'indent')
  Plugin 'Yggdroot/indentLine'
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
    Plugin 'zaiste/tmux.vim'
    Plugin 'benmills/vimux'
    map <Leader>rp :VimuxPromptCommand<CR>
    map <Leader>rl :VimuxRunLastCommand<CR>

    map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>
endif
" }}}

" _. Coding {{{

if count(g:vimified_packages, 'coding')
    Plugin 'majutsushi/tagbar'
    nmap <leader>t :TagbarToggle<CR>

    Plugin 'gregsexton/gitv'

    Plugin 'scrooloose/nerdcommenter'
    nmap <leader># :call NERDComment(0, "invert")<cr>
    vmap <leader># :call NERDComment(0, "invert")<cr>

" - Plugin 'msanders/snipmate.vim'
    Plugin 'sjl/splice.vim'

    Plugin 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Plugin 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }

" --

    Plugin 'vim-scripts/Reindent'

    autocmd FileType gitcommit set tw=68 spell
    autocmd FileType gitcommit setlocal foldmethod=manual
endif
" }}}

" _. Python {{{
if count(g:vimified_packages, 'python')
    Plugin 'klen/python-mode'
    let g:pymode = 0
    Plugin 'python.vim'
    Plugin 'python_match.vim'
    Plugin 'pythoncomplete'
    Plugin 'sophacles/vim-bundle-mako'
endif
" }}}


" _. HTML {{{
if count(g:vimified_packages, 'html')
    Plugin 'tpope/vim-haml'
    Plugin 'juvenn/mustache.vim'
    Plugin 'tpope/vim-markdown'
    Plugin 'digitaltoad/vim-jade'
    Plugin 'slim-template/vim-slim'
    Plugin 'othree/html5.vim'

    au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
endif
" }}}

" _. CSS {{{
if count(g:vimified_packages, 'css')
    Plugin 'wavded/vim-stylus'
    Plugin 'lunaru/vim-less'
    nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
endif
" }}}

" _. JS {{{
if count(g:vimified_packages, 'js')
    Plugin 'kchmck/vim-coffee-script'
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

    Plugin 'pangloss/vim-javascript'

    Plugin 'othree/javascript-libraries-syntax'
    let g:used_javascript_libs = 'jquery,angularjs,angularui'

    Plugin 'walm/jshint.vim'
    Plugin 'shutnik/jshint2.vim'
endif
" }}}

" _. Erlang {{{
" http://stackoverflow.com/questions/13668583/how-to-start-erlang-shell-from-inside-vim
if count(g:vimified_packages, 'erlang')
    Plugin 'oscarh/vimerl'
    let g:erlangHighlightErrors = 1
    let g:erlangHighlightBif = 1
    let g:erlangCompletionDisplayDoc = 1
endif
" }}}

"follow this to set YouCompleteMe not conflict
"with ultisnips
"http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
let g:UltiSnipsUsePythonVersion = 2
    "let g:UltiSnipsSnippetDirectories=['UltiSnips','bundle/angular-vim-snippets/UltiSnips']
    "let g:UltiSnipsSnippetDirectories=['UltiSnips','bundle/angular-vim-snippets/UltiSnips']
    
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-m>"
"
" " If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


"added by Jude
Plugin 'mrxd/bufkill.vim'

call vundle#end()
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


"added by Jude
autocmd FileType python setlocal foldmethod=indent

