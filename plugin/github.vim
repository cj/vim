" http://github.com/solars/github-vim/
" sol@textmode.at

if exists("loaded_github") || &cp
  finish
endif


" --- main functions --- "

function! s:Open() range
  let url = s:ReposUrl().'/'.s:RelPath().'#L'.a:firstline.'-'.a:lastline
  call system('echo '.url.' | '.g:gist_clip_command)
endfunction


" --- key mappings --- "
if !hasmapto('<Plug>GithubOpen', 'v')
  vmap <unique>gho <Plug>GithubOpen
endif
vnoremap <unique> <script> <Plug>GithubOpen <SID>Open
vnoremap <silent> <SID>Open :call <SID>Open()<CR>

" --- helpers --- "

" current branch name
function! s:CurrentBranch()
  if !exists('b:branch')
    let branches = s:CdExec(expand("%:p:h"),"git branch")
    if empty(branches)
      return
    endif
    let b:branch = matchstr(branches, '\* \zs.\{-}\ze\n.*')
  endif
  return b:branch
endfunction

" relative path of the current file to the repository root
function! s:RelPath()
  if !exists('b:rel_path')
    let root = expand('%:p:h')
    let file = expand('%:p')
    let b:rel_path = expand('%') " strpart(file,matchend(file, root))
  endif
  return b:rel_path
endfunction

" finds the github remote repository identifier
" precedence: github > origin > other
function! s:Remote()
  let url=''
  if !exists('b:remote')
    let remotes = split(s:CdExec(expand("%:p:h"),'git remote -v'),"\n")
    let github_remotes = filter(remotes, 'v:val =~ "origin"')
    if empty(github_remotes)
      return
    endif
    let dict={}
    let fallback = split(github_remotes[0])[1]
    if has_key(dict, 'github')
      let b:remote = dict['github']
    elseif has_key(dict,'origin')
      let b:remote = dict['origin']
    else
      let b:remote = fallback
    end
  endif
  return b:remote
endfunction

" the github project url
function! s:ProjectUrl()
  if !exists('b:project_url')
    let remote_url = s:Remote()
    let user = matchstr(remote_url,'.*github\.com[:/]\zs[^/]\+\ze\/.*')
    let project = matchstr(remote_url,'.*github\.com[:/][^/]\+\/\zs[^.]\+\ze\.git')
    let b:project_url = 'http://github.com/'.user.'/'.project
  endif
  return b:project_url
endfunction

" the github repository url
function! s:ReposUrl()
  if !exists('b:repos_url')
    let b:repos_url = s:ProjectUrl().'/tree/'.s:CurrentBranch()
  endif
  return b:repos_url
endfunction

" executes cmd in the given dir
function! s:CdExec(dir,cmd)
  let cur_dir=getcwd()
  exe 'lcd '.a:dir
  let output=system(a:cmd)
  exe 'lcd '.cur_dir
  return output
endfunction

function! s:EscapeUrl(str)
  return substitute(a:str,'\C[ !%#]','\\&','g')
endfunction

" print and set error msg
function! s:error(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl None
  let v:errmsg = a:msg
endfunction
