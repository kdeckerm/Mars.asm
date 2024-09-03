.data 

texto: .ascii "Introduzca una operación:"
espacio: .space 128
igual: .ascii "= "

.text
ppal:

la $t0,texto
la $t2,espacio

li $v0,4
add $a0,$t0,$zero
syscall

li $v0,8
add $a0,$t2,$zero
li $a1,5
syscall

jal evaluar
move $t2,$v0

la $t1,igual
li $v0,4
add $a0,$t1,$zero
syscall


li $v0,1
add $a0,$t2,$zero
syscall #Resultado de la operacion realizada

li $v0,10
syscall #Fin del programa

.globl evaluar
evaluar:

li $t0,0 # Inicializo el contador a 0

Loop:

add $t1,$a0,$t0 # p_aux = p_orig + i
lb $t2, 0($t1) #caracter auxiliar
beq $t0,0,primer_numero	#Comprobamos si nos encontramos en la primera posición
j segunda_comparacion
primer_numero:
add $s1,$t2,-48 #Guardamos en el el auxiliar el numero ya convertido en decimal
j fin_comparacion

segunda_comparacion:
beq $t0,1,operacion
j tercera_comparacion
operacion:
add $s2,$t2,$zero
j fin_comparacion
fin_segunda_comparacion:

tercera_comparacion:
beq $t0,2,segundo_numero
j fin_comparacion
segundo_numero:
add $s3,$t2,-48

fin_comparacion:

beqz $t2,Fin_Loop
addi $t0,$t0,1
j Loop
Fin_Loop:

beq $s2,'+',suma
j resta
suma:
add $v0,$s1,$s3
j fin_evaluar

resta:
beq $s2,'-',oresta
j multiplicacion
oresta:
sub $v0,$s1,$s3
j fin_evaluar

multiplicacion:
beq $s2,'*',omultiplicacion
j division
omultiplicacion:
mul $v0,$s1,$s3
j fin_evaluar

division:
beq $s2,'/',odivision
odivision:
div $v0,$s1,$s3

fin_evaluar:
jr $ra