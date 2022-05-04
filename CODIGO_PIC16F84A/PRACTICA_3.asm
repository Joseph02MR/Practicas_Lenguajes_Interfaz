; PRACTICA 3 11-03-22
LIST	   P=16F84A			; Procesador utilizado.
	INCLUDE  <P16F84A.INC>		; Definición de algunos operandos utilizados.
	__CONFIG   _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

; ZONA DE CÓDIGOS *******************************************************************

	ORG 	0			; inicio de código
	bsf    STATUS, RP0;		; activa el bit RP0: inicia modo de configuración
	movlw  0x1F;00011111		; mueve a W el valor x1F 
	movwf  TRISA;			; mueve el val de W a PORTA (todo el puerto A como entradas)
	clrf   TRISB;			; pone 0 en todo el PORTB (todo el puerto B como salidas)
	bcf    STATUS, RP0;		; desactiv el bit RP0: termina modo de config
	
;lógica del código
	movf   PORTA,0;			; mueve a W el input de PORTA
	xorlw  b'00011111'      ; aplica XOR a W y el valor binario 00011111
	movwf  PORTB;			; mueve W a PORTB (salida)
	END