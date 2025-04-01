			.rtmodel cpu, "*"

			.extern _Zp

			.extern modplay_play
			.extern program_testdmalines

 ; ------------------------------------------------------------------------------------

			.public irq_main
irq_main:
			php
			pha
			phx
			phy
			phz

			lda #0x01
			sta 0xd020
			sta 0xd021

			jsr program_testdmalines

			lda #0x02
			sta 0xd020
			sta 0xd021

			jsr modplay_play

			lda #0x00
			sta 0xd020
			sta 0xd021

			lda #0x32
			sta 0xd012
			lda #.byte0 irq_main2
			sta 0xfffe
			lda #.byte1 irq_main2
			sta 0xffff

			plz
			ply
			plx
			pla
			plp
			asl 0xd019
			rti

; ------------------------------------------------------------------------------------

irq_main2:
			php
			pha
			phx
			phy
			phz

			lda #0x00
			sta 0xd020
			sta 0xd021

			lda #0xff
			sta 0xd012
			lda #.byte0 irq_main
			sta 0xfffe
			lda #.byte1 irq_main
			sta 0xffff

			plz
			ply
			plx
			pla
			plp
			asl 0xd019
			rti

; ------------------------------------------------------------------------------------
