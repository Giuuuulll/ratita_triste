a=int(input("ingrese un valor:"))
pares=0
multiplo_7=0
for a in range (a):
    num=int(input("ingrese un numero:"))
    if num%2==0:
        pares=pares+1
    if num%7==0:
        multiplo_7=multiplo_7+1
print(f"cantiadd de pares:{pares}")
print(f"cantiadd demultiplo de 7:{multiplo_7}")
