scriptencoding utf-8

"set nocompatible
filetype plugin on

set cursorline
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

" undoファイルを作成しない(macvim)
set noundofile

" マウス有効化
" Enable mouse support.
set mouse=a
set ttymouse=xterm2

set background=dark

set nrformats=

"set history=10000

set t_Co=256

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
set clipboard=unnamed,autoselect

" バッファ関連=====================================================
"編集中でもバッファを切り替えれるようにしておく
set hidden
"バッファ一覧ショートカット→バッファ番号で移動
nmap bb :ls<CR>:buf 
nmap ,h :bp<CR>
nmap ,l :bn<CR>

" 前に開いたファイルを開くショートカット
nmap <Space>, <C-^>

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

" 挿入モード時に横移動
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-h> <Left>

" marks & registers
nnoremap <Space>m  :<C-u>marks<CR>
nnoremap <Space>y  :<C-u>registers<CR>

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
nnoremap <silent> sf :call Gfunclist()<CR>

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

" 改行時にコメントが自動インデントされるのを防ぐ
autocmd BufEnter * setlocal formatoptions-=r
autocmd BufEnter * setlocal formatoptions-=o

" visulaモードで選択してからのインデント調整で調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

set nocompatible

filetype off

if !1 | finish | endif

if has('vim_starting')
    if &compatible
     set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-surround.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/vimshell.git'
"NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'tsaleh/vim-align.git'
NeoBundle 'soh335/vim-symfony.git'
"NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'vim-scripts/SQLUtilities.git'
"NeoBundle 'mattn/gal-vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'thinca/vim-ref.git'
NeoBundle 'taglist.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'TwitVim'
"NeoBundle 'kokukuma/vim-unite-bzr.git'
NeoBundle 'Lokaltog/vim-easymotion.git'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'joonty/vdebug'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
"NeoBundle 'yuratomo/w3m.vim.git'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle "Shougo/unite-outline"
"NeoBundle "violetyk/cake.vim"
"NeoBundle "ujihisa/unite-locate.git"
"NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/emmet-vim'
"javascript 構文解析
"NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'altercation/vim-colors-solarized'
"clipbordコピー
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'open-browser.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tpope/vim-rails'
NeoBundle 'basyura/unite-rails'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-textobj-user'
" ruby用のtext-obj
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'Shougo/neomru.vim'
" 変数名とか調べる用
NeoBundle 'koron/codic-vim'
" 複数カーソル
NeoBundle 'terryma/vim-multiple-cursors'
" ペースト時にインデントが崩れないようにモード変更
"NeoBundle 'ConradIrwin/vim-bracketed-paste'
" Dash
NeoBundle 'rizzatti/dash.vim'
" php 名前空間補助
NeoBundle 'arnaud-lb/vim-php-namespace'
" laravel
"NeoBundle 'm2mdas/phpcomplete-extended'
"NeoBundle 'm2mdas/phpcomplete-extended-laravel'

" Document Search
NeoBundle 'rhysd/devdocs.vim'

" ファイル検索
NeoBundle 'ctrlpvim/ctrlp.vim'

" php ide
NeoBundle 'phpactor/phpactor'

" 検索の拡張
NeoBundle 'haya14busa/vim-asterisk'

call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

syntax on
filetype plugin indent on

"" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
"nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
"inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 1000
" project以下のファイル一覧
nnoremap <silent> ,uo  :<C-u>Unite file_rec/async:! -no-split<CR>
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer -no-split<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file -no-split<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register -no-split<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru -no-split<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file -no-split<CR>
" php manual
nnoremap <silent> ,up :Unite ref/phpmanual -no-split<CR>

" bookmark
nnoremap <silent> ,bl :Unite bookmark<CR>
nnoremap <silent> ,ba :UniteBookmarkAdd<CR>

" outline
nnoremap <silent> ,ul :Unite line -no-split<CR>
nnoremap <silent> ,o :Unite outline -no-split<CR>

let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> <C-y> :<C-u>Unite history/yank -no-split<CR>
inoremap <silent> <C-y> <ESC>:<C-u>Unite history/yank -no-split<CR>

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
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,uw :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

