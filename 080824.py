'''ingrese 10 edades de las cueles muestre cuantos son mayores
 de edad y se sume las edades que cumpla la condiccion'''
a=0
suma=0
for b in range (1,11):
    edad=int(input("ingrese su edad:"))
    if edad>=18:
        print("es mayor de edad")
        a=a+1
        suma=suma+edad
    else:
        print("es menor de edad ")
print("cantidade de menores de edad:", a )
print(" suma de mayores de edad", suma)