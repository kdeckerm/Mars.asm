.data
    hola_mundo: .asciiz "Hello world"  #Defino una cadena ascii
    
.text
    main:  #Punto de entrada, aquí empieza el programa
        li $v0, 4  #Ponemos a 4 el registro $v0, ya que es el valor para ejecutar print_string
        la $a0, hola_mundo  #Ponemos la dirección de hola_mundo en el primer argumento de la función ($a0)
        syscall  #Ejecutamos un syscall (ejecutamos print_string)
        
        li $v0, 10  #Para salir
        syscall  #Salimos