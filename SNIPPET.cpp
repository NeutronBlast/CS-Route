#include <stdio.h>
#include <stdlib.h>
short caso = 0;
short funcion = 0;
short x = 0;
short y = 0;
short a = 1;
short p = 0;
short b = 0;
short seed = 1;
short r2 = 4;
short r1 = 99;
short l = 6;
short aux = 0;
short auxp = 0;
short obant = 0;

int tecla = 0;
/*
repeat dw 'Esperando a el conductor...$'
mensaje_3 dw 'El carro se acaba de ubicar en [ $'
mensaje_4 dw ' con un giro de $'
mensaje_41 dw ' grados para esquivar el cono$'
mensaje_5 dw 'El carro ha regresado a su curso normal en [ $'
mensaje_6 dw 'Te has salido del rango! $'
pkey db "Presiona cualquier tecla para continuar...$"*/

int main() {
	printf("Bienvenido, para mover el carro utilice las flechas de izquierda y derecha\n");
	printf("Cuando el cono se encuentre 1 casilla adelante del carro utilice la flecha\n");
	printf("de arriba para esquivarlo\n");
	printf("Luego de esquivar el cono, el carro va a volver a su trayectoria normal de\n");
	printf("forma autom�tica\n\n");
	printf("Si choca o se sale del rango el programa termina\n\n");
	printf("****************** EMPIEZA EL RECORRIDO *************************\n\n\n");
	printf("Usted empieza el recorrido en la casilla [ 1 ] [ 0 ]\n");

	_asm {
	random:
		mov ax,x
		mov obant,ax
		mov ax, seed
			mov cx, r2
			mul cx
			; x = seed * r2
			mov x, ax
			mov ax, x
			add ax, r1
			; x = x + c
			mov x, ax
			mov ax, x
			mov cx, l
			div cx
			; x = x % limite
			mov x, dx
			mov ax, seed
			; Agrego uno a la semilla para generar un nÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½mero diferente la prÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½xima vez
			add ax, 1
			mov seed, ax
			; Ya generÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½ el numero al azar, ahora agregarÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½ ese numero al azar a la posiciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n actual del objeto para que vayan apareciendo obstÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½culos
			mov ax, x
			add ax, a
			mov x, ax
			cmp ax, 20
			; endp
	}

	printf("Cuidado! hay un cono en la posici�n [ %d ] [ %d ]", x, y);
	printf("Esperando al conductor...\n\n");
	_asm {
	recorrido:
		; Comienza la comparacion de una vez, por si acaso el obstaculo esta al principio
			mov ax, funcion
			mov ax, 0
			mov funcion, ax
			mov ax, a
			add ax, 1
			cmp ax, x
			jz resultado
			jnz resultado_zero
			; El objeto se moverÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½ indefinidamente pero para detener la ejecuciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n del programa en algun punto se determinÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½ que el programa finalizarÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½ la ejecuciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n cuando llegue a la posiciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n 20
			; endp
			recorrido_2 :
		mov ax, a
			cmp ax, 20
			ja fin
			cmp caso, 1
			je cumple
			; endp
	}
	scanf_s("%d", &tecla);
	_asm {
	begin_verificar:
		mov eax, tecla
			cmp eax, 1
			je izq
			cmp eax, 2
			je der
			izq :
		mov ax, a
			sub ax, 1
			mov a, ax
			mov b, cx
			mov bx, x
			cmp ax, 0
			jz fuerarango
			cmp bx, obant
			jz chocaste
			jnz imprimiractual

			imprimiractual:
	}
	printf("El carro se encuentra en [ %d ] [ %d ]\n", a, b);
	_asm{
		jmp recorrido

			der :
		mov ax, a
			add ax, 1
			mov a, ax
			mov cx, 0
			mov b, cx
			mov bx, x
			call comprobar_si_choco
	}
	printf("El carro se encuentra en [ %d ] [ %d ]\n", a, b);
	_asm {
		cmp bx, ax
		jz resultado
		ja resultado_zero
		jb resultado_zero
		end_verificar :
		; endp

			comprobar_si_choco :
		mov bx, a
			cmp bx, x
			jz chocaste
			cmp bx, obant
			jz chocaste
			jnz imprimiractual
			;	endp

			chocaste :
	}
	printf("Te has ubicado en la misma casilla del cono! has chocado!\n");
	_asm {
		jmp fin
		;	endp
	}

	printf("El carro se encuentra en [ %d ] [ %d ]\n", a, b);

	_asm {
	resultado:
		mov caso, 1
			call recorrido_2
			;			endp

			resultado_zero :
		mov caso, 0
			call recorrido_2
			; endp

			cumple :
	}
	scanf_s("%d", &tecla);
	_asm {

	begin_verify:
		; Arriba
			mov eax, tecla
			cmp eax, 3
			je esquivar
			; Abajo
			cmp eax, 4
			je fuerarango

			esquivar :
		mov cx, b
			add cx, 1
			mov b, cx
			call imprimirmovimiento

			fuerarango :
	}
	printf("Te has salido del rango!\n");
	_asm {
		; endp
		end_verify :
		; endp


			imprimirmovimiento :
	}
	printf("Se ha movido a la posicion [ % d ] [ % d ]", a, b);
	_asm {
		mov ax, funcion
		inc ax
		mov funcion, ax
		; endp

		jmp producto_escalar

		producto_escalar :
		; Producto escalar(a, b) y(a - 1, b - 2)
			; Producto escalar entre la posiciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n antes de moverse y la posiciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n luego de moverse
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
			; FÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½rmula usada para calcular el ÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½ngulo = (producto escalar * 10) % 90
			mov cx, 10
			mov ax, p
			mul cx
			mov p, ax
			mov ax, p
			mov cx, 90
			div cx
			mov p, dx

			; *Imprimir angulo*
			imprimirangulo:
	}
	printf(" con un angulo de %d grados\n", p);
	_asm {
		; Devuelve el objeto a la trayectoria normal(funciÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â½n y = x)
		jmp continuar
		; endp

		continuar :
		mov ax, a
			add ax, 2
			mov a, ax
			mov ax, 0
			mov b, ax

			; *Imprimir trayectoria normal*
			normal:
		mov ax, funcion
			mov ax, 2
			mov funcion, ax
	}
	printf("Ha vuelto a su curso normal en la posicion [ % d ] [ % d ]\n", a, b);
	_asm {
		mov ax, a
		cmp ax, 20
		jz fin
		ja fin
		jb random
		; endp
		fin :
	}
	getchar();
}