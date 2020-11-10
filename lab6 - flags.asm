.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
count BYTE 0fch

.CODE                           ; start of main program code
main    PROC
        mov ax, 0ff75h

        div count         ;opcode instruction

        mov   eax, 0            ; exit with return code 0
        ret
main    ENDP

END                             ; end of source code
