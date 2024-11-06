#Crear un programa que permita el ingreso del lado de 5  cuadrados, y que muestre el resultado del perimetro 
# a medida que vamos ingresando el lado
tolados = int(input("Ingrese la cantidad de lados del polígono: "))
slados = 0
cont = 1

while cont <= tolados:
    lado = float(input(f"Ingrese la longitud del lado {cont}: "))
    slados += lado
    cont += 1

print("La suma total de los lados ingresados es:", slados)
