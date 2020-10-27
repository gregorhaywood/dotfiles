

let g:airline#themes#sys#palette = {}
"           [ 'gui fg' , 'gui bg' , ctermfg  , ctermbg ]
" Main
let s:N1   = [ '#0000ff' , '#ffff00' , 0  , 10 ]
" Tab/Buffer
let s:N2   = [ '#00ff00' , '#00ffff' , 7 , 13 ]
" Bar
let s:N3   = [ '#ff0000' , '#ff00ff' , 7  , 8 ]
let g:airline#themes#sys#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let s:I1   = [ '#0000ff' , '#ffff00' , 0  , 11 ]
let s:I2   = [ '#0000ff' , '#ffff00' , 7  , 13 ]
let s:I3   = [ '#0000ff' , '#ffff00' , 7  , 8 ]
let g:airline#themes#sys#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let s:R1   = [ '#0000ff' , '#ffff00' , 0  , 9 ]
let s:R2   = [ '#0000ff' , '#ffff00' , 7  , 13 ]
let s:R3   = [ '#0000ff' , '#ffff00' , 7  , 8 ]
let g:airline#themes#sys#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let s:V1   = [ '#0000ff' , '#ffff00' , 7  , 10 ]
let s:V2   = [ '#0000ff' , '#ffff00' , 7  , 13 ]
let s:V3   = [ '#0000ff' , '#ffff00' , 7  , 8 ]
let g:airline#themes#sys#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#sys#palette.accents = {
      \ 'black': [ '#000000' , '' , 9 , ''  ]
      \ }

let pal = g:airline#themes#sys#palette
for item in ['inactive', 'ctrlp']
  exe "let pal.".item." = pal.normal"
  for suffix in ['_modified', '_paste']
    exe "let pal.".item.suffix. " = pal.normal"
  endfor
endfor
