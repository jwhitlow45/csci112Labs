.586
.MODEL FLAT
.STACK 4096
.DATA




.CODE
	main PROC
		CodeBegin:
			mov eax, 0
			mov ebx, 1

			imul eax, -2
			sub eax, ebx
			add eax, 9

			ret
	main ENDP
END