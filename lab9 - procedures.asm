.586			;32 bit program
.MODEL FLAT		;flat memory model
INCLUDE io.h	;include IO headerfile

.DATA
	userNum		WORD ?
	userStr		BYTE 40 DUP (?)
	resultStr	BYTE 40 DUP (?)
	
	prompt1		BYTE "Enter a number to get factorial", 0

.CODE
iterFactorial PROC
	push	ebp			;put return point on stack
	mov		ebp, esp	;establish stack frame
	
	mov		eax, 1		;store 1 in eax for factorial
	mov		ecx, [ebp+8];copy parameter from stack into ecx for looping

	forCount:
		mul	ecx
		loop forCount

	pop		ebp			;get return point from stack
	ret					;return to previous position in code

iterFactorial ENDP

recurFactorial PROC		;wrapper function for recursive factorial calculation
	push	ebp			;put return point on stack
	mov		ebp, esp	;establish stack frame

	mov		eax, 1		;init eax to 1 for 
	push	[ebp+8]		;load parameter onto stack
	call	factorial
	pop		[ebp+8]		;remove parameter from stack

	pop ebp
	ret
recurFactorial ENDP

factorial PROC
	push	ebp			;put return point on stack
	mov		ebp, esp	;establish stack frame

	mov		ecx, 0
	cmp		[ebp+8], ecx
	jz		baseCase

	mov		ebx, [ebp+8]
	mul		ebx
	dec		ebx

	push	ebx
	call	factorial
	pop		[ebp+8]

	baseCase:

	pop		ebp			;get return point from stack
	ret
factorial ENDP

_MainProc PROC
	
	mov userNum, 00064h

	mov		eax, 0					;exit with return code 0
 	ret								;return
_MainProc ENDP
END