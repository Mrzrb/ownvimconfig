map <leader>m :LeaderfMru<CR>
"map <leader>g :Ack
map <leader>o :CocList outline<CR>


nmap <leader>g :Ack 
nmap <leader>g :CocList grep<CR> 
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

nmap <leader>t :FloatermNew 
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>th :FloatermHide<CR>

tnoremap <Esc> <C-\><C-n>
