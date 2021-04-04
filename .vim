let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Code/verilog-CPU-openMIPS
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ./if_id.v
badd +1 ./hilo_reg.v
badd +1 ./inst_rom.v
badd +1 ./mem_wb.v
badd +1 ./ex_mem.v
badd +1 ./ctrl.v
badd +1 ./ex.v
badd +1 ./mem.v
badd +1 ./openmips_min_sopc.v
badd +1 ./openmips.v
badd +1 ./id_ex.v
badd +1 ./pc_reg.v
badd +1 ./regfile.v
badd +1 ./openmips_min_sopc_tb.v
badd +1 ./defines.v
badd +1 ./id.v
badd +1 div.v
argglobal
%argdel
$argadd ./if_id.v
$argadd ./hilo_reg.v
$argadd ./inst_rom.v
$argadd ./mem_wb.v
$argadd ./ex_mem.v
$argadd ./ctrl.v
$argadd ./ex.v
$argadd ./mem.v
$argadd ./openmips_min_sopc.v
$argadd ./openmips.v
$argadd ./id_ex.v
$argadd ./pc_reg.v
$argadd ./regfile.v
$argadd ./openmips_min_sopc_tb.v
$argadd ./defines.v
$argadd ./id.v
set stal=2
edit ./defines.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
15argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 171 - ((21 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
171
normal! 020|
tabedit ./inst_rom.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
3argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./pc_reg.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
12argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./if_id.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
1argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./id.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
16argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
46
normal! zo
102
normal! zo
103
normal! zo
106
normal! zo
108
normal! zo
109
normal! zo
110
normal! zo
110
normal! zo
122
normal! zo
146
normal! zo
147
normal! zo
151
normal! zo
174
normal! zo
175
normal! zo
177
normal! zo
179
normal! zo
181
normal! zo
183
normal! zo
185
normal! zo
190
normal! zo
191
normal! zo
193
normal! zo
195
normal! zo
197
normal! zo
199
normal! zo
201
normal! zo
let s:l = 140 - ((34 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
140
normal! 0
tabedit ./id_ex.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
11argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
30
normal! zo
31
normal! zo
let s:l = 38 - ((37 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
38
normal! 013|
tabedit ./ex.v
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 123 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 54 + 89) / 178)
argglobal
7argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
58
normal! zo
59
normal! zo
85
normal! zo
91
normal! zo
158
normal! zo
177
normal! zo
180
normal! zo
182
normal! zo
218
normal! zo
232
normal! zo
233
normal! zo
240
normal! zo
261
normal! zo
262
normal! zo
270
normal! zo
271
normal! zo
273
normal! zo
275
normal! zo
276
normal! zo
277
normal! zo
279
normal! zo
281
normal! zo
284
normal! zo
285
normal! zo
287
normal! zo
289
normal! zo
299
normal! zo
301
normal! zo
306
normal! zo
314
normal! zo
316
normal! zo
322
normal! zo
323
normal! zo
326
normal! zo
327
normal! zo
329
normal! zo
331
normal! zo
333
normal! zo
335
normal! zo
336
normal! zo
let s:l = 274 - ((38 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
274
normal! 013|
wincmd w
argglobal
7argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
4
normal! zo
58
normal! zo
59
normal! zo
85
normal! zo
91
normal! zo
105
normal! zo
108
normal! zo
109
normal! zo
108
normal! zc
105
normal! zc
120
normal! zo
123
normal! zo
123
normal! zc
120
normal! zc
232
normal! zo
232
normal! zc
240
normal! zo
243
normal! zo
244
normal! zo
245
normal! zo
251
normal! zo
240
normal! zc
261
normal! zo
270
normal! zo
273
normal! zo
275
normal! zo
276
normal! zo
278
normal! zo
280
normal! zo
281
normal! zo
284
normal! zo
285
normal! zo
287
normal! zo
289
normal! zo
314
normal! zo
316
normal! zo
322
normal! zo
326
normal! zo
327
normal! zo
let s:l = 49 - ((25 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 123 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 54 + 89) / 178)
tabedit div.v
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 136 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 41 + 89) / 178)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=7
setlocal fml=1
setlocal fdn=20
setlocal fen
17
normal! zo
29
normal! zo
34
normal! zo
35
normal! zo
41
normal! zo
42
normal! zo
74
normal! zo
75
normal! zo
79
normal! zo
80
normal! zo
82
normal! zo
96
normal! zo
let s:l = 49 - ((36 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 027|
wincmd w
argglobal
if bufexists("div.v") | buffer div.v | else | edit div.v | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=7
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 24 - ((21 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 016|
wincmd w
exe 'vert 1resize ' . ((&columns * 136 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 41 + 89) / 178)
tabedit ./regfile.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
13argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
tabedit ./ex_mem.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
5argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./mem.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
8argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./mem_wb.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
4argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./hilo_reg.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
2argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./ctrl.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
6argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 018|
tabedit ./openmips.v
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 89 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 88 + 89) / 178)
argglobal
10argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
103
normal! zo
171
normal! zo
207
normal! zo
217
normal! zo
let s:l = 200 - ((20 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
200
normal! 032|
wincmd w
argglobal
10argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
15
normal! zo
103
normal! zo
171
normal! zo
207
normal! zo
217
normal! zo
let s:l = 59 - ((34 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
59
normal! 038|
wincmd w
exe 'vert 1resize ' . ((&columns * 89 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 88 + 89) / 178)
tabedit ./openmips_min_sopc.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
9argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ./openmips_min_sopc_tb.v
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
14argu
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
6
normal! zo
10
normal! zo
let s:l = 27 - ((26 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
27
normal! 010|
tabnext 8
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
