data segment
caso dw 0
funcion dw 0
x dw 0
y dw 0
a dw 1
p dw 0
b dw 0
obant dw 0
seed dw 1
r1 dw 99
l dw 6
r2 dw 4
aux dw 0
auxp dw 0
salto dw 10,13, '$'
corchete dw ' ]$'
corchetea dw ' [ $'
inicio dw ' Bienvenido, para mover el carro utilice las flechas de izquierda y derecha$'
instruccion dw 'Cuando el cono se encuentre 1 casilla adelante del carro utilice la flecha$'
instruccion_2 dw 'de arriba para esquivarlo$'
aclaracion dw 'Luego de esquivar el cono, el carro va a volver a su trayectoria normal de$'
aclaracion_2 dw 'forma automÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡tica$'
advertencia dw 'Si choca o se sale del rango el programa termina$'
mensaje_1 dw 'Cuidado! hay un cono en [ $'
repeat dw 'Esperando a el conductor...$'
mensaje_2 dw 'El carro se encuentra en [ $'
mensaje_3 dw 'El carro se acaba de ubicar en [ $'
mensaje_4 dw ' con un giro de $'
mensaje_41 dw ' grados para esquivar el cono$'
mensaje_5 dw 'El carro ha regresado a su curso normal en [ $' 
mensaje_6 dw 'Te has salido del rango! $'
mensaje_7 dw 'Te has ubicado en la misma casilla del cono! has chocado!$'
invalid dw 'Comando no soportado! Intente de nuevo...$'
adorno dw '****************** EMPIEZA EL RECORRIDO *************************$'
empieza dw 'Usted empieza el recorrido en la casilla [ 1 ] [ 0 ]$'
    pkey db "Presiona cualquier tecla para continuar...$"  
    
    
;Funcionamiento: El objeto va en la trayectoria [x][0] (recto)
;En la pantalla dice que ha aparecido un cono, es sÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½lo un ejemplo didÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½ctico, puede ser cualquier tipo de obstÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½culo
;Si [x+1][0] del carro = [x][0] del cono hay que mover el carro con la flecha de arriba para esquivarlo
;Luego de esquivar el cono el programa va a calcular el ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½ngulo de giro del carro desde la posiciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½n hacia donde girÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½ hasta la posiciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½n donde se moviÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â½ 
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
;Mensaje de bienvenida
    mov ax, data
    mov ds, ax
    mov es, ax
	lea dx, inicio
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx, instruccion
	mov ah,9h
	int 21h
	lea dx, salto
	mov ah,9h
	int 21h
	lea dx, instruccion_2
	mov ah,9h
	int 21h
	lea dx, salto
	mov ah,9h
	int 21h
	lea dx,aclaracion
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx,aclaracion_2
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx, salto
	mov ah,9h
	int 21h
	lea dx,advertencia
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah, 9h
	int 21h
	lea dx,adorno
	mov ah, 9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx,salto
	mov ah,9h
	int 21h
	lea dx, salto
	mov ah,9h
	int 21h
	lea dx,empieza
	mov ah,9h
	int 21h
	lea dx, salto
	mov ah,9h
	int 21h

