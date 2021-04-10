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
badd +208 ./id.v
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
91
normal! zo
let s:l = 179 - ((28 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
179
normal! 0
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
4
normal! zo
10
normal! zo
14
normal! zo
17
normal! zo
let s:l = 17 - ((16 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 057|
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
4
normal! zo
17
normal! zo
18
normal! zo
26
normal! zo
27
normal! zo
29
normal! zo
30
normal! zo
32
normal! zo
let s:l = 32 - ((27 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 017|
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
4
normal! zo
let s:l = 4 - ((3 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 05|
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
4
normal! zo
51
normal! zo
60
normal! zo
61
normal! zo
99
normal! zo
100
normal! zo
113
normal! zo
120
normal! zo
121
normal! zo
125
normal! zo
128
normal! zo
129
normal! zo
130
normal! zo
130
normal! zo
142
normal! zo
165
normal! zo
165
normal! zo
165
normal! zo
169
normal! zo
169
normal! zo
169
normal! zo
130
normal! zc
129
normal! zc
175
normal! zo
176
normal! zo
176
normal! zc
175
normal! zc
199
normal! zo
199
normal! zo
199
normal! zo
203
normal! zo
203
normal! zo
203
normal! zo
207
normal! zo
207
normal! zo
207
normal! zc
211
normal! zo
211
normal! zo
211
normal! zc
215
normal! zo
215
normal! zo
219
normal! zo
219
normal! zo
219
normal! zo
223
normal! zo
224
normal! zo
225
normal! zo
229
normal! zo
237
normal! zo
224
normal! zc
223
normal! zc
248
normal! zo
249
normal! zo
251
normal! zo
253
normal! zo
255
normal! zo
257
normal! zo
259
normal! zo
264
normal! zo
265
normal! zo
269
normal! zo
271
normal! zo
273
normal! zo
275
normal! zo
281
normal! zo
282
normal! zo
284
normal! zo
let s:l = 92 - ((16 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
92
normal! 052|
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
4
normal! zo
40
normal! zo
41
normal! zo
42
normal! zo
52
normal! zo
let s:l = 37 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
37
normal! 045|
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
exe 'vert 1resize ' . ((&columns * 95 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 82 + 89) / 178)
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
let s:l = 311 - ((178 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
311
normal! 01|
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
61
normal! zo
62
normal! zo
88
normal! zo
94
normal! zo
108
normal! zo
111
normal! zo
112
normal! zo
111
normal! zc
108
normal! zc
123
normal! zo
126
normal! zo
126
normal! zc
123
normal! zc
235
normal! zo
235
normal! zc
243
normal! zo
246
normal! zo
247
normal! zo
248
normal! zo
254
normal! zo
243
normal! zc
264
normal! zo
273
normal! zo
276
normal! zo
278
normal! zo
279
normal! zo
284
normal! zo
287
normal! zo
288
normal! zo
290
normal! zo
292
normal! zo
318
normal! zo
320
normal! zo
326
normal! zo
330
normal! zo
331
normal! zo
let s:l = 52 - ((0 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
52
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 95 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 82 + 89) / 178)
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
exe 'vert 1resize ' . ((&columns * 105 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 72 + 89) / 178)
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
98
normal! zo
let s:l = 83 - ((34 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
83
normal! 046|
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
let s:l = 24 - ((0 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 016|
wincmd w
exe 'vert 1resize ' . ((&columns * 105 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 72 + 89) / 178)
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
exe 'vert 1resize ' . ((&columns * 95 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 82 + 89) / 178)
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
let s:l = 197 - ((84 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
197
normal! 043|
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
113
normal! zo
201
normal! zo
239
normal! zo
249
normal! zo
311
normal! zo
let s:l = 52 - ((30 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
52
normal! 014|
wincmd w
exe 'vert 1resize ' . ((&columns * 95 + 89) / 178)
exe 'vert 2resize ' . ((&columns * 82 + 89) / 178)
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
let s:l = 2 - ((1 * winheight(0) + 26) / 53)
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
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
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
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
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
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
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
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
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
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 018|
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
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
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
15
normal! zo
23
normal! zo
let s:l = 28 - ((26 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 010|
tabnext 2
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
