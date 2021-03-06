" @mtrpires VI iMproved config file
" 25/11/2018
"
" BASIC SETUP

set number " line numbering
set background=dark 
colo apprentice " color mode
syntax on " syntax highlightning

" NERDTree
autocmd vimenter * NERDTree "NERDTree plugin for folders 
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Exits if NERDTree is the only left



" HIGHLIGHTS 79TH CHARACTER
highlight ColorColumn ctermbg=darkgrey 
call matchadd('ColorColumn', '\%80v', 100)

" LOADS PATHOGEN
execute pathogen#infect()
filetype plugin indent on

" VIM-JEDI AWESOMERY
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "1"

" When started as 'evim', evim.vim will already have done these settings.
if v:progname =~? 'evim'
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