;Genera un numero pseudo aleatorio
		proc random
		mov ax, x
		mov obant, ax ;Mover el obstaculo anterior por si acaso el usuario se regresa
		mov ax, seed
		mov cx, r2
		mul cx
		; x = seed*r2
		mov x,ax
		mov ax,x
		add ax,r1
		; x = x+c
		mov x,ax
		mov ax,x
		mov cx,l
		div cx
		; x = x%limite
		mov x,dx
		mov ax,seed
		; Agrego uno a la semilla para generar un numero diferente la proxima vez
		add ax,1
		mov seed,ax
		; Ya genero el numero al azar, ahora agregara ese numero al azar a la posicion actual del objeto para que vayan apareciendo obstaculos
		mov ax, x
		add ax, a
		mov x, ax
		endp

		; *Imprimir posicion del cono*
		proc printob1: 		
		lea dx,mensaje_1
		mov ah,09h
		int 21h
		mov ax,x
		cmp ax,10
		jae call picarx
		jb call imprimirunidad
		call print2
		endp
		
		
		proc picarx 
		mov cx,10 
		cwd
		div cx
		mov aux,ax
		mov ax,aux
		mov auxp,ax
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,x
		mov cx,10
		cwd
		div cx
		mov aux,dx 
		;Imprimo decena en numero de dos digitos
		mov ax,aux
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		call print2
		;Imprimo unidad en numero de dos digitos 
		endp
		
		
		proc imprimirunidad
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		call print2
		endp    
		    
		proc print2   
		lea dx,corchete
		mov ah,09h
		int 21h
		lea dx,corchetea
		mov ah,09h
		int 21h
		;Imprimo y que siempre es igual a 0 en random
		mov ax,0
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		call print3
		endp
		
		proc print3
        lea dx,corchete
        mov ah,09h
        int 21h
        lea dx,salto
        mov ah,09h
        int 21h
        lea dx,salto
        mov ah,09h
        int 21h
		lea dx, repeat
		mov ah,09h
		int 21h
		lea dx,salto
		mov ah,09h
		int 21h
		lea dx,salto
		mov ah,09h
		int 21h
        endp
		    
		proc recorrido
		;Comienza la comparacion de una vez, por si acaso el obstaculo esta al principio
			mov ax,funcion
		    mov ax,0
		    mov funcion,ax
			mov ax, a
			add ax,1
			cmp ax,x
			jz resultado
			jnz resultado_zero
		endp	
		proc recorrido_2
			mov ax, a
			cmp caso, 1
			je call cumple


			mov ah, 01h ;Chequear si alguna tecla esta pulsada
			int 16h
			mov ah, 00h ;Tecla
			int 16h

			begin_verificar:
				cmp ah,0x4B
				je izq
				cmp ah,0x4D
				je der
					izq:
						mov ax, a
						sub ax, 1
						mov a, ax
						mov b, cx
						mov bx, x
						cmp ax,0
						jz call fuerarango
						cmp bx, obant
						jz chocaste
						jnz imprimiractual

					der:
						mov ax, a
						add ax, 1
						mov a, ax
						mov cx,0
						mov b,cx
						mov bx, x
						call comprobar_si_choco
						cmp bx, ax
						jz call resultado
						ja call resultado_zero
						jb call resultado_zero
			end_verificar:
		endp

		proc comprobar_si_choco
		mov bx,a
		cmp bx,x
		jz chocaste
		cmp bx,obant
		jz chocaste
		jnz call imprimiractual
		endp

		proc chocaste
		lea dx,mensaje_7
		mov ah,9h
		int 21h
		lea dx,salto
		mov ah,9h
		int 21h
		call fin
		endp


		proc imprimiractual
		; Si la posicion actual del objeto+1 es igual a la posicion del obstaculo el objeto se movera			
			;*Imprimir posicion actual del objeto*
			lea dx,mensaje_2
    		mov ah,09h
    		int 21h
            mov ax,a
            cmp ax,10
            jae picaractx
            jb imprimirunidadactx
        endp
    		
    	proc picaractx 
		mov cx,10 
		cwd
		div cx
		mov aux,ax
		mov ax,aux
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,a
		mov cx,10
		cwd
		div cx
		mov aux,dx 
		;Imprimo decena en numero de dos digitos
		mov ax,aux
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,funcion
		cmp ax, 0
		;Veo si imprimo la posicion actual o la posicion de se movio
		jz call printact2
		cmp ax, 1
		jz call imprimirmovimiento2
		cmp ax, 2
		jz call normal2
		;Fuera de rango
		cmp ax,10
		jz call fin
		;Imprimo unidad en numero de dos digitos 
		endp
		
		
		proc imprimirunidadactx
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,funcion
		cmp ax, 0
		;Veo si imprimo la posicion actual o la posicion donde se movio
		jz call printact2
		cmp ax,1
		jz call imprimirmovimiento2  
		cmp ax,2
		jz call normal2
		;Fuera de rango
		cmp ax,10
		jz call fin
		endp    	
    		
    		proc printact2
    		lea dx,corchete
    		mov ah,09h
    		int 21h
    		lea dx,corchetea
    		mov ah,09h
    		int 21h
    		mov ax,b
    		cmp ax,10
    		jae picaracty
    		jb imprimirunidadacty
    		endp
    		
    		proc picaracty 
		mov cx,10 
		cwd
		div cx
		mov aux,ax
		mov ax,aux
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,b
		mov cx,10
		cwd
		div cx
		mov aux,dx 
		;Imprimo decena en numero de dos digitos
		mov ax,aux
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,funcion
		cmp ax, 0
		jz call printact3
		cmp ax,1
		jz call imprimirmovimiento3              
		cmp ax, 2
		jz call normal3
		;Imprimo unidad en numero de dos digitos 
		endp
		
		proc imprimirunidadacty
		aam
		add ax,03030h
		lea dx,ax
		mov ah,02h
		int 21h
		mov ax,funcion
		cmp ax,0
		
		jz call printact3
		cmp ax,1
		jz call imprimirmovimiento3 
		cmp ax,2
		jz call normal3
		endp    
		    
		    proc printact3
            lea dx,corchete
            mov ah,09h
            int 21h
            lea dx,salto
            mov ah,09h
            int 21h
			lea dx,repeat
			mov ah,9h
			int 21h
			lea dx,salto
			mov ah,09h
			int 21h
			call recorrido
    		endp
    	
			proc resultado :
			mov caso, 1
			call recorrido_2
			endp

			proc resultado_zero :
			mov caso, 0
			call recorrido_2 
			endp

			proc cumple
			mov ah, 01h ;Chequear si alguna tecla esta pulsada
			int 16h
			mov ah, 00h ;Tecla
			int 16h

			begin_verify:
			;Arriba
				cmp ah,0x48
				je esquivar
			;Abajo
				cmp ah,0x50
				je fuerarango
				cmp ah,0x4D
				je der
				jne invalido

					proc invalido
					lea dx, invalid
					mov ah,9h
					int 21h
					lea dx, salto
					mov ah,9h
					int 21h
					call cumple
					endp

					esquivar:
					mov cx, b
					add cx, 1
					mov b, cx 
					call imprimirmovimiento 

					proc fuerarango
					lea dx, mensaje_6
					mov ah,09h
					int 21h
					mov ax,funcion
					mov ax,10
					mov funcion,ax
					mov ax,a
					cmp ax,10
					jae call picaractx
					jb call imprimirunidadactx
					endp
			end_verify:
		endp

			
			proc imprimirmovimiento
			mov ax,funcion
			inc ax
			mov funcion,ax
			lea dx,mensaje_3
    		mov ah,09h
    		int 21h
            mov ax,a
            cmp ax,10
            jae call picaractx
            jb call imprimirunidadactx
            endp
            
            proc imprimirmovimiento2
    		lea dx,corchete
    		mov ah,09h
    		int 21h
    		lea dx,corchetea
    		mov ah,09h
    		int 21h
    		mov ax,b
    		cmp ax,10
    		jae call picaracty
    		jb call imprimirunidadacty
    		endp
    		
    		proc imprimirmovimiento3
            lea dx,corchete
            mov ah,09h
            int 21h
            endp
   
		call producto_escalar

		proc producto_escalar		
		; Producto escalar(a, b) y(a - 1, b - 2)
		; Producto escalar entre la posicion antes de moverse y la posicion luego de moverse
			mov cx, a
			dec cx
			mov ax, x
			mul cx
			mov p, ax
			mov ax, b
			mov cx, y
			sub cx, 1
			mul cx
			add p, ax
			mov caso, 0
		; Formula usada para calcular el angulo = ( producto escalar * 10 ) % 90
			mov cx, 10
			mov ax, p
			mul cx
			mov p, ax
			mov ax, p
			mov cx, 90
			div cx
			mov p, dx 
			
		;*Imprimir angulo*
		    proc imprimirangulo
			lea dx,mensaje_4
    		mov ah,09h
    		int 21h
    		mov ax,p
    		cmp ax,10
    		jae call dos
    		jb call uno
		    endp
		    
		    proc uno 
		    ;Imprime angulo de una cifra
		    mov ax,p
		    aam
    		add ax,03030h
    		lea dx,ax
    		mov ah,02h
    		int 21h
    		call imprimirangulo2
		    endp                
		    
		    proc dos
		    ;Imprime angulo de dos cifras
		    mov ax,p
		    mov cx,10 
    		cwd
    		div cx
    		mov aux,ax
    		mov ax,aux
    		aam
    		add ax,03030h
    		lea dx,ax
    		mov ah,02h
    		int 21h
    		mov ax,p
    		mov cx,10
    		cwd
    		div cx
    		mov aux,dx 
    		;Imprimo decena en numero de dos digitos
    		mov ax,aux
    		aam
    		add ax,03030h
    		lea dx,ax
    		mov ah,02h
    		int 21h
    		call imprimirangulo2
		    endp
		    
		    proc imprimirangulo2
        	lea dx,mensaje_41
    		mov ah,09h
    		int 21h
    		lea dx,salto
            mov ah,09h
            int 21h
			;Devuelve el objeto a la trayectoria normal [ x ][ 0 ]
			call continuar
			endp

		proc continuar :
			mov ax, a
			add ax, 2
			mov a, ax
			mov ax,0
			mov b,ax 
	
	; *Imprimir trayectoria normal* 
	    proc normal
	    mov ax,funcion
	    mov ax, 2
	    mov funcion,ax
		lea dx,mensaje_5
    	mov ah,09h
    	int 21h
    	mov ax,a
    	cmp ax,10
    		jae call picaractx
    		jb call imprimirunidadactx 
	    endp
	    
	    proc normal2
    	
        lea dx,corchete
		mov ah,09h
		int 21h
		lea dx,corchetea
		mov ah,09h
		int 21h
		mov ax,b
		cmp ax,10
    		jae call picaracty
    		jb call imprimirunidadacty
    	endp 
		
		proc normal3
        lea dx,corchete
        mov ah,09h
        int 21h
        lea dx,salto
        mov ah,09h
        int 21h
    	lea dx,salto
        mov ah,09h
        int 21h
	endp	
		
		mov ax, a
		call random 
	    endp
		proc fin :        

            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
    endp
ends

end start ; set entry point and stop the assembler.
