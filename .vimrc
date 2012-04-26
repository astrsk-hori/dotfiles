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


" 文字コード関連
" 文字コードの自動解釈の優先順位
set fileencodings=utf-8,cp932,euc-jp
" 改行コードの解釈優先順位
set fileformats=unix,dos

" 内部の解釈の文字コード　設定ファイルもこのコードで書け
set encoding=utf-8
" 内部の改行コード
set fileformat=unix


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

set grepprg=grep\ -nH

"key map
" ファンクションリスト
nnoremap <silent> ,f :call Gfunclist()<CR>

function! Gfunclist()
    vimgrep " function" % | cw
endfunction

set nocompatible

if has('vim_starting')
execute 'set runtimepath+=/home/developer/.vim/neobundle.vim.git'
endif

filetype off

call neobundle#rc('/home/developer/.vim/.bundle')

NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/tsaleh/vim-align.git'
NeoBundle 'git://github.com/soh335/vim-symfony.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline'

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

