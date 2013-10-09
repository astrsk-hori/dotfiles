set nocompatible

syntax on
filetype plugin on

set hlsearch
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
"====================================
set expandtab
set list
 "Tabや行末の空白を表示する
set listchars=tab:>-,trail:_
"====================================
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
set tags=tags;
"ルーラーを表示
set ruler
set title
set hidden
" 文字コード関連
" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp
" 改行コードの解釈優先順位
set fileformats=unix,dos
" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8
" 内部の改行コード
set fileformat=unix

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" マウス有効化
" Enable mouse support.
set mouse=a
set ttymouse=xterm2

colorscheme delek

set nrformats=
" ==================================================================

"全角スペースを視覚化
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

" クリップボード関係=========================================
" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

" バッファ関連=====================================================
"編集中でもバッファを切り替えれるようにしておく
set hidden
"バッファ一覧ショートカット→バッファ番号で移動
nmap bb :ls<CR>:buf 
nmap ,h :bp<CR>
nmap ,l :bn<CR>

" ステータスエリア関係
"ステータスのところにファイル情報表示
"set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"ルーラーを表示
set ruler
set title

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" backspaceキーの挙動を設定する
" indent        : 行頭の空白の削除を許す
" eol           : 改行の削除を許す
" start         : 挿入モードの開始位置での削除を許す
set backspace=indent,eol,start

imap <C-[> <esc>

set grepprg=grep\ -nH

" 検索箇所を真ん中に
" when move to search results, move to center.
noremap n nzz
noremap N Nzz

"----------------------------------------------------
" 挿入モードでのカーソル移動
"----------------------------------------------------
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>
" jkでエスケープ
inoremap jk <ESC>

" marks & registers
nnoremap <Space>m  :<C-u>marks<CR>
nnoremap <Space>r  :<C-u>registers<CR>

":e をvimfilerに置き換え
let g:vimfiler_as_default_explorer=1
" safe mode 解除
let g:vimfiler_safe_mode_by_default=0

" vimfiler directoryをエンターで開けるようにする
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

" ctgas jump 複数飛び先がある場合に一覧表示させる
nnoremap <C-]> g<C-]> 

"key map
" ファンクションリスト
nnoremap <silent> ,f :call Gfunclist()<CR>

function! Gfunclist()
    vimgrep " function" % | cw
endfunction

" php option
" 文字列中のSQLをハイライト
let php_sql_query=1
" 文字列中のHTMLをハイライト
let php_htmlInStrings=1
" ショートタグ (<?を無効にする→ハイライト除外にする)
let php_noShortTags = 1

set nocompatible

if has('vim_starting')
execute 'set runtimepath+='.$HOME.'/.vim/neobundle.vim.git'
endif

filetype off

call neobundle#rc($HOME."/.vim/.bundle")

NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/tsaleh/vim-align.git'
"NeoBundle 'git://github.com/soh335/vim-symfony.git'
"NeoBundle 'git://github.com/Lokaltog/vim-powerline'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/vim-scripts/SQLUtilities.git'
"NeoBundle 'git://github.com/mattn/gal-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'taglist.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'TwitVim'
"NeoBundle 'git://github.com/kokukuma/vim-unite-bzr.git'
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'joonty/vdebug'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'git://github.com/honza/snipmate-snippets.git'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'git://github.com/yuratomo/w3m.vim.git'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle "Shougo/unite-outline"
"NeoBundle "violetyk/cake.vim"
"NeoBundle "git://github.com/ujihisa/unite-locate.git"
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/emmet-vim'
"javascript 構文解析
"NeoBundle 'marijnh/tern_for_vim'

filetype plugin indent on

"" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
"nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
"inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

nnoremap <silent> ,up :Unite ref/phpmanual<CR>

nnoremap <silent> ,ul :Unite line<CR>

let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> <C-y> :<C-u>Unite history/yank<CR>
inoremap <silent> <C-y> <ESC>:<C-u>Unite history/yank<CR>

" ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

" " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" unite.vim上でのキーマッピング
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
autocmd FileType unite call s:unite_my_settings()

" grep検索
"nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ug  :<C-u>Unite grep: -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,uw :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


 
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin
"ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

autocmd FileType php :set dictionary=$HOME/vimfiles/dict/PHP.dict
let g:user_emmet_leader_key = '<c-e>'

let g:neocomplcache_enable_at_startup = 1

" vimref
nmap ,rp :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path = $HOME."/.vim/dict/php-chunked-xhtml"

" taglist
set tags=tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
map <silent> <leader>t :TlistToggle<CR><C-w>l
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'

" vimfiler -------------------------------
nnoremap <silent> <Leader>f :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>k
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>k
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>k
nnoremap ,tn :<C-u>NextTwitter<CR>

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
      set nowrap
endfunction

"EasyMotion
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「,」 + 何かにマッピング
let g:EasyMotion_leader_key=","
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


