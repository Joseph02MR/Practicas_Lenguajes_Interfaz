    ;practica laboratorio 16-03    
    ;programa que evalua el estado de RA0
    ; en caso de haber 1, se ponen en 1 los bits pares de PORTB (0,2,4,6)
    ; en caso contrario se ponen en 1 los bits impares de PORTB (1,3,5,7)

    LIST	   P=16F84A					; Procesador utilizado.
    INCLUDE  <P16F84A.INC>					; Definición de algunos operandos utilizados.
    __CONFIG   _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

; ZONA DE CÓDIGOS *******************************************************************

    ORG 	0		; inicio de código
    bsf    STATUS, RP0;		; activa el bit RP0: inicia modo de configuración
    movlw  0x1F;00011111	; mueve a W el valor x1F 
    movwf  TRISA;		; mueve el val de W a PORTA (todo el puerto A como entradas)
    clrf   TRISB;		; pone 0 en todo el PORTB (todo el puerto B como salidas)
    bcf    STATUS, RP0;		; desactiv el bit RP0: termina modo de config
	
;lógica  del programa
ciclo
    btfsc PORTA,0
    GOTO rutina1
    GOTO rutina2
rutina1
    Movlw b'01010101'
    movwf PORTB
    GOTO ciclo
rutina2
    movlw b'10101010'
    movwf PORTB
    GOTO ciclo
END


