map <leader>m :Leaderf mru <CR>
"map <leader>g :Ack
map <leader>o :Leaderf bufTag <CR>


nmap <leader>g :Leaderf rg <CR> 
vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction


" Fast saving
nmap <leader>w :w!<cr>
map <leader>ss :setlocal spell!<cr>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nmap <leader><CR> :noh<CR>
nmap <leader>z :Goyo<CR>

nmap <leader>t :FloatermToggle<CR>
inoremap <leader>t :FloatermToggle<CR>
tnoremap <leader>t <C-\><C-n>: FloatermToggle<CR>

nmap <leader>nt :FloatermNew<CR>
inoremap <leader>nt :FloatermNew<CR>
tnoremap <leader>nt <C-\><C-n>: FloatermNew<CR>

nmap <leader>[t :FloatermPrev<CR>
inoremap <leader>[t :FloatermPrev<CR>
tnoremap <leader>[t <C-\><C-n>: FloatermPrev<CR>

nmap <leader>]t :FloatermNext<CR>
inoremap <leader>]t :FloatermNext<CR>
tnoremap <leader>]t <C-\><C-n>: FloatermNext<CR>

tnoremap <Esc> <C-\><C-n>

inoremap jj <Esc>
vnoremap <leader>c :w !pbcopy<CR><CR> 
