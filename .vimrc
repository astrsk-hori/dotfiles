set nocompatible

syntax on
filetype plugin on

set hlsearch
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:>-
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
nmap gb :ls<CR>:buf 

" ステータスエリア関係
"ステータスのところにファイル情報表示
"set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"ルーラーを表示
set ruler
set title

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

nmap bb :ls<CR>:buf 
nmap ,h :bp<CR>
nmap ,l :bn<CR>

imap <C-[> <esc>

set grepprg=grep\ -nH

" 検索箇所を真ん中に
" when move to search results, move to center.
noremap n nzz
noremap N Nzz

"key map
" ファンクションリスト
nnoremap <silent> ,f :call Gfunclist()<CR>

function! Gfunclist()
    vimgrep " function" % | cw
endfunction

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
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/tsaleh/vim-align.git'
NeoBundle 'git://github.com/soh335/vim-symfony.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/vim-scripts/SQLUtilities.git'
NeoBundle 'git://github.com/mattn/gal-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'taglist.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'TwitVim'

filetype plugin indent on

"vim-powerline
let g:Powerline_symbols = 'fancy'
set t_Co=256


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

"autocmd FileType php :set dictionary=$HOME/vimfiles/dict/PHP.dict
let g:user_zen_expandabbr_key = '<c-e>'

let g:neocomplcache_enable_at_startup = 1

" snippet
"imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)
"

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
