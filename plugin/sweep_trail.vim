" 行末スペースを自動的に削除します．
" Version: 1.0
" Author: hogehoge
" Lisence: VIM LICENSE

" 多重ロード防止(慣習的に g:loaded_{plugin-name} とするらしい)
if exists('g:loaded_sweep_trail')
    finish
endif
let g:loaded_sweep_trail = 1

let s:save_cpo = &cpo
set cpo&vim

"Vimのユーザーが定義した'cpoptions'を一時退避させることで副作用を回避する

"ユーザーコマンド定義
command! -bar SweepTrail call sweep_trail#sweep()
command! -bar SwitchON call sweep_trail#switch_on()
command! -bar SwitchOFF call sweep_trail#switch_off()

" ファイルの保存前にプラグインを呼び出すようにする
" autocommandをgloupにする
augroup plugin-sweep_trail
    autocmd!
    autocmd BufWritePre * call sweep_trail#auto_sweep()
    autocmd ColorScheme * call sweep_trail#setup_highlight()
    autocmd VimEnter,WinEnter,FileType * call sweep_trail#HighlightZenkakuSpace()
augroup END

" 一時退避させた'cpoptions'を復活させる
let &cpo = s:save_cpo
" 指定した変数を削除する
unlet s:save_cpo

