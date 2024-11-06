
a=int(input("ingrese la cantidad de triangulos:"))
b=0
for i in range(a):
    base=int(input("ingrese un valor para la base:"))
    altura=int(input("ingrese un valor para altura:"))
    area=base*altura/2
    print("area:",area)
    if area<12:
        b=b+1
print("cantidad mayor a 12:",b)

    


