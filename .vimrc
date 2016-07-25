set nobackup
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
set winminheight=0
set undolevels=1000
set background=dark
set history=700
set autoread
set autoindent
set cmdheight=2
set smartcase
set showmatch
set hlsearch
set incsearch
set smartindent
syntax enable
set nobackup
set nowb
set noswapfile
set relativenumber
set ru
set nu
set vb
set t_vb=
set switchbuf=useopen
set textwidth=79
let mapleader = ","
nnoremap * *``
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"Navigate quick fix windwo
"
"Ignore these
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.o,*/obj
nnoremap <Leader>rep,: s/,/ /g
nnoremap <Leader>repb: s/q/\\b/g
nnoremap <Leader>e : cp<CR>
nnoremap <Leader>d : cn<CR>
nnoremap <Leader>t :TlistToggle<CR>
"nnoremap <Leader>cc ::make! -j4 -C test/sample_code clean<CR>
"nnoremap <Leader>c ::make -C ~/projects/3dAudio/ISO/3DAudio_RM4_ReferenceSoftware_20150116/modules/coreCoder/mpegD_usac/usacEncDec/make <CR>
"nnoremap <Leader>cc ::make -C ~/projects/3dAudio/ISO/3DAudio_RM4_ReferenceSoftware_20150116/modules/coreCoder/mpegD_usac/usacEncDec/make clean <CR>
nnoremap <Leader>c :make -C /home/vikas/projects/mpegh_3d/test/3DAudio_RM4_ReferenceSoftware_20150116/modules/hoaCoder/hoaDec/make <CR>:copen<CR>

nnoremap <Leader>cc :make clean -C /home/vikas/projects/mpegh_3d/test/3DAudio_RM4_ReferenceSoftware_20150116/modules/hoaCoder/hoaDec/make clean <CR>

