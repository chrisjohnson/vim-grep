" Grep utility
if !exists("g:grepprg")
  let output = system("git rev-parse --is-inside-work-tree")
  let is_git_repo = v:shell_error == 0

  if is_git_repo
    let g:grepprg="git --no-pager grep -n"
  else
    if executable("ag")
      let g:grepprg="ag --nogroup --column --hidden"
    else
      let g:grepprg="grep -rnH "
    endif
  endif
endif

function! FormatForProgram(program)
  if match(a:program, '^a(g|ck)') != -1
    let b:grepformat="%f:%l:%c:%m"
  else
    let b:grepformat="%f:%l:%m"
  endif
endfunction

function! s:Grep(cmd, args)
  call FormatForProgram(g:grepprg)

  if exists(":Dispatch")
    if match(a:cmd, "^l.*") != -1
      call s:SearchWithGrep(a:cmd, a:args)
    else
      call s:SearchWithDispatch(a:cmd, a:args)
    endif
  else
    call s:SearchWithGrep(a:cmd, a:args)
  endif
endfunction

function! s:SearchWithGrep(cmd, args)
  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat

  try
    let &grepprg=g:grepprg
    let &grepformat=b:grepformat
    execute a:cmd . " " . a:args
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry
endfunction

function! s:SearchWithDispatch(cmd, args)
  let l:makeprg_bak = &l:makeprg
  let l:errorformat_bak = &l:errorformat

  try
    let &l:makeprg = g:grepprg . ' ' . a:args
    let &l:errorformat = b:grepformat

    Make
  finally
    let &l:makeprg = l:makeprg_bak
    let &l:errorformat = l:errorformat_bak
  endtry
endfunction

command! -bang -nargs=* -complete=file Grep call s:Grep('grep<bang>',<q-args>)
command! -bang -nargs=* -complete=file GrepAdd call s:Grep('grepadd<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrep call s:Grep('lgrep<bang>', <q-args>)
command! -bang -nargs=* -complete=file LGrepAdd call s:Grep('lgrepadd<bang>', <q-args>)
