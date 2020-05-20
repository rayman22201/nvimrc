" Auto-Install plugged if it's not already installed.
if has('win32') 
    if !empty(glob('~/AppData/Local/nvim/')) && empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
      " windows version
      call system("md " . expand("~/AppData/Local/nvim/autoload/"))
      call system("curl -o " . expand("~/AppData/Local/nvim/autoload/plug.vim") . " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if !empty(glob('~/.config/nvim/')) && empty(glob('~/.config/nvim/autoload/plug.vim'))
      " linux version
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notat"ion; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'

Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/echodoc.vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'othree/csscomplete.vim'
Plug 'chrisbra/colorizer'
Plug 'maksimr/vim-jsbeautify'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'heavenshell/vim-jsdoc'
Plug 'lepture/vim-jinja'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'Yggdroot/indentLine'
Plug 'nacitar/a.vim'
Plug 'rdolgushin/gitignore.vim'
Plug 'matze/vim-move'
Plug 'rhysd/clever-f.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript.jsx' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'severin-lemaignan/vim-minimap', { 'on':  'MinimapToggle' }
Plug 'tpope/vim-surround'
Plug 'foosoft/vim-argwrap', { 'on': 'ArgWrap' }
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'djoshea/vim-autoread'
Plug 'milkypostman/vim-togglelist'
" Uncomment the below plugin in no patched font is available
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-eunuch'
Plug 'gcmt/taboo.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'chaoren/vim-wordmotion'

" themes
Plug 'drewtempelmeyer/palenight.vim'

" Initialize plugin system
call plug#end()

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set number

:tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert 

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" YouCompleteMe settings
"let g:ycm_add_preview_to_completeopt = 0
"set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:used_javascript_libs = 'jquery,react,d3,requirejs,underscore,jasmine'
let g:AutoPairsUseInsertedCount = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostics_ui = 0

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers =  {
            \   'c,cpp' : ['->', '.', '::', 're!(?=[a-zA-Z_]{5})'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html,xml': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.']
            \ }

" jedi-vim settings
let g:jedi#show_call_signatures_delay = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = "<C-]>"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<C-^>"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>e"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0


" Enable some IDE-like features for JS / TS and Java
autocmd FileType java,javascript,jsx,typescript,tsx nmap <silent> <C-]> :YcmCompleter GoToDefinition<CR>
autocmd FileType java,javascript,jsx,typescript,tsx nmap <silent> <Leader>d :YcmCompleter GetDoc<CR>
autocmd FileType java,javascript,jsx,typescript,tsx nmap <silent> <Leader>t :YcmCompleter GetType<CR>
autocmd FileType java,javascript,jsx,typescript,tsx nmap <silent> <C-^> :YcmCompleter GoToReferences<CR>
autocmd FileType java,javascript,jsx,typescript,tsx nmap <silent> <Leader>e :execute ':YcmCompleter RefactorRename ' . input('New Name: ')<CR>

" Git Gutter settings
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
set updatetime=100


" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


" Ultisnips settings
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsListSnippets = '<c-b>'
let g:UltiSnipsSnippetsDir=expand("~/.vim/CustomSnippets")
let g:UltiSnipsSnippetDirectories=["CustomSnippets", "UltiSnips"]


" Echodoc enabled
let g:echodoc#enable_at_startup = 1

" Auto-PEP8 settings
let g:autopep8_max_line_length=120
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" Clever F settings
let g:clever_f_smart_case = 1
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1


" Polyglot plugin settings
let g:polyglot_disabled = ['markdown', 'c', 'cpp']
let g:vim_json_syntax_conceal = 0
let g:markdown_syntax_conceal = 0
let g:javascript_plugin_flow = 0
let g:markdown_fenced_languages = ['html', 'python', 'javascript', 'typescript', 'cpp', 'java', 'bash=sh']
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1


" Ale (autolinting) settings
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'

augroup OnStopLintingGroup
    autocmd!
    autocmd User ALEJobStarted call lightline#update()
    autocmd User ALELintPost call lightline#update()
    autocmd User ALEFixPost call lightline#update()
augroup END

let g:ale_python_flake8_options = '--ignore=W391,F821,F403 --max-line-length=120'
let g:ale_completion_enabled = 0

hi link ALEErrorSign DiffDelete
hi link ALEError Error
hi link ALEWarning Search

nmap <silent>[e <Plug>(ale_previous_wrap)
nmap <silent>]e <Plug>(ale_next_wrap)

let g:ale_typescript_tslint_config_path = $HOME . '/.vim/tslint.json'
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['tslint', 'tsserver']
\}

let g:ale_fixers = {
\   'typescript': ['tslint'],
\}

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_pattern_options = {
\   '.*\.cpp$': {'ale_enabled': 0},
\   '.*\.c$': {'ale_enabled': 0},
\   '.*\.hpp$': {'ale_enabled': 0},
\   '.*\.h$': {'ale_enabled': 0},
\   '.*\.C$': {'ale_enabled': 0},
\   '.*\.CPP$': {'ale_enabled': 0},
\   '.*\.H$': {'ale_enabled': 0},
\   '.*\.HPP$': {'ale_enabled': 0}
\}

