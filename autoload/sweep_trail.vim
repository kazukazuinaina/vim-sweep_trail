scriptencoding utf-8
" 行末スペースを自動的に削除します．
" Version: 1.0
" Author: hogehoge
" License: VIM LISENCE

"グローバル変数を使って多重ロードを防ぐ
if !exists('g:sweep_trail#enable')
    let g:sweep_trail#enable = 1
endif

function! sweep_trail#setup_highlight()
    highlight default ZenSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
endfunction

function! sweep_trail#HighlightZenkakuSpace()
    let w:zenspace_match_id = matchadd('ZenSpace','　')
endfunction

function! sweep_trail#sweep()
    " patternが\s\+$(\sが空白文字を意味する)
    " stringsが未指定？
    " flagsが/e?(eは文字列の末尾を示す)
    " help usr_27.txtを読もう
    %substitute/\s\+$//e
endfunction

function! sweep_trail#ZenkakuSweep()
    %s/　+$//g
endfunction

function! sweep_trail#auto_sweep()
    if g:sweep_trail#enable
        call sweep_trail#sweep()
    endif
endfunction

function! sweep_trail#switch_on()
    if g:sweep_trail#enable == 0
        let g:sweep_trail#enable = 1
    endif
endfunction

function! sweep_trail#switch_off()
    if g:sweep_trail#enable == 1
        let g:sweep_trail#enable = 0
    endif
endfunction

call sweep_trail#setup_highlight()