"nnoremap <Leader>cc ::make -j4 -C utest_bs/ clean<CR>
"nnoremap <Leader>c ::make -j4 -C utest_bs/ <CR>
nnoremap <Leader>ma :cd test<CR>:make -j4 -f makefile<CR>:cd -<CR>
nnoremap <Leader>m :make!<CR>
nnoremap <Leader>maa :cd test<CR>:make -j4 -f makefile clean_all<CR>:cd -<CR>
nnoremap <Leader>fn :execute "vimgrep /" . expand("<cword>") . "/j **/*.[chm]" <Bar> cw<CR>
"nnoremap <Leader>sd :!to_sd_card.sh<CR>
noremap <Leader>fw :execute "vimgrep /" . expand("") . "/j **/*.[chm]" <Bar> cw
"Maximize window
nnoremap <Leader>w : <esc><C-w>_
"Save file
nnoremap <Leader>s <esc>:w!<CR>
"noremap <Leader>b <esc>:ls<CR>:b
"next tab
noremap <Leader>a( <esc>ysiw(
"
"open the quick fix window
noremap <Leader>v <esc>:copen<CR>
"previous tab
"noremap <Leader>s <esc>:tabp<CR>
"Make current buffer the only buffe being shown
noremap <Leader>q <esc><C-W>o

" Smart way to move between windows
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
"return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
if has('gui_running')
  set guioptions-=T  " no toolbar
  set guifont=Monospace\ 11
  colorscheme desert
endif
colorscheme desert
set path+=**
"update taglist evertime I save
autocmd BufWritePost *.c :TlistUpdate
autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.h :TlistUpdate
highlight Search guibg='Yellow' guifg='NONE'

let g:DoxygenToolkit_briefTag_pre="@Description"
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Vikas MK"

"Do tags and cscope. Do this in the top directory
"map <F2> :!ctags -R * <CR>:set tag=tags<CR>:!cscope -Rbkq<CR>:cs add cscope.out<CR>
"Only add these files to cscope
map <F2> :!find `pwd` -name "*.c" -o -name "*.h" -o -name"*.cpp" -name "*.hpp" > cscope.files<CR>:!ctags -R --languages=C,C++ --c++-kinds=+p --fields=+iaS --fields+=-l --extra=+q * <CR>:set tag=tags<CR>:!cscope -Rbq <CR>:cscope add cscope.out<CR>

"map <F5> :!find . -iname "**.[ch]"
map <F5> :!find . -iname "**"
inoremap jk <esc>
map <F12> :source ~/.vimrc<CR>
map <F11> :new ~/.vimrc<CR>
map <F8> :.!"date +%e-%d-%Y"<CR>
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
nnoremap <Leader>df :!git difftool %<CR>
nnoremap <Leader>rs :%s/^ \+//<CR>
set complete-=i
filetype plugin on
filetype indent on
"set omnifunc=syntaxcomplete#Complete
"au FileType c setl ofu=ccomplete#CompleteCpp
autocmd BufWritePre * :%s/\s\+$//e
"
if has('cscope')
    set cscopetag cscopeverbose
    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
     endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csff cs find file
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help
"    command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
"map <Leader>tt <esc><C-]>
"map <Leader>f search for C symbol
map <Leader>f <esc>:cscope find s <cword> <CR>:copen<CR>
map <Leader>ft <esc>:cscope find t <cword> <CR>:copen<CR>
"<Leader>fc functions calling this function
map <Leader>fc <esc>:cscope find c <cword> <CR>:copen<CR>
"map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **/*.[ch]" <Bar> cw<CR>
""function called by function under cursor
nnoremap <Leader>fd : cs find d <cword> <CR>:copen<CR>
"function definition of function under cursor
nnoremap <Leader>fg : cs find g <cword><CR>:copen<CR>
"find file
"nnoremap <Leader>ff : cs find f

nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

"Paste the prototype of the function above it"
map <Leader>r <esc>:w!<CR><C-]>vf(%y<C-t>O<esc>p<esc>

"
map <F2> :!find `pwd` -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files<CR>:!ctags -R * <CR>:set tag=tags<CR>:!cscope -Rbq <CR>:cscope add cscope.out<CR>:cs reset<CR>
"Color stuff
if $COLORTERM == 'gnome-terminal'
	  set t_Co=256
endif
set t_Co=256
"make is multiple jobs, plus dont jump to the first error after make
set makeprg=make
"conf for YCM
"let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
""set makeprg=!make -C ~/projects/Dolby/Dolby_Digital_Plus_Decoder_Imp/Source_Code/make/ddp_udc/
"" vundle {{{
"
 " needed to run vundle (but i want this anyways)
set nocompatible

 " vundle needs filtype plugins off
 " i turn it on later
filetype plugin indent off
syntax off


 " set the runtime path for vundle
 set rtp+=~/.vim/bundle/Vundle.vim
 set rtp+=~/.vim/bundle/ctrlp.vim
"If buffer is open switch to it instead of opening another instance
let g:ctrlp_switch_buffer = 1
"Use find command instead of vim's inbuild commands
let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux

" c style comments using *
" let g:surround_42 = "/* \r */"

 let g:surround_{char2nr("q")} = "“\r”"

"let g:ycm_global_ycm_extra_conf = '~/scrips/.ycm_extra_conf.py'
" minimal status line, only shows git branch
 " start vundle environment
 call vundle#begin()

 " list of plugins {{{2
 " let Vundle manage Vundle (this is required)
 Plugin 'gmarik/Vundle.vim'
 Plugin 'kien/ctrlp.vim'
 Plugin 'christoomey/vim-tmux-navigator'
 Plugin 'majutsushi/tagbar'
 Plugin 'tpope/vim-fugitive'
 Plugin 'tpope/vim-dispatch'
 Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-commentary'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'rdnetto/YCM-Generator'
 Plugin 'xolox/vim-misc'
 Plugin 'xolox/vim-notes'
 Plugin 'mrtazz/DoxygenToolkit.vim'
" Plugin 'scroolosse/syntastic.vim'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
 "

 " YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
"Bundle 'Valloric/YouCompleteMe'

 " add plugins before this
 call vundle#end()
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'

 " now (after vundle finished) it is save to turn filetype plugins on
filetype plugin indent on
syntax on
 "ignore warnings when compiling in vim
" set errorformat^=%-G%f:%l:\ warning:%m
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Start
"Set tmux title to name of present file being edited
" autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
" set title
"end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
