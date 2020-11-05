highlight clear 
if exists("syntax_on") 
 syntax reset 
endif

set background="dark"

" set g:colors_name="sys"

" Groups can be found in
" : help syntax.txt

highlight Comment cterm=italic ctermfg=6
highlight Constant ctermfg=13

highlight Identifier ctermfg=6 
highlight Function cterm=bold ctermfg=6
highlight Statement ctermfg=3 
highlight PreProc ctermfg=1 
highlight Type ctermfg=2 
highlight Special ctermfg=6 
highlight Underlined ctermfg=3 
highlight Error ctermfg=0 ctermbg=1 
highlight Todo ctermfg=0 ctermbg=3
highlight ColorColumn ctermbg=8

" Markdown.html
highlight htmlH1 cterm=bold,underline ctermfg=6
highlight mkdHeading ctermfg=5
" highlight mkdHeading cterm=bold,underline ctermfg=6
highlight mkdItalic cterm=italic
highlight mkdBold cterm=bold
highlight mkdUnderline cterm=underline
highlight htmlItalic cterm=italic
highlight htmlBold cterm=bold
highlight htmlUnderline cterm=underline


" Exceptions to normal groups
highlight link vimIsCommand Function
highlight link Func Function

" Spelling
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=1
