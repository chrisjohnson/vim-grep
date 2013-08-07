" Grep utility
if !exists("g:grepprg")
  let g:grepprg="git grep -n"
endif

if !exists("g:grepformat")
  let g:grepformat="%f:%l:%m"
endif

function! s:Grep(cmd, args)
  redraw
  echo "Searching ..."

  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat

  try
    let &grepprg=g:grepprg
    let &grepformat=g:grepformat
    silent execute a:cmd . " " . a:args
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry

  if a:cmd =~# '^l'
    botright lopen
  else
    botright copen
  endif

  exec "nnoremap <silent> <buffer> q :ccl<CR>"
  exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
  exec "nnoremap <silent> <buffer> o <CR>"
  exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
  exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
  exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"

  redraw!
endfunction

command! -bang -nargs=* -complete=file Grep call s:Grep('grep<bang>',<q-args>)
command! -bang -nargs=* -complete=file GrepAdd call s:Grep('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrep call s:Grep('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrepAdd call s:Grep('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file GrepFile call s:Grep('grep<bang> -g', <q-args>)
