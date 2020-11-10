.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
prime      DWORD   100 DUP (?) 
primeCount  DWORD   2
candidate	DWORD	5
index		DWORD	?


.CODE                           ; start of main program code
main    PROC
		
		;7.1.1
		;a
		mov bx, 0fa75h
		mov cx, 03102h
		and bx, cx

		;b
		mov bx, 0fa75h
		mov	cx, 03102h
		or	bx, cx

		;c
		mov bx, 0fa75h
		mov cx, 03102h
		xor	bx, cx

		;d
		mov	bx, 0fa75h
		not	bx

		;e
		mov ax, 0fa75h
		and	ax, 000fh

		;f
		mov ax, 0fa75h
		or ax, 0fff0h

		;g
		mov ax, 0fa75h
		xor ax, 0ffffh

		;h
		mov ax, 0fa75h
		test ax, 0004h

		;i
		mov cx, 08ebah
		not cx

		;j
		mov cx, 08ebah
		or	cx, 0edf2h

		;k
		mov cx, 08ebah
		and cx, 0edf2h

		;l
		mov cx, 08ebah
		xor	cx, 0edf2h

		;m
		mov cx, 08ebah
		test cx, 0edf2h

		;n
		mov dx, 0b6a3h
		not dx

		;o
		mov dx, 0b6a3h
		or	dx, 64c8h

		;p
		mov dx, 0b6a3h
		and	dx, 64c8h

		;q
		mov dx, 0b6a3h
		xor	dx, 64c8h

		;r
		mov dx, 0b6a3h
		test dx, 64c8h

		;7.2.1
		;a
		mov ax, 0a8b5h
		shl ax, 1

		;b
		mov ax, 0a8b5h
		shr ax, 1

		;c
		mov ax, 0a8b5h
		sar ax, 1

		;d
		mov ax, 0a8b5h
		rol ax, 1

		;e
		mov ax, 0a8b5h
		ror ax, 1

		;f
		mov ax, 0a8b5h
		mov cl, 004h
		sal ax, cl

		;g
		mov ax, 0a8b5h
		shr ax, 4

		;h
		mov ax, 0a8b5h
		mov cl, 004h
		sar ax, cl

		;i
		mov ax, 0a8b5h
		mov cl, 004h
		rol ax, cl

		;j
		mov ax, 0a8b5h
		ror ax, 4

		;k
		mov ax, 0a8b5h
		stc
		rcl ax, 1

		;l
		mov ax, 0a8b5h
		clc
		rcr ax, 1

		;m
		mov bx, 08ebah
		shl bx, 3

		;n
		mov bx, 08ebah
		shr bx, 3

		;o
		mov bx, 08ebah
		sal bx, 3

		;p
		mov bx, 08ebah
		sar bx, 3

		mov eax, 0
		ret
main    ENDP

END                             ; end of source code
