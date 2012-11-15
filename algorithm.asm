; this file have definition of some macro in assembly language for nasm netwide assembler
; mecro list:	sort,...


; sort can be a template macro
%macro		sort		2-3 4			; array, lenght, and default is lenght of block
							; that is 4 bytes
		pushad

		push		%1
		push		%2
		push		%3
		call		ins_sort

		popad
%endmacro

%macro		sortb		2

		sort		%1, %2, 1

%endmacro

%macro		sortw		2

		sort		%1, %2, 2

%endmacro

%macro		sortd		2

		sort		%1, %2, 3

%endmecro


section .text
ins_sort:						; Implementation of Insertion sort
		mov		ebx, [esp + 12]		; get array address from stack
		mov		ecx, [esp + 8]		; get array lenght from stack
		mov		ebp, [esp + 4]		; EBP is the lenght of array blocks that must be sorted 
		mov		esi, 1			; ESI is index of temp

for_loop:
		mov		edx, [ebx + esi * ebp]	;EDX is temp in for loop
		mov		edi, esi		;EDI is index in while loop
		sub		edi, 1

while_loop:
		;compare array[esi] and array[edi] and while array[esi]<array[edi]
		;change array[edi+1] with array[edi]
		cmp		edx, [ebx + edi * ebp]
		jge		exit_while_loop
		mov		eax, [ebx + edi * ebp]
		mov		[ebx + (edi + 1) * ebp], eax
		sub		edi, 1
		cmp		edi, 0
		jge		while_loop

exit_while_loop:
		;change array[edi] with temp that is edx
		mov		[ebx + (edi + 1) * ebp], edx
		add		esi, 1
		dec		ecx
		cmp		ecx, 1
		jne		for_loop
done:
		ret 		12
			
