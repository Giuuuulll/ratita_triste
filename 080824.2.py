'''crear un progrsma que permita ingrese de n cantidad de valores
enteros, de los cuales se desea saber cuantos valores son positivos , cuantos son negativos y cuantos son 
neutros , suamr los valores positivos'''
positivo=0
neutro=0
negativo=0
suma=0
n=int(input(" cuantos numeros desea ingresar"))
for a in range(n):
    valor=int(input("ingrese un numero"))
    if valor>0:
        print("es positivo")
        positivo=positivo+1
    elif valor<0:
        print("es negativo")
        negativo=negativo+1
    else:
        print("es neutro")
        neutro=neutro+1
print("cant.positivo:",positivo)
print("cant.negativo:",negativo)
print("cant. nuetro", neutro)
print("suma positivo", suma)
