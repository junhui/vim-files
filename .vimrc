" Author:      Asins - asinsimple AT gmail DOT com
"         Get latest vimrc from http://nootn.com/

set nocompatible               " be iMproved
filetype off                   " required!
" 设置leader为,
let mapleader=","
let maplocalleader=","

" 删除原有自动命令，防止.vimrc执行多次时自动命令出现多次
autocmd!

"编辑vim配置文件
if has("unix")
	set fileformats=unix,mac,dos
	let $VIMFILES = $HOME."/.vim"
else
	set fileformats=dos,unix,mac
	let $VIMFILES = $VIM."/vimfiles"
endif

set rtp+=$VIMFILES/bundle/Vundle.vim
call vundle#begin($VIMFILES.'/bundle')

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"Color
Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'jrhorn424/vim-multiple-cursors'

Plugin 'scrooloose/nerdcommenter'

Plugin 'Valloric/YouCompleteMe'

" HTML tools
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'jelera/vim-javascript-syntax'
" theme
Plugin 'Lokaltog/vim-distinguished'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()
filetype plugin indent on

" encode
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1

" font
set linespace=0

set laststatus=2 " 默认显示状态栏

" 设置在状态行显示的信息
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

set nobackup " Close backup
set nowritebackup
"set autochdir  " 自动切换当前目录为当前文件所在的目录
set ignorecase  " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
"set nowrapscan " 搜索到文件两端时不重新搜索
"set hlsearch  " 搜索时高亮显示被找到的文本
"set mouse=a " 允许在所有模式下使用鼠标

" Style
syntax enable " 自动语法高亮
"set background=dark
" colorscheme molokai
set t_Co=256
set background=dark
color wombat256mod
hi Number       ctermfg=73      cterm=none      guifg=#e5786d   gui=none

set number   " 显示行号
set hidden    " 允许在有未保存的修改时切换缓冲区
set wildmenu " 开启命令行补全
set smartindent " 智能自动缩进
"set scrolloff=3  " 上下可视行数
"set nocursorline  " 不突出显示当前行
set showmatch  "显示括号配对情况

" Tab
set softtabstop=4 " 设置按BackSpace的时候可以一次删除掉4个空格

" ---------------
" Text Format
" ---------------
set tabstop=4
set shiftwidth=4 " Tabs under smart indent
set softtabstop=4
set shiftround
set cindent
set autoindent
set smarttab
set expandtab
set backspace=indent,eol,start    " 让退格键和 Delete 键支持删除回车符

" {{{ NERDtree 文件管理器
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
nnoremap <Leader>tt :NERDTree<CR>
"}}}

" {{{ The-NERD-Commenter 注释代码用的，以下映射已写在插件中
let NERDMenuMode = 0
" <Leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <Leader>cc 注释当前行
" <Leader>cs 以”性感”的方式注释
" <Leader>cA 在当前行尾添加注释符，并进入Insert模式
" <Leader>cu 取消注释
" <Leader>cm 添加块注释
" }}}

" 普通模式下 Shift+W 切换自动换行
"nnoremap <s-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>
" 普通模式下 Ctrl+c 复制文件路径
"nnoremap <c-c> :let @* = expand('%:p')<cr>

" 在VimScript中快速查找帮助文档
"autocmd Filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nmap <F12> :TagbarToggle<CR>
map <c-f> :call JsBeautify()<cr>
" autocmd FileType javascript vnoremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

set title
set clipboard+=unnamed " Yanks go on clipboard instead.
" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_html_checkers = ['handlebars']

" Hat tip http://git.io/SPIBfg
" let g:syntastic_error_symbol = 'x'
" let g:syntastic_warning_symbol = '!'
let g:syntastic_full_redraws = 1
" javascript syntax
"au FileType javascript call JavaScriptFold()

" hilight function name
" autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2 
" autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1

" hi cfunctions ctermfg=81
" hi Function ctermfg=154
" hi String ctermfg=2
" hi Type ctermfg=118 cterm=none 
" hi Structure ctermfg=118 cterm=none
" hi Macro ctermfg=161 cterm=bold
" hi PreCondit ctermfg=161 cterm=bold
set cursorline

" Place backups in tmp directory (not working directory)
set backupdir=~/tmp
"
" " Display right margin at column #80
set colorcolumn=80
hi ColorColumn ctermbg=236 guibg=#383838
" " Change background color
hi Normal ctermfg=252 ctermbg=234 cterm=none guifg=#e3e0d7 guibg=#242424 gui=none
hi LineNr ctermfg=241 ctermbg=234 cterm=none guifg=#857b6f guibg=#242424 gui=none
"hi Function cterm=italic
"
set list listchars=tab:→\ ,trail:·

set nobackup
set noswapfile
