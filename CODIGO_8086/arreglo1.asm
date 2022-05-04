; codigo 1
TITLE  Arreglo

.data 
;lista BYTE 10, 20, 30, 40
lista WORD 10, 20, 30, 40
otralista DWORD 2, 4 , 6, 8
tam_lista = ($-lista)

.code
main PROC
    mov rax, tam_lista
    NOP
main ENDP
END

; codigo 2

TITLE  Arreglo

.data 
mi_texto BYTE " mi materia favorita es lenguajes de interfaz "
long_texto = ($ - mi_texto)

.code
main PROC
    mov rax, long_texto
    NOP
main ENDP
END
; desarrollar un código en asm que determine si el tamaño de dos cadenas escritas
; es igual. Si es así rax será igual al código ascii de la palabra "SI". Caso contrario
; escribirá "NO"


TITLE  Comparación long cadenas

.data 
cad1 BYTE "cadena 1"
l_cad1 = ($ - cad1)
cad2 BYTE "cadena 10"
l_cad2 = ($ - cad2)

.code
main PROC
    
    MOV rbx, l_cad1
    MOV rcx, l_cad2
    CMP rbx, rcx
    JE IGUAL
    JMP NO_IGUAL
IGUAL:
    MOV rax, "SI" ;0x5349
     JMP FIN

NO_IGUAL:
    MOV rax, "NO" ;0x4E4F

FIN:
    NOP
main ENDP
END

