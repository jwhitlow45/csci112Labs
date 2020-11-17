.586
.MODEL FLAT
.STACK 4096
INCLUDE io.h

.DATA
outLbl BYTE "The modified string is", 0
string BYTE "ABCDEFGHIJ",0

.CODE
_MainProc PROC
	;8.1
	;lea esi, string		;beginning of string
	;lea edi, string+5		;address of 'F'
	;cld					;forward movement

	;8.2
	;lea esi, string		;beginning of string
	;lea edi, string+2		;address of 'C'
	;cld					;forward movement

	;8.3
	;lea esi, string+9		;end of string
	;lea edi, string+4		;address of 'E'
	;std					;backward movement

	;8.4
	lea esi, string+9		;end of string
	lea edi, string+7		;address of 'H'
	std						;backward movement

	movsb				;move 4 chars
	movsb
	movsb
	movsb
	output outLbl, string	;display modified string

	mov eax, 0
	ret
_MainProc ENDP
END