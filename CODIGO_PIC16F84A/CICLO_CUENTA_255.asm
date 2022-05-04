    ;tarea laboratorio: 16-03
    ;programa que cuenta de 255 a cero y de 0 a 255 de forma infinita.
    
    
    LIST	   P=16F84A					; Procesador utilizado.
    INCLUDE  <P16F84A.INC>					; Definición de algunos operandos utilizados.

    __CONFIG   _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC
    

; ZONA DE CÓDIGOS *******************************************************************

    ORG 	0		; inicio de código
    bsf	     STATUS, RP0	; activa el bit RP0: inicia modo de configuración
    clrf     PORTB		; pone 0 en todo el PORTB (todo el puerto B como salidas)
    bcf	     STATUS, RP0	; desactiva el bit RP0: termina modo de config
	
    
;lógica  del programa
    movlw    0xFF   
    movwf    PORTB		    ; se mueve 255 a W y se guarda en PORTB para iniciar el contador
ciclo:
    call     Retardo_500ms	; se inserta un retardo
    decf     PORTB, F		; se decrementa PORTB en 1 y se guarda en él su valor
    btfss    STATUS, Z		; se evalua si PORTB es igual a 0
    goto     ciclo		    ; reinicia el ciclo si PORTB no es igual a 0
    goto     ciclo2		    ; salta al siguiente ciclo si PORTB es igual a 0
ciclo2:
    call     Retardo_500ms
    incf     PORTB, F		; se incrementa PORTB en 1 y se guarda en él su valor
    movf     PORTB, W		; se mueve el valor en PORTB a W
    xorlw    0xFF		    ; se realiza un XOR entre el valor de PORTB en W y la const 255
    btfss    STATUS, Z		; se evalua si PORTB es igual a 255
    goto     ciclo2		    ; reinicia el ciclo si PORTB no es igual a 255
    goto     ciclo		    ; retorna al ciclo anterior si PORTB es igual a 255
    
    
    INCLUDE <C:\Users\chest\Documents\prograinterfaz\PRACTICAS_CHIDAS\RETARDOS.INC>
    END
    
	


