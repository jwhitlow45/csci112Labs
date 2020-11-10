.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA


.CODE
add3 MACRO num1, num2, num3
    mov eax, num1   ;put first num in eax
    add eax, num2   ;add second num to eax
    add eax, num3   ;add third num to eax
ENDM

max2 MACRO num1, num2
    cmp num1, num2
    jge if_then
        mov eax, num2   ;num2 in eax
        jmp end_loop
    if_then:
        mov eax, num1   ;num1 in eax
    end_loop:
ENDM

min3 MACRO num1, num2, num3
    mov eax, num1
    cmp eax, num2
    jle if_then1
        mov eax, num2
    if_then1:
    cmp eax, num3
    jle if_then2
        mov eax, num3
    if_then2:
ENDM

toUpper MACRO memLoc
    cmp memLoc, 97
    jl macro_end    ;if not lowercase
    cmp memLoc, 122
    jg macro_end    ;if not lowercase
    sub memLoc, 32  ;convert to uppercase
    macro_end:
ENDM

_MainProc PROC
        

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

