function! ToggleComment()
  let filetype = &filetype

  if filetype == 'vim'
    let comment = '"'
  else
    let comment = '#'
  endif

  if strlen(getline('.'))+1 < strlen(comment)
    return
  endif

  let save_pos = getpos(".")
  if strpart(getline('.'), 0, strlen(comment)+1) == comment.' '
    execute "normal! 0\"_dw"
  else
    execute "normal! 0i".comment." \<Esc>"
  endif
  call setpos('.', save_pos)
endfunction
