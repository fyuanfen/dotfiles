set nocompatible     "Disable vi-compatibility
set laststatus=2     "Always show the statusline
set encoding=utf-8   "Necessary to show unicode glyphs
set hlsearch
set number
set cursorline " 突出显示当前行:
set tabstop=4 " Tab键的宽度
set expandtab
set shiftwidth=4
autocmd FileType javascript,vue setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
set incsearch
set nocp
set foldenable
set autoread   " 设置当文件被改动时自动载入
set ruler          " show the cursor position all the time
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set smarttab
set hlsearch
set modeline   " 在文件头上加入一行注释让VIM读取设置
set fileencodings=utf-bom,utf-8,cp936,gb18030,latin1
set smartindent
set ignorecase smartcase
set showcmd         " 输入的命令显示出来

"buff hidden when
"set bufhidden=delete

set fileencodings=utf-bom,utf-8,cp936,gb18030,latin1
"language message zh_CN.utf-8
set guifont=Consolas:h12:cANSI

filetype plugin indent on
syntax enable

"配色方案
set t_Co=256
set background=dark
color lucius

"自定义快捷键
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
nnoremap <C-e> :lnext<CR>
nnoremap <S-e> :lprevious<CR>
imap <C-q> <ESC>:q<cr>
map <F10> <ESC>:set number!<cr>
nmap zz :set foldmethod=indent<cr>
nmap zx :set foldmethod=syntax<cr>

" 将下划线的变量转为驼峰式
vnoremap <leader>tt :%s/\([a-z]\)_\([a-z]\)/\1\u\2/g<CR>

let g:ackprg = 'ag --vimgrep --noaffinity'

" for search
function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	execute 'Ack! '.l:pattern

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

vnoremap <leader>s :call VisualSelection('ag', '')<CR>


"自动运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!make"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!rm ./%< & make & ./%<"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'javascript'
        exec "!node %"
    elseif &filetype == 'go'
        exec ":GoRun"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'lua'
        exec "!lua %"
    endif
endfunc

"编译c代码
"map <F7> :call Compile()<CR>
"func! Compile()
    "exec "w"
    "if &filetype == 'c'
        "exec "!make"
    "endif
"endfunc

"Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

"NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapOpenSplit="s"
let NERDTreeShowBookmarks=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Ack
let g:ack_autoclose = 0
let g:ackhighlight = 1

" 自定义命令
command! W w
command! Q q
command! Wqa wqa
command! HT set filetype=html

command! JSON %!python -m json.tool

" 自动完成
set complete-=k complete+=k
" 设置字典补全文件
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

"插入编辑模式
set pastetoggle=<F9>

"ultisnips
let g:UltiSnipsEditSplit="vertical"
command! Uedit UltiSnipsEdit

" 新建文件模板
autocmd BufNewFile *.php 0r ~/.vim/template/simple.php
autocmd BufNewFile *.html 0r ~/.vim/template/simple.html
autocmd BufNewFile *.htm 0r ~/.vim/template/simple.html

autocmd BufNewFile *.sh 0r ~/.vim/template/simple.sh
autocmd BufNewFile *.py 0r ~/.vim/template/simple.py

"配置文件类型
autocmd BufRead *.conf setfiletype config

execute pathogen#infect()

"新一代错误检查工具ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'go': ['govet'],
\}

map <leader>at :ALEToggle<CR>

let g:ale_lint_on_text_changed = 'never'
"let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_keep_list_window_open = 0
let g:ale_pattern_options = {
    \ 'github.com.*$': {'ale_linters': [], 'ale_fixers': []},
\}

"ctrlP
let g:ctrlp_use_caching = 10
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|obj'

"leaderF
noremap <F2> :LeaderfFunction!<cr>

"自动打开和关闭QuickFix窗口
autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost    l* nested cclose

"multiple-cursors
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"YCM
"let g:ycm_filetype_whitelist = { 'javascript' : 1, 'cpp' : 1,'sql':1 ,'go' : 1 }
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_server_python_interpreter = "/usr/local/bin/python"
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_confirm_extra_conf ="~/.ycm_extra_conf.py"
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
map <C-g> :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>jd :GoDef<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"不显示自动补全preview窗口
"set completeopt-=preview

"SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

"perforce
let g:perforce_open_on_change = 1

"vim-javascript
let g:javascript_plugin_jsdoc = 1

"JsDoc
let g:jsdoc_return = 0
"  search for the last function declaration and puts your jsdoc above it:
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)

"vim-closetag
let g:closetag_filenames = "*.html,*.js,*.vue"

set tags+=./../tags,./../../tags,./../../../tags

"根据文件后缀 自动高料
au BufNewFile,BufRead *.jshintrc set filetype=rc

"Easy Motion
" <Leader>f{char} to move to {char}
map  <Leader>j <Plug>(easymotion-j)
nmap <Leader>j <Plug>(easymotion-j)
map  <Leader>k <Plug>(easymotion-k)
nmap <Leader>k <Plug>(easymotion-k)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" vim-go
let g:go_fmt_command = "goimports"
nmap <Leader>fs :GoFillStruct<CR>

set rtp+=/usr/local/opt/fzf

"自动载入配置文件
autocmd! bufwritepost _vimrc source %

