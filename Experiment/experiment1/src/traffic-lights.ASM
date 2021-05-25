;Simulating traffic lights
   .MODEL SMALL
   .DATA
   .STACK 64
   .CODE
PortIn	EQU	80h	
PortOut	EQU	88h
HoldTime EQU 0A000h
BlinkInterval EQU 3000h
FlashTime EQU 4h
state_0 EQU 36H
state_1 EQU 33H
state_2_on EQU 33H
state_2_off EQU 37H 
state_2_y EQU 35H
state_3 EQU 1EH
state_4_on EQU 1EH
state_4_off EQU 3EH 
state_4_y EQU 2EH
main proc far
state0:MOV AL,state_0
       OUT PortOut,AL
       CALL Hold

state1:MOV AL,state_1
       OUT PortOut,AL
	   CALL Hold

state2:
	   MOV CX,FlashTime
blink1:
	   MOV AL,state_2_on
	   OUT PortOut,AL
	   CALL Interval ; blink interval
	   MOV AL,state_2_off
	   OUT PortOut,AL
	   CALL Interval
	   LOOP blink1
	   MOV AL,state_2_y ;
       OUT PortOut,AL
	   CALL Hold

state3:
	   MOV AL,state_3
	   OUT PortOut,AL
	   CALL Hold

state4:
       MOV CX,FlashTime
blink2:
	   MOV AL,state_4_on
	   OUT PortOut,AL
	   CALL Interval ; blink interval
	   MOV AL,state_4_off
	   OUT PortOut,AL
	   CALL Interval
	   LOOP blink2
	   MOV AL,state_4_y ;
       OUT PortOut,AL
	   CALL Hold
	   jmp state1
       
main endp

Hold proc ; hold for a while
	   PUSH CX
	   MOV CX,HoldTime
ho:    LOOP ho
	   POP CX
       RET
Hold endp


Interval proc
	   PUSH CX
	   MOV CX,BlinkInterval
flash: LOOP flash
	   POP CX
	   RET
Interval endp

END	main				
