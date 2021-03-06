execute pathogen#infect()

"NERDTree
nmap <leader>nf :NERDTreeFind<cr>
nmap <leader>nn :NERDTreeToggle<cr> 
"""""""""""""""""""""""""""""""
"""      Coc.nvim
"""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




"""""""""""""""""""""""""""""""
" => leaderF
"""""""""""""""""""""""""""""""

map <leader>f :Leaderf file<CR>
map <leader>F :Leaderf function<CR>
map <leader>m :Leaderf mru<CR>
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


"""""""""""""""""""""""
" ACK
"""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


"""""""""""""""""""""""
" VIM-SYNC
"""""""""""""""""""""""""
function GenVimSyncConf()
    let s:current_file=expand('~/.vim_runtime')."/sources_non_forked/vim-sync/.sync"
    let s:config=readfile(s:current_file)
    let s:workDir=expand('<sfile>:p:h').'/.sync' 
    call writefile(s:config,s:workDir,'a')
    call system("chmod +x ".s:workDir)
    call system("echo '.sync' >> .gitignore")
endfunction
autocmd BufWritePost * :call SyncUploadFile()


"""""""""""""""""""""""
" rainbow
"""""""""""""""""""""""""
let g:rainbow_active = 1


"""""""""""""""""""""""
" vim-floaterm AND coc-vim-floaterm
"""""""""""""""""""""""""

"""""""""""""""""""""""
" LeadF
"""""""""""""""""""""""""



"""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""
let g:airline_theme='luna'


"""""""""""""""""""""""
" vim-gutter
"""""""""""""""""""""""""
"let g:gitgutter_sign_added = ''
"let g:gitgutter_sign_modified = ''
"let g:gitgutter_sign_removed = ''
"

"""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""
autocmd BufWritePre *.go :GoImports

"""""""""""""""""""""""
" vim-devicons
"""""""""""""""""""""""""
let g:rainbow_conf = {
  \    'separately': {
  \       'nerdtree': 0
  \    }
  \}



"""""""""""""""""""""""
" vdebug
"""""""""""""""""""""""""
let g:vdebug_options = {}
"let g:vdebug_options.path_maps = {"/data0/www/htdocs/".substitute(getcwd(), '^.*/', '', ''): getcwd()}
let g:vdebug_options.path_maps = {"/data0/www/htdocs/": "/Users/zhangruobin/work/"}
let g:vdebug_options['ide_key'] = "zrb-vim"
let g:vdebug_options['port'] = 9101
let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options["timeout"]=50



"let g:vdebug_options = {'ide_key': 'zrb-vim', 'port': '9001'}
"let g:vdebug_options = {'break_on_open': 0}
"let g:vdebug_options = {'server': '127.0.0.1'}
"let g:vdebug_options = {'port': '9001'}

"let g:vdebug_keymap = {
"\    "run" : "<Leader>/",
"\    "run_to_cursor" : "<Down>",
"\    "step_over" : "<Up>",
"\    "step_into" : "<Left>",
"\    "step_out" : "<Right>",
"\    "close" : "q",
"\    "detach" : "x",
"\    "set_breakpoint" : "<Leader>p",
"\    "eval_visual" : "<Leader>e"
"\}
