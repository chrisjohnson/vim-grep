" Grep utility
if !exists("g:grepprg")
  let g:grepprg="git grep -n"
endif

function! FormatForProgram(program)
  if match(a:program, '^a(g|ck)') != -1
    let t:grepformat="%f:%l:%c:%m"
  else
    let t:grepformat="%f:%l:%m"
  endif
endfunction

function! s:Grep(cmd, args)
  redraw
  echo "Searching ..."
  call FormatForProgram(g:grepprg)

  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat

  try
    let &grepprg=g:grepprg
    let &grepformat=t:grepformat
    silent execute a:cmd . " " . a:args
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry

  exec "map <silent> <buffer> q :ccl<CR>"
  exec "map <silent> <buffer> t <C-W><CR><C-W>T"
  exec "map <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
  exec "map <silent> <buffer> o <CR>"
  exec "map <silent> <buffer> go <CR><C-W><C-W>"
  exec "map <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
  exec "map <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"

  redraw!
endfunction

command! -bang -nargs=* -complete=file Grep call s:Grep('grep<bang>',<q-args>)
command! -bang -nargs=* -complete=file GrepAdd call s:Grep('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrep call s:Grep('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrepAdd call s:Grep('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file GrepFile call s:Grep('grep<bang> -g', <q-args>)
