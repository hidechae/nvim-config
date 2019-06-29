" +----------------+
" | Basic Settings |
" +----------------+
set background=dark
set hlsearch
set ignorecase
set smartcase
set wildignorecase
set visualbell
set incsearch
set number
set backspace=indent,eol,start
set backspace=2
set nofoldenable

" split new file down or right
set splitbelow
set splitright

set laststatus=2

" file encoding
set fileencoding=utf-8
set encoding=utf-8

syntax on

"wildmenu
set wildmode=list:longest

"visualize tab, space, etc
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%

" tab
set tabstop=2
set shiftwidth=2
set expandtab

" search by rotation
set wrapscan

" set cursorline
set cursorcolumn


" +-------------------+
" | Fileytpe Settings |
" +-------------------+
autocmd BufNewFile,BufRead *.rb       set filetype=ruby       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.py       set filetype=python     tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.php      set filetype=php        tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.hh       set filetype=php        tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.hhi      set filetype=php        tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.slim     set filetype=slim       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html     set filetype=html       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html.tag set filetype=html       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.scss     set filetype=scss       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.css      set filetype=scss       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.coffee   set filetype=coffee     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ts       set filetype=typescript tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.jsx      set filetype=javascript tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.jade     set filetype=pug        tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.jade.tag set filetype=pug        tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.pug      set filetype=pug        tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.scala    set filetype=scala
autocmd BufNewFile,BufRead *.sbt      set filetype=scala
autocmd BufNewFile,BufRead *.go       set filetype=go
autocmd BufNewFile,BufRead *.json     set filetype=json       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.snip     set                     tabstop=2 shiftwidth=2 noexpandtab
autocmd BufNewFile,BufRead *.conf     set filetype=sh         tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ex       set filetype=elixir     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.exs      set filetype=elixir     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.eex      set filetype=elixir     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.swift    set filetype=swift      tabstop=4 shiftwidth=4 listchars=

"omnifunc
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs        set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" settings for leafgarland/typescript-vim
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"omnifunc error support
setlocal omnifunc=syntaxcomplete#Complete
:map <silent> <F3> :setlocal omnifunc=syntaxcomplete#Complete<CR>

"dictionary
autocmd FileType php   set dictionary=~/.vim/dict/PHP.dict
autocmd FileType js    set dictionary=~/.vim/dict/javascript.dict
autocmd FileType scala set dictionary=~/.vim/dict/scala.dict
autocmd FileType java  set dictionary=~/.vim/dict/java.dict
autocmd FileType c     set dictionary=~/.vim/dict/c.dict
autocmd FileType cpp   set dictionary=~/.vim/dict/cpp.dict


" +------+
" | Plug |
" +------+
call plug#begin()

  Plug 'scrooloose/nerdtree'
  Plug 'joshdick/onedark.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Configuration for vim-plug
  Plug 'derekwyatt/vim-scala'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

  " highlight
  Plug 'leafgarland/typescript-vim'
  Plug 'digitaltoad/vim-pug'
  Plug 'gko/vim-coloresque'

  " FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Snippet
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

call plug#end()

colorscheme onedark


" +----------+
" | NERDTree |
" +----------+
let NERDTreeWinSize=50

function! NERDTreeOpen()
  let file = expand("%")
  if file =~ "^NERD_tree_"
"    wincmd p
    NERDTreeToggle
  elseif file == ""
    NERDTreeFocus
  else
    NERDTreeFind
  endif
endfunction

map <C-n> :call NERDTreeOpen()<CR>


" +---------+
" | coc.vim |
" +---------+
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" +--------+
" | vimtab |
" +--------+
  nnoremap <Space> t t
  nnoremap <Space> T T
  nnoremap t <Nop>
  nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
  nnoremap <silent> tk :<C-u>tabclose<CR>
  nnoremap <silent> tn :<C-u>tabnext<CR>
  nnoremap <silent> tp :<C-u>tabprevious<CR>


" +-----+
" | FZF |
" +-----+
set rtp+=~/.fzf

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! FileFind()
  let s:git_root = s:get_git_root()
  if empty(s:git_root)
    Files
  else
    GFiles
  endif
endfunction

nnoremap <C-g> :Ag<Space>
nnoremap <C-o> :call FileFind()<CR>
" nnoremap <C-m> :History<CR>
" nnoremap <S-o> :GFiles?<CR>

nnoremap <silent> ff  :Files<CR>
nnoremap <silent> fgs :GFiles?<CR>
nnoremap <silent> fm  :History<CR>
nnoremap <silent> fs  :Snippets<CR>


" +---------+
" | Snippet |
" +---------+

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["snippets/local"]


" +---------+
" | mapping |
" +---------+
map <silent> <ESC><ESC> :noh<CR>

" like shell
imap <silent> <C-a> <ESC>0i
imap <silent> <C-e> <ESC>$a
"imap <silent> <C-k> <ESC>Di

" for java
set sm
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1

"delete space
:map <silent> <F1> :%s /\s\+$//gc<CR>

" for source master
:map <silent> <F2> :%s/^\d\d*\ */    '/g<CR>:%s/\ *201[45].*/',/g<CR>

