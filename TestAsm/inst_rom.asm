
inst_rom.om:     formato del fichero elf32-tradbigmips


Desensamblado de la sección .text:

00000000 <_start>:
   0:	34011100 	li	at,0x1100
   4:	34020020 	li	v0,0x20
   8:	3403ff00 	li	v1,0xff00
   c:	3404ffff 	li	a0,0xffff

Desensamblado de la sección .reginfo:

00000000 <.reginfo>:
   0:	0000001e 	0x1e
	...

Desensamblado de la sección .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	41000000 	bc0f	4 <_start+0x4>
   4:	0f676e75 	jal	d9db9d4 <_ram_end+0xd9db9c4>
   8:	00010000 	sll	zero,at,0x0
   c:	00070401 	0x70401
