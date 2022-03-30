;Ejercicio 30 marzo
;Programa que escribe 0x0F en PORTB durante el primer ciclo de 255
; y cambia a 0xF0 en PORTB en el segundo de forma cíclica
    
    LIST	    P=16F84A					; Procesador utilizado.
    INCLUDE	    <P16F84A.INC>				; Definici?n de algunos operandos utilizados
    __CONFIG    _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC
    
CONT EQU 0x0C    
    
    
    ORG		0		; inicio de código
    bsf	     STATUS, RP0	; activa el bit RP0: inicia modo de configuración
    clrf     PORTB		; pone 0 en todo el PORTB (todo el puerto B como salidas)
    bcf	     STATUS, RP0	; desactiva el bit RP0: termina modo de config
    
;lógica del programa
    
    movlw    0x00
    movwf    CONT
		
ciclo:
    movlw    0x0F
    movwf    PORTB
    ;call     Retardo_20ms	
    incf     CONT, F	
    movf     CONT, W
    xorlw    0xFF
    btfss    STATUS, Z		
    goto     ciclo		
    goto     ciclo2		
ciclo2:
    movlw    0xF0
    movwf    PORTB
    ;call     Retardo_20ms
    incf     CONT, F	
    movf     CONT, W
    xorlw    0xFF
    btfss    STATUS, Z		
    goto     ciclo2		
    goto     ciclo
    
    INCLUDE <C:\Users\chest\Documents\prograinterfaz\PRACTICAS_CHIDAS\RETARDOS.INC>
    END

