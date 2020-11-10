;Jacob Whitlow
;Lab 4 - I/O
;09-15-2020

.586			;32 bit program
.MODEL FLAT		;flat memory model
INCLUDE io.h	;include IO headerfile

.DATA
number1 DWORD	?
number2 DWORD	?
number3 DWORD	?
number4 DWORD	?

prompt1 BYTE	"Enter first number", 0
prompt2 BYTE	"Enter second number", 0
prompt3 BYTE	"Enter third number", 0
prompt4 BYTE	"Enter fourth number", 0

string	BYTE	40 DUP (?)
sum		BYTE	11 DUP (?), 0
resultLbl BYTE	"The result is", 0

.CODE
_MainProc PROC
	input	prompt1, string, 40		;store i/o into input
	atod	string					;convert to int (ascii to dword), stores in eax
	mov		number1, eax			;store integer in memory

	input	prompt2, string, 40		;repeat for second num
	atod	string
	mov		number2, eax

	input	prompt3, string, 40		;repeat for third num
	atod	string
	mov		number3, eax

	input	prompt4, string, 40		;repeat for fourth num
	atod	string
	mov		number4, eax

	mov		eax, number1			;store first num in accumulator
	add		eax, number2			;add second num to acc
	add		eax, number3			;add third num to acc
	sub		eax, number4			;sub fourth num from acc
	dtoa	sum, eax				;convert to ascii, store in sum
	output	resultLbl, sum			;output result label and sum

	mov		eax, 0					;exit with return code 0
 	ret								;return
_MainProc ENDP
END