nnoremap <silent> ,d  :<C-u>Unite
      \ -start-insert -default-action=vimfiler
      \ directory_rec/async
      \ <CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" unite cache & ignore files
let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'

call unite#custom#source(
      \ 'file_rec/async,file_rec/git',
      \ 'ignore_pattern',
      \ s:unite_ignore_file_rec_patterns)

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
let g:ref_phpmanual_path = $HOME."/.vim/ref/php-chunked-xhtml"

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
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" インデントを設定
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

"------------------------------------
" vim-coffee-script
"------------------------------------
" 保存時にコンパイル
"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

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
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1

" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=235
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=237

"hi IndentGuidesOdd  ctermbg=235
"hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,javascript,python,php IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle
"------------------------------------

let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
"set grepprg=grep\ -nh
set grepprg=ag

""------------------------------------
"" neosnippet
""------------------------------------
"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/.bundle/snipmate-snippets/snippets'
"
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"
"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif

" Unite Snippets
"imap <C-h>  <Plug>(neocomplcache_start_unite_snippet)

" yanktmp
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr> 

" fuzzyfinder
"nnoremap <unique> <silent> <space>fb :FufBuffer<CR>
"nnoremap <unique> <silent> <space>f :FufFile! **/<CR>
"nnoremap <unique> <silent> <space>fm :FufMruFile<CR>
"nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
"autocmd FileType fuf nmap <C-c> <ESC>
"let g:fuf_patternSeparator = ' '
"let g:fuf_modesDisable = ['mrucmd']
"let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
"let g:fuf_mrufile_maxItem = 100
"let g:fuf_enumeratingLimit = a20
"let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

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
"nnoremap <C-g> :Gtags -g
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
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_php_args = '-l'
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['php'],
  \ 'passive_filetypes': [] }
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'
nnoremap <Space>n :SyntasticReset<CR>
nnoremap <Space>x :SyntasticToggleMode<CR>

"for fakeclip
map ,y <Plug>(fakeclip-y)
map ,Y <Plug>(fakeclip-Y)
map ,p <Plug>(fakeclip-p)

"######################################################################
" vim boolean設定をtoggle化
" コマンド ToggleOption の定義
 command! -nargs=1 ToggleOption set <args>! <bar> set <args>?

" unite化
if !exists("g:unite_source_menu_menus")
    let g:unite_source_menu_menus = {}
endif
let g:unite_source_menu_menus.toggle = {}

" vim 以外のオプション
let g:unite_source_menu_menus.toggle.command_candidates = {
      \ 'neocomplete': "NeoCompleteToggle",
      \ }

" options にスペース区切りでオプション名を列挙する。
let options = "
      \ paste spell list number relativenumber incsearch wrap hlsearch
      \ foldenable ignorecase readonly wrapscan"

for opt in split(options)
  let g:unite_source_menu_menus.toggle.command_candidates[opt] = "ToggleOption " . opt
endfor
unlet options opt

nnoremap ,ud :Unite menu:toggle -start-insert -auto-resize<CR>
"######################################################################

"openbrowser
nmap <Space>o <Plug>(openbrowser-open)
vmap <Space>o <Plug>(openbrowser-open)
" ググる
nnoremap ,g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
"######################################################################
" unite-shortcut {{{
let g:unite_source_menu_menus.shortcut = {
\   "description" : "shortcut"
\}

