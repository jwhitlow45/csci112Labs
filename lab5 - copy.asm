.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data

.CODE                           ; start of main program code
main    PROC
        mov     eax, 0001234abh
        mov     ah, 0

        mov   eax, 0            ; exit with return code 0
        ret
main    ENDP

END                             ; end of source code
