" ============================================================================ "
"							vundle 管理插件									   "
" ============================================================================ "
set nocompatible " be iMproved
filetype off " required!

" ============================================================================ "
"	指定要安装得插件
" ============================================================================ "
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" ============================================================================ "
"	使用Vundle来管理Vundle，这个必须要有。
" ============================================================================ "
Bundle 'gmarik/vundle'

" ============================================================================ "
"	格式1：Github上其他用户的仓库（非vim-scripts账户里的仓库，所以要加Github用户名）
" ============================================================================ "
" Generic Standard Template Library for C "
Bundle 'chuckination/gcstl'

" Vim plugin for intensely orgasmic commenting "
Bundle 'scrooloose/nerdcommenter'

" Simple templates plugin for Vim "
" Bundle 'aperezdc/vim-template'

" Ultimate auto-completion system for Vim. "
Bundle 'Shougo/neocomplcache.vim'

" one colorscheme pack to rule them all! "
Bundle 'flazz/vim-colorschemes'

" Vim-script library "
Bundle 'vim-scripts/L9'

" Perform all your vim insert mode completions with Tab. "
Bundle 'ervandew/supertab'

" buffer/file/command/tag/etc explorer with fuzzy matching. "
Bundle 'vim-scripts/FuzzyFinder'

" Alternate Files quickly (.c --> .h etc. "
Bundle 'vim-scripts/a.vim'

" A tree explorer plugin for vim. "
Bundle 'scrooloose/nerdtree'

" Help folks to align text, eqns, declarations, tables, etc. "
Bundle 'vim-scripts/Align'

" Simplify Doxygen documentation in C, C++, Python. "
Bundle 'vim-scripts/DoxygenToolkit.vim'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc) "
Bundle 'vim-scripts/taglist.vim'

" vim-latex-suite " 
""Bundle 'grew/vim-latex-suite'

" vim-latex "
Bundle 'jcf/vim-latex'

"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-rails.git'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Townk/vim-autoclose'

" ============================================================================ "
"	格式2：vim-scripts里面的仓库，直接打仓库名即可。
" ============================================================================ "
"Bundle 'SuperTab'
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"格式3：非Github的Git仓库
"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

" ============================================================================ "
"	文件类型检测
" ============================================================================ "
filetype plugin indent on

" ============================================================================ "
"	启动插件
" ============================================================================ "

"-------------------------------------------------------------------------------
"							SuperTab										   "
"-------------------------------------------------------------------------------
let g:SuperTabRetainCompletiontype = 2
let g:supertabdefaultcompletionType = "<C-X><C-U>"

"-------------------------------------------------------------------------------
"							vim-template                                       "
"-------------------------------------------------------------------------------				
""let g:username = "wuxiaomin"
""let g:email = "xmwu@mail.ustc.edu.cn"
""let g:license = "Copyright (C) Advanced Network Management and Control Group of USTC"
""let g:template_dir = "~/.vim/my_templates"

"-------------------------------------------------------------------------------				
"							NERDTree										   "
"-------------------------------------------------------------------------------				
let g:NERDTreeWinSize = 20
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------
"							DoxygenToolkit									   "
"-------------------------------------------------------------------------------
let g:DoxygenToolkit_authorName = "wuxiaomin <xmwu@mail.ustc.edu.cn>"
let g:DoxygenToolkit_blockHeader = "--------------------------------------------
			\------------------------------------"
let g:DoxygenToolkit_blockFooter = "--------------------------------------------
			\------------------------------------"
let g:DoxygenToolkit_briefTag_structName = "yes"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let s:licenseTag = "Copyright (C) Advanced Network Management and Control Group of USTC\<enter>"
let s:licenseTag = s:licenseTag."All right reserved."
let g:DoxygenToolkit_licenseTag = s:licenseTag

"-------------------------------------------------------------------------------
"							ctags											   "
"-------------------------------------------------------------------------------
let Tlist_Ctags_Cmd = '/usr/bin/ctags'



"-------------------------------------------------------------------------------
"							taglist											   "
"-------------------------------------------------------------------------------
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
""let Tlist_Show_One_File = 1
""let Tlist_File_Fold_Auto_Close = 1
""set tags = tags
""set autochdir 



"-------------------------------------------------------------------------------
"							NeoComplCache									   "
"-------------------------------------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