"webdictサイトの設定
let g:ref_source_webdict_sites = {
            \   'je': {
            \     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
            \   },
            \   'ej': {
            \     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
            \   },
            \   'wiki': {
            \     'url': 'http://ja.wikipedia.org/wiki/%s',
            \   },
            \ }

"デフォルトサイト
let g:ref_source_webdict_sites.default = 'ej'

"出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
    return join(split(a:output, "\n")[17 :], "\n")
endfunction

nmap <Leader>rj :<C-u>Ref webdict je<Space>
nmap <Leader>re :<C-u>Ref webdict ej<Space>

"coffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

"------------------------------------
" vim-coffee-script
"------------------------------------
" 保存時にコンパイル
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" taglistの設定 coffeeを追加
" let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

" QuickRunのcoffee
" let g:quickrun_config['coffee'] = {
"      \'command' : 'coffee',
"      \'exec' : ['%c -cbp %s']
"      \}

"------------------------------------
" jasmine.vim
"------------------------------------
" ファイルタイプを変更
function! JasmineSetting()
    au BufRead,BufNewFile *Helper.js,*Spec.js  set
    filetype=jasmine.javascript
    au BufRead,BufNewFile *Helper.coffee,*Spec.coffee  set
    filetype=jasmine.coffee
    au BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee  let b:quickrun_config = {'type' : 'coffee'}
    call jasmine#load_snippets()
    map <buffer> <leader>m :JasmineRedGreen<CR>
    command! JasmineRedGreen :call jasmine#redgreen()
    command! JasmineMake :call jasmine#make()
endfunction
"au BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python,php IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"------------------------------------
" neosnippet
"------------------------------------
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/.bundle/snipmate-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Unite Snippets
"imap <C-h>  <Plug>(neocomplcache_start_unite_snippet)

" yanktmp
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr> 

" fuzzyfinder
"nnoremap <unique> <silent> <space>fb :FufBuffer<CR>
nnoremap <unique> <silent> <space>f :FufFile! **/<CR>
"nnoremap <unique> <silent> <space>fm :FufMruFile<CR>
"nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

" quickrun execute sql  ====================
let g:quickrun_config['sql'] = {
            \ 'command': 'mysql',
            \ 'exec': ['%c %o < %s'],
            \ 'cmdopt': '%{MakeMySQLCommandOptions()}',
            \ }
let g:mysql_config_host = 'localhost'
let g:mysql_config_port = '3306'
let g:mysql_config_user = 'root'

function! MakeMySQLCommandOptions()
    if !exists("g:mysql_config_host")
        let g:mysql_config_host = input("host> ")
    endif
    if !exists("g:mysql_config_port")
        let g:mysql_config_port = input("port> ")
    endif
    if !exists("g:mysql_config_user")
        let g:mysql_config_user = input("user> ")
    endif
    if !exists("g:mysql_config_pass")
        let g:mysql_config_pass = inputsecret("password> ")
    endif
    if !exists("g:mysql_config_db")
        let g:mysql_config_db = input("database> ")
    endif
     
    let optlist = []
    if g:mysql_config_user != ''
        call add(optlist, '-u ' . g:mysql_config_user)
    endif
    if g:mysql_config_host != ''
        call add(optlist, '-h ' . g:mysql_config_host)
    endif
    if g:mysql_config_pass != ''
        call add(optlist, '-p' . g:mysql_config_pass)
    endif
    if g:mysql_config_port != ''
        call add(optlist, '-P ' . g:mysql_config_port)
    endif
    if exists("g:mysql_config_otheropts")
        call add(optlist, g:mysql_config_otheropts)
    endif
     
    call add(optlist, g:mysql_config_db)
    return join(optlist, ' ')
endfunction
" quickrun execute sql  ====================

" statusline
set laststatus=2 

" grep
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir='twigtemplates'
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'

" 改行コードの解釈優先順位
" 何かのプラグインで上書きされているようなので最後に再設定。。。
"set fileformats=unix

"php-doc
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" gtags
" 検索結果Windowを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q
" Grep 準備
nnoremap <C-g> :Gtags -g
" このファイルの関数一覧
nnoremap <C-l> :Gtags -f %<CR><CR>
" カーソル以下の定義元を探す
"nnoremap <C-j> :Gtags <C-r><C-w><CR><CR>
map <C-j> :GtagsCursor<CR><CR>
" カーソル以下の使用箇所を探す
nnoremap <C-k> :Gtags -r <C-r><C-w><CR><CR>
" 次の検索結果
nnoremap <C-n> :cn<CR>
" 前の検索結果
nnoremap <C-p> :cp<CR>

"let Gtags_No_Auto_Jump = 1
"
nnoremap <silent> <Leader>S vaw:s/_\([a-z]\)/\u\1/egI<BAR>noh<CR>
nnoremap <silent> <Leader>s vaw:s/[A-Z]/_\l\0/egI<BAR>noh<CR>

" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': [] }
"  \ 'passive_filetypes': ['html', 'js'] }
let g:syntastic_auto_loc_list = 1
