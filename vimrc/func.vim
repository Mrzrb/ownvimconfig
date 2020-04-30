function! ShowFuncName()
    let cursor_pos = getpos('.')
    echohl ModeMsg
    normal! [[k
    echo getline('.')
    echohl None
    call setpos('.', cursor_pos)
endfunction
