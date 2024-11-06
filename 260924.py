jubilados=0
for a in range(3):
    nombre=input("ingrese su nombre:")
    edad=int(input("ingrese su edad:"))
    sueldo=int(input("ingrese su  sueldo:"))
    antiguedad=int(input("ingrese su antiguedad:"))
    if edad >= 60 and antiguedad >=25:
        jubilados=jubilados+1
print("cantidad de jubilados:",jubilados)