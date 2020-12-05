; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
strFP BYTE  40 DUP (?)
component DWORD ?
numBase DWORD 10
prompt1 BYTE    "Enter a floating point number", 0
signflg DWORD 1

.CODE
_MainProc PROC
        input   prompt1, strFP, 40      ; read ASCII characters
      
        ;pass strFP to function and call asciiToFP
        lea ebx, strFP
        push ebx
        call asciiToFP

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP


;convert ascii value to floating point
asciiToFP PROC
    ;establish stack frame
    push ebp
    mov ebp, esp

    ;push 0 onto stack
    fldz    
    
    ;value to help find decimal
    mov ebx, 1
    ;location of string
    mov edi, [ebp+8]

    ;check first char for negative sign
    cmp byte ptr [edi], 0
    je exit ;null has been reached
    cmp byte ptr [edi], '-'
    jne mainLoop
    mov signflg, -1
    inc edi

    mainLoop:
        cmp byte ptr [edi], 0
        je exit ;null has been reached
        cmp byte ptr [edi], '.' ;check for decimal
        je decimal

        ;store value in dl and convert from ascii to int
        mov edx, 0
        mov dl, byte ptr [edi]
        sub edx, '0'

        ;add number to stack
        mov component, edx    ;move to memory address
        fimul numBase       ;multiply stack by number system base
        fiadd component       ;add int to stack top

        ;inc to next char in string
        inc edi
        jmp mainLoop    ;return to start of loop


    decimal:
        ;inc to next char in string
        inc edi
        ;push 1.0 onto stack
        fld1

    fractionLoop:
        cmp byte ptr [edi], 0
        je exit ;null has been reached

        ;store value in dl and convert to ascii
        mov edx, 0
        mov dl, byte ptr [edi]
        sub edx, '0'

        ;convert to push to stack and convert to decimal
        mov component, edx
        fidiv numBase
        fild component

        ;integrate into integer part of stack
        fmul st, st(1)
        faddp st(2), st
        inc edi

        jmp fractionLoop    ;return to start of loop

    exit:
        fstp st
        fimul signflg

    ;restore stack frame
    pop ebp
    ret
asciiToFP ENDP
END                             ; end of source code

