" TODO - Organize sections
""" Plugins
"""" Load Plugins
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'machakann/vim-highlightedyank'

" Marks
Plug 'kshenoy/vim-signature'

" Zoom current split
Plug 'troydm/zoomwintab.vim'

" Searching
Plug 'jebby/vim-searchhi'
Plug 'osyo-manga/vim-anzu'
Plug 'markonm/traces.vim'

" Git integration
Plug 'airblade/vim-gitgutter'

" Task management
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
Plug 'romainl/vim-qf'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'benmills/vimux'

" Text manipulation
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
Plug 'scrooloose/nerdcommenter', {'on': '<Plug>NERDCommenterToggle'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" Python
Plug 'w0rp/ale'

" Deoplete and dependencies/sources
Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	
	" Deoplete sources
	Plug 'Shougo/neco-vim',					{'for': 'vim'}
	Plug 'deoplete-plugins/deoplete-jedi',	{'for': 'python'}
	Plug 'Shougo/deoplete-clangx',			{'for': 'c'}
	Plug 'calviken/vim-gdscript3',			{'for': 'gdscript3'}
	Plug 'wellle/tmux-complete.vim'
	Plug 'deathlyfrantic/deoplete-spell'

call plug#end()


"""" Plugin options
""""" NERDCommenter
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = "left"
let g:NERDToggleCheckAllLines = 1

""""" Deoplete
set pyx=3
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = "/usr/bin/python3"
let g:clang_library_path = "/usr/lib/libclang.so"
let g:deoplete#sources#jedi#show_docstring = 0
let g:deoplete#auto_complete_delay = 100

""""" Gitgutter
let g:gitgutter_enabled = 1

""""" Highlighted Yank
let g:highlightedyank_highlight_duration = 1000

""""" Signature
let g:SignatureEnabledAtStartup = 1

""""" Todo.txt
let g:TodoTxtStripDoneItemPriority = 1

""""" Emmet
let g:user_emmet_leader_key = ','

""""" Searchhi
let g:searchhi_user_autocmds_enabled = 1
let g:searchhi_redraw_before_on = 1
let g:searchhi_clear_all_asap = 1
" let g:searchhi_clear_all_autocmds = "InsertInter"
" let g:searchhi_update_all_autocmds = "InsertLeave"

""""" Traces
let g:traces_preserve_view_state = 1

""""" Anzu
let g:anzu_status_format = "%p [%i/%l]"
" highlight AnzuStatusFormat cterm=bold ctermfg=red ctermbg=blue
" let g:anzu_status_format = "%#WarningMessage#%p %#Keyword#(%i/%l)%#None#"

""""" vim-qf
let g:qf_mapping_ack_style = 1
let g:qf_auto_open_quickfix = 1
let g:qf_auto_open_loclist = 1
let g:qf_bufname_or_text = 0
let g:qf_auto_resize = 0
let g:qf_auto_quit = 1

""""" Ale
let g:ale_enabled = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_echo_cursor = 0
let g:ale_fix_on_save = 0
let g:ale_fixers = {
	\ "python": ["black"]
\}
let g:ale_linters = {
	\ "python": ["flake8", "pydocstyle", "pycodestyle", "bandit"]
\}


""""" Airline

" Airline tabline options
let g:airline_extensions = ["tabline"]
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_empty = 0 " Needs my patch

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1


" let g:airline_section_a = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'
" let g:airline_section_b = '%{airline#util#append("", 0)}%{airline#util#wrap(exists("t:zoomwintab") ? "Zoom" : " " , 0)}'
" let g:airline_section_a = '%{airline#util#wrap(airline#parts#mode(), 0)}'
let g:airline_section_b = ''
let g:airline_section_c = '%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_section_x = '%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_y = '%{airline#util#wrap(airline#parts#ffenc(),1)}%{airline#util#prepend("", 0)}'
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#:%3v'
let g:airline_section_z = '%5p%% %l/%L:%v'
let g:airline_section_error = ''
let g:airline_section_warning = ''

" Airline tabline options
let g:airline_extensions = ["tabline"]
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_empty = 0

" let g:airline_theme_patch_func = 'AirlineThemePatch'
"   function! AirlineThemePatch(palette)
"     if g:airline_theme == 'badwolf'
"       for colors in values(a:palette.inactive)
"         let colors[3] = 245
"       endfor
"     endif
"   endfunction

""" Keybinds
"""" Leader key
let maplocalleader = ","
let mapleader = ","
"""" Misc mappings
" Shortcut for PlugInstall
nnoremap <leader>PI :PlugInstall<CR>

" Use tab to insert autocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Toggle invisible characters
nnoremap <leader>L :setlocal lcs=tab:»\ ,space:.,extends:›,precedes:‹,nbsp:·,trail:· list! list?<CR>

" Toggle comment
map <C-c> <Plug>NERDCommenterToggle


"""" Line movement mappings
" Shift the selected lines up/down
nnoremap <silent> J :<C-u>silent! move+<CR>==
nnoremap <silent> K :<C-u>silent! move-2<CR>==
xnoremap <silent> J :<C-u>silent! '<,'>move'>+<CR>gv=gv
xnoremap <silent> K :<C-u>silent! '<,'>move-2<CR>gv=gv

"""" Search mappings
nmap <leader><Space> <Plug>(searchhi-clear-all)
nmap <leader><CR> <Plug>(searchhi-clear-all)

"""" Buffer split mappings
nnoremap <leader>v :vnew<CR>
nnoremap <leader>s :new<CR>

" Toggle marks
nnoremap <leader>m :SignatureToggle<CR>

"""" Text selection mappings
" Select last pasted content
nnoremap <leader>gv `[v`]

"""" Tab mappings
nnoremap tn :tabnew<CR>
nnoremap tc :tabedit %<CR>
nnoremap tH :-tabmove<CR>
nnoremap tL :+tabmove<CR>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>


"""" Tag mappings
" Jump to tag under cursor in a new split
nnoremap <leader>gts :10split<CR>exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>gtv :vsplit<CR>exec("tag ".expand("<cword>"))<CR>

"""" Vimux mappings
nnoremap <leader><leader>p :call VimuxPromptCommand()<CR>
nnoremap <leader><leader>r :call VimuxRunLastCommand()<CR>

" Send lines to repl
nnoremap <leader><leader>s :call VimuxRunCommand(getline('.'))<CR>
vnoremap <leader><leader>s :call VimuxRunCommand(getline('.'))<CR>

"""" Zoomwintab mappings 
" Zoom the current split
nnoremap <leader>z :ZoomWinTabToggle<CR>


"""" Spell mappings
" Toggle spell and set spelllang
nnoremap <leader><leader>s :setlocal spell! spelllang=en_us<CR>

"""" Quickfix mappings
" Go to next/previous error in compiler quickfix window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cn :Cnext<CR>
nnoremap <leader>cp :Cprev<CR>

" Toggle the quickfix window.
" Requires qf-vim
nnoremap <expr> <leader>ct qf#IsQfWindowOpen() ? ':cclose<CR>' : ':copen<CR>'

"""" Location list mappings
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>ln :Lnext<CR>
nnoremap <leader>lp :Lprev<CR>


"""" Flake8 Mappings
nnoremap <leader>f :call flake8#Flake8()<CR>
nnoremap <leader>F :call flake8#Flake8UnplaceMarkers()<CR>

"""" Todo.txt mappings
" Open todo.txt in the current directory
nnoremap <leader>T :split todo.txt<CR>


"""" Searchhi mappings
nmap / <Plug>(searchhi-/)
nmap ? <Plug>(searchhi-?)
nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)
nmap * <Plug>(searchhi-*)
nmap g* <Plug>(searchhi-g*)
nmap # <Plug>(searchhi-#)
nmap g# <Plug>(searchhi-g#)
nmap gd <Plug>(searchhi-gd)
nmap gD <Plug>(searchhi-gD)

vmap / <Plug>(searchhi-v-/)
vmap ? <Plug>(searchhi-v-?)
vmap n <Plug>(searchhi-v-n)
vmap N <Plug>(searchhi-v-N)
vmap * <Plug>(searchhi-v-*)
vmap g* <Plug>(searchhi-v-g*)
vmap # <Plug>(searchhi-v-#)
vmap g# <Plug>(searchhi-v-g#)
vmap gd <Plug>(searchhi-v-gd)
vmap gD <Plug>(searchhi-v-gD)


"""" Go to search result in center of the screen
nnoremap zn nzzzv
nnoremap zN Nzzzv

""" Commands
" Save file as sudo
cmap w!! w !sudo tee > /dev/null %

" Expand %% to current buffer's name in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" Format json
command FormatJson %!python -m json.tool

" Make quickfix and location list loop
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry

""" Colorscheme
syntax on
augroup Highlights
	autocmd!
	autocmd ColorScheme * highlight Normal ctermbg=none
		\ | highlight CursorLine cterm=none ctermfg=none ctermbg=none
		\ | highlight CursorLineNr cterm=bold ctermfg=114
		\ | highlight QuickFixLine cterm=reverse
		\
		\ | highlight GitGutterAdd ctermfg=0 ctermbg=114
		\ | highlight GitGutterDelete ctermfg=0 ctermbg=204
		\ | highlight GitGutterChange ctermfg=0 ctermbg=180
		\
		\ | highlight SpellBad cterm=bold,underline ctermfg=204 ctermbg=none
		\ | highlight SpellCap cterm=bold,underline ctermfg=170 ctermbg=none
		\
		\ | highlight IncSearch ctermfg=white ctermbg=blue
		\ | highlight link TracesReplace IncSearch
		\ | highlight link TracesSearch Search 
		" \ | highlight AnzuStatusFormatQuery cterm=bold
		" \ | highlight AnzuStatusFormatCount cterm=bold ctermfg=114
augroup END
colorscheme onedark


""" Indentation
filetype indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set autoindent
set smartindent

""" Folds
set foldmethod=syntax

""" Line numbering
" Show absolute line number for current line
" and relative number for other lines
set number
set relativenumber
set cursorline

""" Searching
" Searchhi matches are re-highlighted when calling :source $MYVIMRC
" Don't set incsearch or hlsearch in the future if $MYVIMRC is sourced
if !exists("g:loaded_vimrc")
	let g:loaded_vimrc = 1
	set incsearch
	set hlsearch
endif
set ignorecase
set smartcase

""" Completion menu
set completeopt-=preview

""" Clipboard
if has('clipboard')
    set clipboard=unnamed,unnamedplus
endif

""" Wrapping
set whichwrap+=<,>,h,l,[,]
set wrap

""" Mouse and keyboard
set mouse=a
set timeoutlen=1000
set ttimeoutlen=10

""" Statusline
set laststatus=2

""" Backspace options
set backspace=indent,eol,start

""" Diff options
set diffopt+=vertical
set diffopt+=context:15
set diffopt+=filler
set diffopt+=indent-heuristic

""" View options
set viewdir=~/.vim/views
if !isdirectory(&viewdir)
	silent! call mkdir(&viewdir)
endif
set viewoptions=cursor,folds

""" Splits
set splitbelow
set splitright
set previewheight=10
set fillchars+=vert:│

""" Vim files
set undofile
set undodir=~/.vim/undo/
if !isdirectory(&undodir)
	silent! call mkdir(&undodir)
endif

set noswapfile
set history=200
set viminfo='20,<50,s10,h
set updatetime=500

""" Macros
set lazyredraw

""" Autogroups
" Set indentation for python
augroup PythonIndent
    autocmd!
    autocmd Filetype python setlocal noexpandtab
    autocmd Filetype python setlocal tabstop=4
    autocmd Filetype python setlocal shiftwidth=4
augroup END

" Automatically resize vim splits when host changes size.
augroup AutoResize
	autocmd!
	autocmd VimResized ?* wincmd =
	autocmd BufWinLeave ?* wincmd =
	autocmd BufWinEnter ?* wincmd =
augroup END

" The zshOption highlight group makes vim lag horribly
" I would rather have the group's highlighting disabled
" than deal with the lag
augroup DisableZshOptionSyntax
	autocmd!
	autocmd filetype zsh syn clear zshOption
augroup END

" Update anzu status when searchhi updates
augroup searchhi
	autocmd!
	autocmd User SearchHiOn AnzuUpdateSearchStatusOutput
	autocmd User SearchHiOff echo g:anzu_no_match_word
augroup END

" Toggle relative number when current buffer gains/loses focus
augroup numbertoggle
	autocmd!
	autocmd BufEnter,WinEnter,BufWinEnter,BufEnter,FocusGained * if &number | set relativenumber | endif
	autocmd BufLeave,WinLeave,BufWinLeave,BufLeave,FocusLost   * if &number | set norelativenumber | endif
augroup END

" Save / load view when entering / leaving buffer
augroup Views
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview 
augroup END

""" Helper functions
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).')'
  if v:foldlevel == 1
	let s:line = ' ◇ '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 2
	let s:line = '   ●  '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
	let s:line = '     ▪ '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 1
	return s:line[:79-len(s:info)-1+len(s:line)-strwidth(s:line)].'...'.s:info
  else
	return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

set modelineexpr

"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
"" vim:fdt=VimFoldText()
