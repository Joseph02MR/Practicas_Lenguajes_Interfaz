;Tarea 30 marzo
;Programa que simula el funcionamiento de un sem�foro mediante retardos
;8 seg rojo
;5 seg verde
;3 seg amarillo


ROJO	EQU 0x0
VERDE	EQU 0x2
AMAR	EQU 0x1

    
    LIST	    P=16F84A					; Procesador utilizado.
    INCLUDE	    <P16F84A.INC>				; Definici?n de algunos operandos utilizados
    __CONFIG    _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC
    
    ORG		0		; inicio de código
    bsf	     STATUS, RP0	; activa el bit RP0: inicia modo de configuración
    clrf     PORTB		; pone 0 en todo el PORTB (todo el puerto B como salidas)
    bcf	     STATUS, RP0	; desactiva el bit RP0: termina modo de config

;inicio de la lógica
    
ciclo:
    movlw   0x00
    movwf   PORTB
    bsf	    PORTB, VERDE
    call    Retardo_5s
    bcf	    PORTB, VERDE
    
    bsf	    PORTB, AMAR
    call    Retardo_2s
    call    Retardo_1s
    bcf	    PORTB, AMAR
    
    bsf	    PORTB, ROJO
    call    Retardo_5s
    call    Retardo_2s
    call    Retardo_1s
    bcf	    PORTB, ROJO
 
    goto    ciclo


    INCLUDE <C:\Users\chest\Documents\prograinterfaz\PRACTICAS_CHIDAS\RETARDOS.INC>
    END

    