	.org 0x0
	.set noat
	.set noreorder
	.set nomacro
.global _start
_start:
	ori $1,$0,0x1100
	ori $1,$1,0x0020
	ori $1,$1,0x4400
	ori $1,$1,0x0044
