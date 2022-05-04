; Tarea 30 marzo
; Programa que calcula la parte entera de la raiz cuadrada
; de cualquier número entre 0 y 255.
    
;contar número de restas de numeros impares menores al radicando
;parar cuando el valor sea <=0

    CBLOCK  0x0C
    INPUT   ;entrada puerto B
    SUSTR   ;sustraendo
    NUMOP   ;número de operaciones
    CONT
    ENDC

    LIST	P=16F84A					; Procesador utilizado.
    INCLUDE	<P16F84A.INC>				; Definici?n de algunos operandos utilizados.
    __CONFIG _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

; ZONA DE CODIGOS *******************************************************************

    ORG	0		
    bsf	STATUS, RP0;	; activa el bit RP0: inicia modo de config
    movlw   0xFF	; 
    movwf   PORTB;	; todo el puerto B como entradas
    clrf    PORTA;	; todo el puerto A como salidas
    bcf	STATUS, RP0;	; desactiva el bit RP0: termina modo de config
    
;lógica del programa
    movf    PORTB, W
    movwf   INPUT
    movlw   0x01
    movwf   SUSTR	;i = 1
    clrf    NUMOP	;op = 0
    clrf    CONT
operacion:
    movf    INPUT, W
    xorlw   0x00
    btfsc   STATUS, Z	;caso B == 0
    goto    salida
    movf    SUSTR, W
    movwf   CONT	; cont = sustraendo
ciclo:
    decf    INPUT, F
    decf    CONT, F
    movf    INPUT, W
    btfss   STATUS, Z
    goto    retorna
valida:
    movf    CONT, W
    btfsc   STATUS, Z
    goto    incremento
    goto    salida
retorna:
    movf    CONT, W
    btfsc   STATUS, Z
    goto    incremento
    goto    ciclo
incremento:
    incf    NUMOP, F
    movlw   0x02
    addwf   SUSTR,F
    goto    operacion
salida:
    movf   NUMOP, W
    movwf   PORTA
    END
    