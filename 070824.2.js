let nuevosElementos = document.createElement("main")

nuevoElemento.id ="nuevo"
nuevoElemento.textContent= "hola, soy un nuevo elemento*"

let cuerpohtml= document.querySelector("body")

cuerpohtml.appedchild(nuevoElemento)
console.log(nuevoElemento);