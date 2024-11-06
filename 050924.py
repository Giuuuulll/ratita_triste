c=0
b=0
d=0
for i in range(10):
    a=int(input("ingrese un valor:"))
    if a>0:
        b=b+1
    if a<0:
        c=c+1
    if a%15==0:
        d=d+1

print("positivo",b)
print("negativo",c)
print("multiplo de 15",d)

    
    