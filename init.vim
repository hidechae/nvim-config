colorscheme darcula

set background=dark
set hlsearch
set ignorecase
set smartcase
set wildignorecase
set visualbell
"set foldmethod=marker
set incsearch
set number
set backspace=indent,eol,start
set backspace=2
set nofoldenable

" split new file down or right
set splitbelow
set splitright

set statusline=%F%m%r%h%w\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ %{fugitive#statusline()}\ %=\ %3l/%3L,%3v\ %10P\ %4m
set laststatus=2

"helptags $HOME/.vim/doc

" file encoding
set fileencoding=utf-8
set encoding=utf-8

syntax on

"wildmenu
"set wildmenu
"set wildmode=list,longest,full
set wildmode=list:longest

"visualize tab, space, etc
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
"set listchars=tab:?-,trail:-,eol:?,extends:?,precedes:?,nbsp:%

" tab
set tabstop=2
set shiftwidth=2
set expandtab
" set softtabstop=4

" search by rotation
set wrapscan

" set smartindent

" filetype and tabwidth
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
  Plug 'blueshirts/darcula'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Configuration for vim-plug
  Plug 'derekwyatt/vim-scala'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()


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
nnoremap <silent> fzf :<C-u>FZF<CR>


"delete space
:map <silent> <F1> :%s /\s\+$//gc<CR>


" map
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

" for source master
:map <silent> <F2> :%s/^\d\d*\ */    '/g<CR>:%s/\ *201[45].*/',/g<CR>

map <C-n> :NERDTreeToggle<CR>
