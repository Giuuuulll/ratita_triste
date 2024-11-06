#Crear un programa que permita el ingreso de las notas de 15 alumnos en la materia de "Algoritmica", 
# mostrar el promedio de las notas ingresas, y cuantos sacaron la nota 5 y cuantos la nota 1.
acum=0
nota5=0
nota1=0
prome=0
for a in range(15):
    nota=int(input("ingrese la nota del alumno"))
    acum+=nota
    if nota==5:
        nota5+=1
    if nota==1:
        nota1+=1
prome=acum/15
print("proemdio de las notas",prome)
print("cantidad de 5", nota5)
print("cantidad de 1",nota1)