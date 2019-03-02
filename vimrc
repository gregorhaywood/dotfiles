

" For vim, ln to ~/.vimrc
" For neovim, ln to ~/.config/nvim/init.vim



function! WC()
	let filename = expand("%")
	let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
	let result = system(cmd)
	echo result . " words"
endfunction

command WC call WC()


function! MAKE()
	let result = system("make > /dev/null &")
endfunction
command M call MAKE()





if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/dotfiles/vimrc
endif
call plug#begin('~/.vim/plugged')
Plug 'Druid-of-Luhn/essence.vim'
call plug#end()

set tabstop=4
set shiftwidth=4



set tw=0

set rtp^=~/.vim/
set guicursor=a:hor100-blinkon0


set autoindent
set showcmd

" Appearance
" set cursorline		" Mark current line
syntax on
colorscheme default
set t_Co=16		" 16 colours (xresources)

" File specific stuff 
filetype plugin on
filetype indent on
set ffs=unix		" Unix files
set autoread  		" reload if written elsewhere 
set showmatch		" match brackets

" No bells
set noerrorbells
set novisualbell

set mouse=v
