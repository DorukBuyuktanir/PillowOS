org 0x7C00
bit 16


main:
	hlt

.halt:
	jmp .halt

times 510 - ($ - $$) db 0
dw 0xAA55
