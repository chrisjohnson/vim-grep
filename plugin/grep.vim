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
  call FormatForProgram(g:grepprg)

  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat

  try
    let &grepprg=g:grepprg
    let &grepformat=t:grepformat
    execute a:cmd . " " . a:args
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry
endfunction

command! -bang -nargs=* -complete=file Grep call s:Grep('grep<bang>',<q-args>)
command! -bang -nargs=* -complete=file GrepAdd call s:Grep('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrep call s:Grep('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrepAdd call s:Grep('lgrepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file GrepFile call s:Grep('grep<bang> -g', <q-args>)
