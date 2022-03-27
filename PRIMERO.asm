    ;practica 04-03
    ;código que imprime la constante 0x55 en PORTB y
    ;luego imprime su complemento de forma infinita

;ZONA DE DATOS
    
    LIST P=16F84A
    INCLUDE<P16F84A.INC>
    __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

    CONSTANTE EQU b'01010101'

;ZONA DE CÓDIGO

    ORG 0
Inicio:
    bsf STATUS, RP0
    clrf TRISB;
    bcf STATUS, RP0
    movlw CONSTANTE
Principal:
    movwf PORTB
    comf W,PORTB
    goto Principal
END