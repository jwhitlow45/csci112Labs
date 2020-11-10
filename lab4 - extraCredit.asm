.DATA
number	QWORD	-105
sum		QWORD	?

.CODE
main	PROC
		mov		rax, number
		add		rax, 300445406
		mov		sum, rax
		mov		rax, 0
		ret
main	ENDP
END