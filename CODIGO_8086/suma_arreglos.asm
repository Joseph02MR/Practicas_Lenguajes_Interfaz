; tarea 26 abril
; SUMA DE LOS ELEMENTOS DE UN ARREGLO

TITLE  Tarea
.data
	arreglo 	WORD 1000h,2000h,3000h, 4000h
	tam_array 	WORD ($ - arreglo)/ TYPE arreglo

.code
main proc
	mov rbx,	0
	mov rax,	0
	mov esi,	OFFSET arreglo
	mov cx,		tam_array
	
ciclo:
	add	ax, [esi]
	add esi, TYPE arreglo
	inc bx
	cmp cx, bx
	JNE ciclo
	NOP

main endp
end
