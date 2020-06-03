map <leader>m :Leaderf mru --popup<CR>
"map <leader>g :Ack
map <leader>o :Leaderf bufTag --popup<CR>


nmap <leader>g :Leaderf rg --popup<CR> 
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

tnoremap <Esc> <C-\><C-n>

inoremap jj <Esc>
