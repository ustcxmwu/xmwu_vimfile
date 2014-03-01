""if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
""   set fileencodings=ucs-bom,utf-8,latin1
""endif
set fileencodings=utf-8,gbk,ucs-bom
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
syntax on
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent


" 设置默认窗口大小
""set lines=30 columns=100


" 颜色主题设置
colorscheme  desert


" 关闭gvim 的工具栏
set go =


" 字体设置
set guifont=Courier\_New:h12:w6


" 设置maplead键从\到,
let mapleader=","
let g:mapleader=","


" 高亮显示光标所在行
"set cursorline
"hi cursorline guibg=#222222
"hi CursorColumn guibg=#333333


" 光标在物理行间移动，即长行换行
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


"状态栏显示文件名
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2

"F4插入日期
nnoremap <F4> "=strftime("%Y年%m月%d日 %A")<CR>pa
inoremap <F4> <C-R>=strftime("%Y年%m月%d日 %A")<CR>

"F5插入/79个*号，用于注释;F6插入79个*号/;
nnoremap <F5> <Esc><Esc>a/<Esc><Esc>79a*<Esc><Esc>A<cr>
inoremap <F5> <Esc><Esc>a/<Esc><Esc>79a*<Esc><Esc>A<cr>
nnoremap <F6> <Esc><Esc>77a*<Esc><Esc>a/<Esc><Esc>v8k==<Esc>
inoremap <F6> <Esc><Esc>77a*<Esc><Esc>a/<Esc><Esc>v8k==<Esc>

"F7插入/* @xmwu */并将光标置于@之前
nnoremap <F7>  <Esc><Esc>i/*  @xmwu */<Esc><Esc>8hi
inoremap <F7>  <Esc><Esc>i/*  @xmwu */<Esc><Esc>8hi



set pastetoggle=<F9>
"设置折叠
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠                            
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠


" 括号自动补全和匹配
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
source ~/.vim/Bundle.vim


