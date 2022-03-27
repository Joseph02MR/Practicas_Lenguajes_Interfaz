    ;tarea laboratorio 18-03
    ;programa que evalua si el PORTA es igual a 0x0F
    ; en caso positivo el PORTB intercala entre 1's y 0's en intervalos definidos
    ; en caso contrario el PORTB permanece en 1's

	LIST	P=16F84A					; Procesador utilizado.
	INCLUDE	<P16F84A.INC>				; Definici?n de algunos operandos utilizados.
	
	__CONFIG _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

; ZONA DE CODIGOS *******************************************************************

	ORG	0				; inicio de c?digo
	bsf	STATUS, RP0;	; activa el bit RP0: inicia modo de configuración
	movlw   0x0F		; mueve a W el valor x1F 
	movwf   PORTA;		; mueve el val de W a PORTA (todo el puerto A como entradas)
	clrf    PORTB;		; pone 0 en todo el PORTB (todo el puerto B como salidas)
	bcf	STATUS, RP0;	; desactiva el bit RP0: termina modo de config
	
	
;logica  del programa
	
CICLO:
	movf	PORTA, W
	sublw	0x0F
	btfss	STATUS, Z
	goto	CONST
	goto	INTER
INTER:
	movlw	0xFF
	movwf	PORTB
	call Retardo_200ms
	movlw	0x00
	movwf	PORTB
	call Retardo_200ms
	goto	CICLO
CONST:
	movlw	0xFF
	movwf	PORTB
	call Retardo_200ms
	goto	CICLO
	
	
	INCLUDE <C:\Users\chest\Documents\prograinterfaz\PRACTICAS_CHIDAS\RETARDOS.INC>
	END

