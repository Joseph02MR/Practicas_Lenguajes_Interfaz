; tarea 26 abril
; SUMA DE LOS ELEMENTOS DE UN ARREGLO

TITLE  Puras mamadas
.data
	arregloD DWORD 10000h,20000h,30000h, 40000h ;arreglo estático
	tam_array DWORD ($ - arregloD)/4            ;4 por el tipo de dato (2 para WORD, 8 para QWORD)

.code
main proc
	
	mov esi,    OFFSET arregloD
	mov ecx,    tam_array
	mov ebx,    0
	mov eax,    0
ciclo:
	add	eax,    [esi]
	add esi,    4
	inc bx
	cmp ecx,    ebx
	JNE ciclo
	NOP

main endp
end