" ここに書かれた順番のまま出力される
let g:unite_source_menu_menus.shortcut.command_candidates = [
\   [ "project file list", "Unite file_rec/async:!" ],
\   [ "AllMap", "Unite output:AllMap" ],
\   [ "Unite Beautiful Attack", "Unite -auto-preview colorscheme" ],
\   [ "Qiita", "OpenBrowser http://qiita.com" ],
\   [ "to XML", ":%s/></>
</g | filetype indent on | setf xml | normal gg=G" ],
\]
" unite-shortcut {{{
let g:unite_source_menu_menus.phpactor = {
\   "description" : "phpactor"
\}

" ここに書かれた順番のまま出力される
let g:unite_source_menu_menus.phpactor.command_candidates = [
\   [ "use補完", "call phpactor#UseAdd()" ],
\   [ "context menu", "call phpactor#ContextMenu()" ],
\   [ "navigate menu", "call phpactor#Navigate()" ],
\   [ "go to definition", "call phpactor#GotoDefinition()" ],
\   [ "transform コンストラクタ補完等", "call phpactor#ExtractExpression()" ],
\   [ "選択した範囲を変数に抽出", "call phpactor#GotoDefinition()" ],
\   [ "method 選択した範囲を新たなメソッド", "call phpactor#ExtractMethod()" ],
\   [ "hover", "call phpactor#Hover()" ],
\]
nnoremap ,m :Unite menu<CR>

"------------------------------------
" vim-rails
"------------------------------------
""{{{
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
    nnoremap <Space>rr :R<CR>
    nnoremap <Space>ra :A<CR>
    nnoremap <Space>rm :RVmodel<Space>
    nnoremap <Space>rc :RVcontroller<Space>
    nnoremap <Space>rv :RVview<Space>
    nnoremap <Space>rp :Rpreview<CR>
endfunction

aug MyAutoCmd
au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
au!
aug END
"}}}

"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
    nnoremap <buffer><C-H><C-H><C-H> :<C-U>Unite rails/view<CR>
    nnoremap <buffer><C-H><C-H> :<C-U>Unite rails/model<CR>
    nnoremap <buffer><C-H> :<C-U>Unite rails/controller<CR>

    nnoremap <buffer><C-H>c :<C-U>Unite rails/config<CR>
    nnoremap <buffer><C-H>s :<C-U>Unite rails/spec<CR>
    nnoremap <buffer><C-H>m :<C-U>Unite rails/db -input=migrate<CR>
    nnoremap <buffer><C-H>l :<C-U>Unite rails/lib<CR>
    nnoremap <buffer><expr><C-H>g ':e '.b:rails_root.'/Gemfile<CR>'
    nnoremap <buffer><expr><C-H>r ':e '.b:rails_root.'/config/routes.rb<CR>'
    nnoremap <buffer><expr><C-H>se ':e '.b:rails_root.'/db/seeds.rb<CR>'
    nnoremap <buffer><C-H>ra :<C-U>Unite rails/rake<CR>
    nnoremap <buffer><C-H>h :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
    au User Rails call UniteRailsSetting()
aug END
"}}}

" lightline
"let g:lightline = {'colorscheme': 'solarized'}

"set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
  \ }

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['fugitive', 'filename', 'cakephp', 'currenttag', 'anzu'] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ }
      \ }


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? ' ' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return ' ' . fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

syntax enable
colorscheme molokai

if &term == "xterm-256color"
    colorscheme molokai
    set background=dark
    hi Comment ctermfg=102
    hi Visual  ctermbg=236
endif

" 分割した設定ファイルをすべて読み込む
set runtimepath+=~/.vim/
runtime! userautoload/*.vimrc

"RSpec対応
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'exec': 'bundle exec %c %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'exec': '%c %s'
  \}
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

"Dash.vim
nmap <silent> <Space>d <Plug>DashSearch

"vim-php-namespace
imap <Space>u <C-O>:call PhpInsertUse()<CR>
nmap <Space>u :call PhpInsertUse()<CR>
imap <Space>e <C-O>:call PhpExpandClass()<CR>
nmap <Space>e :call PhpExpandClass()<CR>

" phpcomplete-extended setting
" Composer command name
let g:phpcomplete_index_composer_command = 'composer'

"devdocs
nmap K <Plug>(devdocs-under-cursor)

" ctrl-p
"" # 検索結果の表示ウィンドウの設定，100件分を表示（それ以上になってもスクロールされる）
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:100,results:50'
" agと組み合わせる
let g:ctrlp_user_command = 'ag %s -l'

" phpactor
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
nmap <Space>c :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
nmap <Space>n :<C-u>call phpactor#Navigate()<CR>
" 編集中のクラスに対し各種の変更を加える(コンストラクタ補完、インタフェース実装など)
nmap <Space>t :<C-u>call phpactor#Transform()<CR>
" オムニ補完でPhpactorを利用
autocmd FileType php setlocal omnifunc=phpactor#Complete

" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

" カーソル下をハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" vim-asterrisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" GitGutter
nmap ga <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk
