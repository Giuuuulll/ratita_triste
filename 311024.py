#Crear un programa que permita el ingreso de n cantidad de valores, de los cuales se desea ver cantidad de
#  positivos y suma de positivos,cantidad de negativos y suma de negativos, cantidad de neutros y
# suma de neutros, utilizar while o for

j=0
b=0
d=0
t=0
k=0
s=0
h=int(input("ingrese un valor:"))
for a in range(h):
    c=int(input("ingrese otro valor:"))
    if c>0:
        b=b+1
        d=d+c
    if c<0:
        j=j+1
        t=t+c
    if c==0:
        k=k+1
        s=s+c

print("negativos",b)
print("positivo",j)
print("neutros",k)
print("suma de positivos",d)
print("suma de negativos",t)
print("suma de neutros",s)
