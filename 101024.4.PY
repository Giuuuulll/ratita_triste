# El programa selecciona un número aleatorio entre el 1 y el 10, este debe adivinarlo.
#Cuando adivina sale del ciclo. Para ello importar la libreria random y luego utilizar dicho metodo.

import random
a=random.randint(1,10)
while True:
    n=int(input("ingrese un valor del 1 al 10, espero coincida: "))
    if n==a:
         print("muy bien", n, "es el numero correcto")
         break