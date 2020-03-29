"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
"
" Todos
" - vimwiki
" - pylint reports error when doing `vim ~/Github/vim-calc/build-up/calc.py`
"   instead of doing `cd ~/Github/vim-calc/build-up` and then do `vim calc.py`
" - hotkey to switch between light theme and dark theme (in progress, still
"   some bugs
"
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
" ====================
" === Editor Setup ===
" ====================
"
" ===
" === System
" ===
set nocompatible	" 关闭vi兼容模式
filetype on		" 让vim识别不同的文件格式
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a		" 让vi可以使用鼠标
set encoding=utf-8	" 设置编码格式
let &t_ut=''		" 修改部分终端配色异常的问题\
set autochdir     "自动切换当前目录为当前文件所在的目录
let mapleader=" " " 设置leader键

" 缩进
set smartindent		" 开启新行时智能缩进
set smarttab  "开启自动缩进
set expandtab		" 设置缩进
set tabstop=2		" 设置缩进长度
set shiftwidth=2
set softtabstop=2

" 展示
set list 		" 显示行尾的空格
set listchars=tab:▸\ ,trail:␣
set scrolloff=5 " 让屏幕始终下面保持5行
set tw=0
set indentexpr=
set foldenable
set foldmethod=indent	" 允许代码收缩
set foldlevel=99
set foldclose=all "设置自动关闭折叠
"让光标在不同模式下显示不同
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

syntax on		" 自动语法高亮
set number		" 显示行号
set norelativenumber	" 不显示相对行数
set cursorline		" 突出显示当前行
set wrap		" 自动换行
set showcmd		" 显示当前命令
set formatoptions-=tc
set laststatus=2	" 显示状态栏
set autoread  " 当文件在外部被修改时，自动更新该文件

" better backspace
set backspace=indent,eol,start	" 使用退格和delete键删除


" 保存文件上次光标所在位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 使用系统剪切板
vnoremap Y :w !xclip -i -sel c<CR>


" 命令补全
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu		" 命令行提示
set wildmode=longest,list,full

" 搜索
set hlsearch		" 高亮搜索
set showmatch " 光标移到括号时，自动显示匹配的另一个
"进入文件取消高亮
exec "nohlsearch"
set incsearch		" 搜索关键词插入高亮
set ignorecase smartcase" 搜索忽略大小写,但存在大写字母时仍保持大小写敏感

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1


" 键位映射
noremap K 5k
noremap J 5j
" 搜索下一项
noremap = nzz
" 搜索上一项
noremap - Nzz
" 关闭搜索高亮
noremap <LEADER><CR> :nohlsearch<CR>

" 快捷键
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
" 切换分屏
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
" 修改分屏大小
map <r-up> :res +5<CR>
map <r-down> :res -5<CR>
map <r-left> :vertical -5<CR>
map <r-right> :vertical +5<CR>
" 切换分屏布局
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
" 标签
map tu :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" 插件
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'  " 状态栏
Plug 'connorholyday/vim-snazzy' " snazzy主题

" 文件导航
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'

" Undo Tree
Plug 'mbbill/undotree/'

" Snippits
" Plug 'SirVer/ultisnips'  , { 'for': ['vim-plug', 'python'] }
" Plug 'honza/vim-snippets', { 'for': ['vim-plug', 'python'] }

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'tmhedberg/SimpylFold'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
" Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-python/python-syntax', { 'for' :['python', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } "displays trailing whitespace (after :EnableWhitespace, vim slows down)
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" coc config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" 设置主题snazzy
" let g:SnazzyTransparent = 1
" color snazzy

filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'



" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