" QuickFix / Location list settings
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" go through location lists in general
nmap <silent>]l :lnext<CR>
nmap <silent>[l :lprevious<CR>

" Toggle vim line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

nmap <silent> <A-l> :call NumberToggle()<CR>

" Typescript / React settings
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja.html
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,jinja setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" JsBeautify bindings
autocmd FileType javascript.jsx noremap <buffer> <F8> :call JsBeautify()<cr>
autocmd FileType typescript noremap <buffer> <F8> :ALEFix<cr>
autocmd FileType json noremap <buffer> <F8> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <F8> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <F8> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <F8> :call CSSBeautify()<cr>
autocmd FileType javascript.jsx vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>

" Enhance command-line completion
set wildmenu

" Allow backspace in insert mode
set backspace=indent,eol,start

" vim indentation settings
set autoindent

" Highlight matching parentheses/braces by default
set showmatch

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8

" Change mapleader
let mapleader=","

" Splits config
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


" reduces splits to a single line
set wmh=0

" resize current buffer by +/- 5
nnoremap <silent> _ :vertical resize -5<cr>
nnoremap <silent> + :vertical resize +5<cr>
nnoremap <silent> - :resize +5<cr>

" By default don't wrap lines
set nowrap

" But do wrap on these types of files...
autocmd FileType markdown setlocal wrap
autocmd FileType html setlocal wrap

" Enable syntax highlighting
syntax on

" A vertical line that delimits 120 chars
set colorcolumn=121
highlight ColorColumn ctermbg=236

" Color scheme
try
  set t_Co=256
endtry
set background=dark
if (has("termguicolors"))
    set termguicolors
endif

colorscheme palenight

" Highlight current line
set cursorline

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Fuzzy search - files/buffers/MRU
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'wa'
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip       " MacOSX/Linux
set wildignore+=*\\node_modules\\*,*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links'}

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" When highlighting search terms, make sure text is contrasting color
highlight Search ctermbg=221 ctermfg=black

" Do the same for gvim
highlight Search guibg=#fac863 guifg=black
nnoremap <CR> :nohlsearch<CR>/<BS>

" Always show status line
set laststatus=2

" Respect modeline in files
set modeline
set modelines=4

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd


" Start scrolling three lines before the horizontal window border
set scrolloff=2

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
set timeoutlen=1000 ttimeoutlen=0
nnoremap <silent> <F6> :!clear;python3 %<CR>
nnoremap <silent> <F5> :!clear;python %<CR>

" Minimap settings
let g:minimap_highlight='Visual'
nnoremap <silent> <Leader>m :MinimapToggle<CR>

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tr :TabooRename

" Change Macro recorder binding
noremap <leader>q q
map q <Nop>
nnoremap <space> @q

" Special filetype settings
au FileType python setl colorcolumn=80
au FileType rst setl colorcolumn=70
au FileType json,cpp,c,nim setl tabstop=2 softtabstop=2 et shiftwidth=2

" JSDoc Generation hotkey (should be used on the function signature)
nmap <silent> <leader>j ?function<cr>:noh<cr><Plug>(jsdoc)

" Tagbar (Code structure hotkey)
nmap <silent> <Leader>b:TagbarToggle<CR>
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" Folding settings
set nofoldenable

" .swp files location
set directory=$HOME/.vim/swapfiles//

" indentation guide character
let g:indentLine_char = '┆'
let g:indentLine_fileTypeExclude = ['cpp', 'c', 'text']

" Vim
" guide color
let g:indentLine_color_term = 239

" "GVim
let g:indentLine_color_gui = '#4e4e4e'

" colorize CSS
"let g:colorizer_auto_color = 1  " doesn't work for some reason
let g:colorizer_auto_filetype='css,html,jinja,javascript,typescript'

" Arguments/lists/dicts inline/per line
nnoremap <silent> <leader>a :ArgWrap<CR>

" Tab title improvements
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    let s .= ' '
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''      "temp string for buffer names while we loop and check buftype
    let m = 0       " &modified counter
    let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction

" Devicons settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Line move plugin
if !has("nvim")
    let c='a'
    while c <= 'z'
        exec "set <A-".c.">=\e".c
        exec "imap \e".c." <A-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
endif

let g:move_key_modifier = 'A'

" Bottom line settings (Lightline plugin)
set noshowmode

" Modify g:font_patched to 0 if no patched font is installed
let g:font_patched = 0

let g:separator_left_symbol = g:font_patched ? "\ue0b0":""
let g:separator_right_symbol = g:font_patched?"\ue0b2":""
let g:subseparator_left_symbol = g:font_patched?"\ue0b1":"|"
let g:subseparator_right_symbol = g:font_patched?"\ue0b3":"|"
let g:line_number_symbol = g:font_patched?"\ue0a1":"L/N"
let g:read_only_symbol = g:font_patched?"\ue0a2":"RO"
let g:git_symbol = g:font_patched?"\ue0a0":""

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \ 'right': [['ale_error', 'ale_warning', 'lineinfo'], ['clock', 'percent'], [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineLineinfo',
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'clock': 'LightLineClock',
      \ },
      \ 'component_expand': {
      \   'ale_warning': 'ALEGetWarningStatusLine',
      \   'ale_error': 'ALEGetErrorStatusLine'
      \ },
      \ 'component_type': {
      \   'ale_warning': 'warning',
      \   'ale_error': 'error'
      \ },
      \ 'separator': { 'left': g:separator_left_symbol, 'right': g:separator_right_symbol},
      \ 'subseparator': { 'left':g:subseparator_left_symbol, 'right': g:subseparator_right_symbol}
      \ }

function! ALEGetWarningStatusLine()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:all_non_errors == 0 ? '' : printf('⚠ %d', l:all_non_errors)
endfunction

function! ALEGetErrorStatusLine()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:all_errors == 0 ? '' : printf('✗ %d', l:all_errors)
endfunction

function! LightLineLineinfo()
    return winwidth(0) > 50 ? g:line_number_symbol.' '.line('.').':'.virtcol('.') : ''
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &readonly ? g:read_only_symbol : ''
endfunction

function! LightLineFilename()
  let fname = winwidth(0) > 120 ? expand('%:f') : expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~ '__Tagbar__' ? '' :
        \ fname =~ 'NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let branch = fugitive#head()
      let gitStats = GitGutterGetHunkSummary()
      return winwidth(0) > 100 ?
          \ (branch !=# '' ? '+'.gitStats[0].' ~'.gitStats[1].' -'.gitStats[2].''.g:git_symbol.' '.branch : '') :
          \ (winwidth(0) > 80 ? (branch !=# '' ? g:git_symbol.' '.branch : ''):'')
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 50 ? (g:font_patched ? WebDevIconsGetFileTypeSymbol() : winwidth(0) > 100 ? &filetype : '') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 100 ? (&fileformat !=# '' ? (g:font_patched ? WebDevIconsGetFileFormatSymbol() : &fileformat) : '') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 100 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname =~ '__Tagbar__' ? 'Structure' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'Files' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:currentTime =strftime('%a %D %I:%M %P')
function! LightLineClockCB(timer)
  let g:currentTime =strftime('%a %D %I:%M %P')
endfunction
let clockTimer = timer_start(10000, 'LightLineClockCB', {'repeat': -1})

function! LightLineClock()
  return g:currentTime
endfunction 

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" Treat .test files as python files by default
au BufNewFile,BufRead *.test,*.stage set ft=python
au BufNewFile,BufRead *.log AnsiEsc
au BufNewFile,BufRead *.log set wrap

set ff=unix

if exists('g:fvim_loaded')
  set guifont=DejaVu
endif

" IX paste bin support
function! RunIx()
    " copy the current buffer into a temp file and upload it to ix.io
    let o = systemlist("ix", bufnr("%"))
    " copy the resulting url to the clipboard and tell the user.
    call setreg("+", o[-1])
    echo "Ix copied to clipboard: " o[-1]
endfunction
command! IX call RunIx()
noremap <leader>ix :IX<CR>

" My function to create github links for the current line of code
function! GithubLink()
    let filepath = bufname("%")
    let script = fnamemodify(resolve("~/.vim/scripts/ghlink.py"), ":p") . " " . filepath . " " . line(".")
    let url = system(script)
    call setreg("+", url)
    return url
endfunction
command! GithubLink call s:GithubLink()
nnoremap <leader>gl :echo GithubLink()<cr>

let g:slack_vim_token="xoxp-516583693365-516277795185-1058956029728-de173a75a08cadc6ef9cba7a606"
let g:slack_email_domain="crankuptheamps.com"

set fileformat=unix
set fileformats=unix,dos
set clipboard=unnamedplus
set mouse=a
if exists('g:fvim_loaded')
	nnoremap <leader>ff :FVimToggleFullScreen<CR>
	FVimCursorSmoothBlink v:true
    FVimToggleFullScreen
endif

" Make built in vim file browser act more like nerd tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
nnoremap <leader>- :Vexplore<CR>
nnoremap bh :bp<CR>
nnoremap bl :bn<CR>
imap jj <Esc>

:nnoremap <Leader>q :Bdelete<CR>

if has('win32') 
    command! Powershell terminal powershell
    call serverstart('localhost:58973') 
else
    let $PATH .= ':/home/ray/.local/bin'
    let ips = split(system('hostname -I'))
    call serverstart(ips[0] . ':58973') 
endif

