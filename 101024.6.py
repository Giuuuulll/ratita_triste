#Crear un programa que permita el ingreso de numeros pares, si ingresa un numero impar que salga del programa
while True:
    num = int(input("Ingresa un número par o un número impar para salir: "))
    if num % 2 != 0:
        print(" Saliendo del programa.")
        break
    else:
        print(f"Número par:",num)
