
#Crear un programa que permita el ingreso de numeros multiplos de 7, si ingresa otro valor que no sea multiplo 
# de 7que salga del programa
while True:
    num = int(input("Ingresa un número múltiplo de 7 o un número que no sea múltiplo de 7 para salir: "))
    if num % 7 != 0:
        print(" Saliendo del programa.")
        break
    else:
        print(f"Número múltiplo de 7 ", num )
