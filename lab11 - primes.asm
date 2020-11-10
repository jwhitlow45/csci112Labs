.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
prime      DWORD   100 DUP (?) 
primeCount  DWORD   2
candidate	DWORD	5
index		DWORD	?


.CODE                           ; start of main program code
main    PROC
		mov ecx, 0
		mov prime[4*ecx], 2
		mov ecx, 1
		mov prime[4*ecx], 3


		primeLoop:
		cmp primeCount, 100
		jge endPrimeLoop	;while primeCount < 100 loop

			mov index, 0			;set index to 0
			
			indexCheck:
			
			mov eax, index		
			cmp eax, primeCount			
			jge endIndexCheck		;while index<=primeCount and
			
			mov eax, candidate
			mov ecx, index
			mov ebx, prime[4*ecx]
			cdq
			div ebx
			
			cmp edx, 0				
			je endIndexCheck		;candidate/prime[index] != 0

				inc index

			jmp indexCheck
			endIndexCheck:			;end while

			mov eax, index			;if index > primeCount
			cmp eax, primeCount
			jl if_then				
				mov eax, candidate
				mov ecx, primeCount
				mov prime[4*ecx], eax
				inc primeCount
			if_then:				;end if

			mov eax, candidate
			add eax, 2
			mov candidate, eax

		jmp primeLoop
		endPrimeLoop:		;end while

		mov eax, 0
		ret
main    ENDP

END                             ; end of source code
