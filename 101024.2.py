#Ingresar 5 valores, y mostrar el resultado de su suma.


suma = 0

for i in range(5):
    numero = int(input(f"Ingrese el valor {i + 1}: "))
    suma += numero

print(f"La suma de los 5 valores es: {suma}")
