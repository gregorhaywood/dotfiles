

" For vim, ln to ~/.vimrc
" For neovim, ln to ~/.config/nvim/init.vim

if has('nvim')
	
endif


set rtp^=~/.vim/
set guicursor=a:hor100-blinkon0


set autoindent
set showcmd

" Appearance
set cursorline		" Mark current line
syntax on
colorscheme default
set t_Co=16		" 16 colours (xresources)

" File specific stuff 
filetype plugin on
filetype indent on
set ffs=unix		" Unix files
set autoread  		" reload if written elsewhere 
" set noswapfile		" as I have other backups


set showmatch		" match brackets

" No bells
set noerrorbells
set novisualbell



set mouse=v
