; this file have definition of some macro in assembly language for nasm netwide assembler
; mecro list:   sort,...


section .text
; ---------------------> sort
ins_sort:						; Implementation of Insertion sort
		pushad
		mov		ebx, [esp + 44]		; get array address from stack
		mov		ecx, [esp + 40]		; get array lenght from stack
		mov		ebp, [esp + 36]		; EBP is the lenght of array blocks that must be sorted 
		mov		esi, ebp		; ESI is index of temp

for_loop:
		cmp		ebp, 2
		je		for_bb2
		jl		for_bb1
for_bb4:
		mov		edx, [ebx + esi]	;EDX is temp in for loop
		jmp		end_of_condition
for_bb2:
		mov		dx, [ebx + esi]
		jmp		end_of_condition
for_bb1:
		mov		dl, [ebx + esi]

end_of_condition:
		mov		edi, esi
		sub		edi, ebp

while_loop:
		;compare array[esi] and array[edi] and while array[esi]<array[edi]
		;change array[edi+1] with array[edi]
		cmp		ebp, 2
		je		while_bb2
		jl		while_bb1
while_bb4:
		cmp		edx, [ebx + edi]
		jge		exit_while_loop
		mov		eax, [ebx + edi]
		mov		[ebx + edi + 4], eax
		sub		edi, 4
		cmp		edi, 0
		jge		while_loop
		jmp		exit_while_loop
while_bb2:
		cmp		dx, [ebx + edi]
		jge		exit_while_loop
		mov		ax, [ebx + edi]
		mov		[ebx + edi + 2], ax
		sub		edi, 2
		cmp		edi, 0
		jge		while_loop
		jmp		exit_while_loop
while_bb1:
		cmp		dl, [ebx + edi]
		jge		exit_while_loop
		mov		al, [ebx + edi]
		mov		[ebx + edi + 1], al
		sub		edi, 1
		cmp		edi, 0
		jge		while_loop

exit_while_loop:
		;change array[edi] with temp that is edx
		add		edi, ebp		;awful but I haven't any idea
		cmp		ebp, 2
		je		exit_bb2
		jl		exit_bb1
exit_bb4:
		mov		[ebx + edi], edx
		sub		edi, ebp
		add		esi, ebp
		dec		ecx
		cmp		ecx, 1
		jne		for_loop
		jmp		done
exit_bb2:
		mov		[ebx + edi], dx
		sub		edi, 2
		add		esi, 2
		dec		ecx
		cmp		ecx, 1
		jne		for_loop
		jmp		done
exit_bb1:
		mov		[ebx + edi], dl
		sub		edi, 1
		add		esi, 1
		dec		ecx
		cmp		ecx, 1
		jne		for_loop

done:
		popad
		ret 		12
;\---------------------> sort


; ---------------------> max
find_max:
                ; To be implemented


; ---------------------> min

find_min:
                ; To be implemented
