.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
promptX     BYTE    "Enter x value", 0
promptY     BYTE    "Enter y value", 0
promptZ     BYTE    "Enter z value", 0
prompttest  BYTE    "Enter z value", 0

userInput   BYTE    4 DUP (?)   ;for storing user input
intX        DWORD   ?           ;x value
intY        DWORD   ?           ;y value
intZ        DWORD   ?           ;z value
leftCalc    DWORD   ?           ;stores left half of equation
rightCalc   DWORD   ?           ;stores right half of equation

msgResult   BYTE    "The result is", 0
result      DWORD   ?           ;stores result of final operation

.CODE
_MainProc PROC
        ;get x from user and store in intX
        input   promptX, userInput, 4
        atod    userInput
        mov     intX, EAX

        ;get y from user and store in intY
        input   promptY, userInput, 4
        atod    userInput
        mov     intY, EAX

        ;get z from user and store in intZ
        input   promptZ, userInput, 4
        atod    userInput
        mov     intZ, EAX

        ;add intX and intY
        mov     EAX, intX
        add     EAX, intY
        ;multiply by intZ
        imul    intZ
        ;add 17
        add     EAX, 17
        ;store result of left side operation in leftCalc
        mov     leftCalc, EAX

        ;get value of z^2
        mov     EAX, intZ
        imul    intZ
        mov     EBX, EAX
        ;get value of y-1
        mov     ECX, intY
        dec     ECX
        ;get value of x+1
        mov     EAX, intX
        inc     EAX
        ;multiply (x+1) and (y-1)
        imul    ECX
        ;divide by z^2, store in rightCalc
        cdq
        idiv    EBX
        mov     rightCalc, EAX

        ;move leftCalc to EAX for final operation
        mov     EAX, leftCalc
        cdq
        idiv    rightCalc
        ;store mod of operation in result
        dtoa    result, EDX
        ;print result
        output msgResult, result
        

        
        
        ;dtoa    result, intX
        ;output  msgResult, result
        ;dtoa    result, intY
        ;output  msgResult, result
        ;dtoa    result, intZ
        ;output  msgResult, result




        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

