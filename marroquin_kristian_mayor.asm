.data                                                                      # Sección para declarar variables y constantes.

mensaje1: .asciiz "Kristian Andres Marroquin \n."           		   # Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
mensaje2: .asciiz "Calcular el número Mayor \n."              		   # Declara una cadena de caracteres como mensaje con mensaje2 y utilizando asciiz que es de tipo string.
mensaje3: .asciiz "Ingeniería Informática \n."                             # Declara una cadena de caracteres como mensaje con mensaje3 y utilizando asciiz que es de tipo string.
entrada1:    .asciiz "Hola Por favor, Ingresa el primer número: "          # Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string.
entrada2:    .asciiz "Por favor, Ingresa el segundo número: "              # Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string.
entrada3:    .asciiz "Por Favor, Ingresa el tercer número: "               # Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string.
resultado: .asciiz "El número mayor es: "                                  # Declara una cadena de texto para el resultado utilizando asciiz de tipo string para el resultado del programa.                                               

iguales: .asciiz "Todos los números son iguales, el número mayor es : "    # Declara como mensaje informativo en caso de que el usuario ingrese los 3 números iguales. 

.text                               # Sección de código y métodos.
.globl main                         # Sección del menú.

main:
    # Muestra mensaje inicial.
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, mensaje1            # Carga la dirección de la cadena de mensaje1 en $a0.
    syscall                     # Llamada al sistema para realizar la impresión.
    
    # Muestra mensaje 2.
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, mensaje2            # Carga la dirección de la cadena de mensaje2 en $a0.
    syscall                     # Llamada al sistema para realizar la impresión.
    
    # Muestra mensaje 3.
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, mensaje3            # Carga la dirección de la cadena de mensaje 3 en $a0.
    syscall                     # Llamada al sistema para realizar la impresión.
    
    
    # Pide al usuario el primer número.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.	                 
    la $a0, entrada1            # Carga la dirección de la cadena de entrada1 en $a0 indicando que el usuario ingrese el primer número.
    syscall                     # Llamada al sistema para realizar la impresión.


    # Lee el primer número ingresado.
    
    li $v0, 5                   # Código de servicio 5 para leer el primer número ingresado por el usuario.
    syscall                     # Llamada al sistema para verificar.
    move $s0, $v0               # Copiar el valor del registro ingresado de $v0 en el registro $s0.


    # Pide al usuario el segundo número.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.			
    la $a0, entrada2             # Carga la dirección de la cadena de entrada2 en $a0 indicando que el usuario ingrese el segundo número.	
    syscall                     # Llamada al sistema para realizar la impresión.


    # Lee el segundo número ingresado.
    
    li $v0, 5                   # Código de servicio 5 para leer el segundo número ingresado por el usuario.
    syscall                     # Llamada al sistema para verificar.
    move $s1, $v0               # Copiar el valor del registro ingresado de $v0 en el registro $s1.
    

    # Pide al usuario el tercer número.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.		
    la $a0, entrada3            # Carga la dirección de la cadena de entrada3 en $a0 indicando que el usuario ingrese el tercer número.		
    syscall                     # Llamada al sistema para verificar


    # Lee el tercer número ingresado.
    
    li $v0, 5                   # Código de servicio 5 para leer el tercer número ingresado por el usuario.			
    syscall                     # Llamada al sistema para verificar.
    move $s2, $v0               # Copiar el valor del registro ingresado de $v0 en el registro $s2.		


    # Compara los números para localizar el mayor.
    
    move $t0, $s0               # Copiar el valor del registro en $s0 ingresado por el usuario (primer número) en $t0.
    move $t1, $s1               # Copiar el valor del registro en $s1 ingresado por el usuario (segundo número) en $t1.

    bgt $s0, $s1, comprobar     # Bgt es salto si es mayor que comparando los 2 primeros números ingresados por el usuario luego de esto con revision salta al siguiente método si se cumple esta condición.
    move $t0, $s1               # Copia el valor del registro del $s1 en $t0 ya con el número mayor comparado de estos dos.

comprobar:                     # En caso de que la condición de que se cumpla salta para imprimir resultado del número mayor entre los dos anteriores.
    bgt $t0, $s2, impr_resul   # Bgt salto condicional en caso de que $t0 sea mayor que $s2.
    move $t0, $s2              # Copia el valor del registro del número mayor ya comparado con el tercer número ingresado por el usuario en $t0.


impr_resul:		       # Imprime resultado pero entrar a verificar en caso de que los 3 números sean iguales.                            

    # Verifica si los tres números son iguales
    
    beq $s0, $s1, revision 	# beq realiza un salto si dos registros son iguales en este caso si el primer número y el segundo son iguales.   
    beq $s0, $s2, revision 	# beq realiza un salto si dos registros son iguales en este caso si el tercer número y el primero son iguales.
    beq $s1, $s2, revision      # beq realiza un salto si dos registros son iguales en este caso si el tercer número y el segundo son iguales.

    # Imprime el resultado si los números no son iguales
    
    li $v0, 4    	# Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, resultado   # Carga la dirección de la cadena resultado para indicar el número mayor.
    syscall		# Llamada al sistema.
    b fin_prog	 	# Realiza salto a la etiqueta fin_prog para finalizar el programa

revision:

    # Imprime el mensaje de que todos son iguales y el mayor es el primero que el usuario ingresó.
    
    li $v0, 4   	# Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, iguales     # Carga la dirección de la cadena de iguales en $a0 indicando que todos los números ingresados son iguales y el mayor es el primero que se ingresó.
    syscall		# Llamada al sistema.

fin_prog:    # Finalizar el programa en caso de que los 3 números sean iguales.

    li $v0, 1 	    # Código de servicio 1 para indicar las llamadas del sistema e imprimir los valores numéricos.
    move $a0, $t0   # Copiar el valor del registro en este caso el número mayor $t0 en $a0.
    syscall	    # Llamada al sistema.

    # Salir del programa
    
    li $v0, 10        # Código de servicio 10 para salir del programa y terminar la ejecución.     
    syscall
