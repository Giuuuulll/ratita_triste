<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicar</title>
    <script src="https://cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
</head>
<body>
    <form action="php/acciones-posteos.php" method="post">
        <div>
            <label for="titulo">Titulo</label>
            <input type="text" id="titulo" name="titulo">
        </div>
        <div>
            <label for="contenido">contenido</label>
            <textarea id="contenido" name="contenido"></textarea>
        </div>
        <div>
            <label for="imagen">imagen</label>
            <input type="text" id="imagen" name="imagen">
        </div>
        <div>
            <label for="ubicacion">ubicacion</label>
            <input type="text" id="ubicacion" name="ubicacion">
        </div>
        <button>Publicar</button>
    </form>
    <script>
        try {
    CKEDITOR.replace( 'contenido' );
} catch (e) {
    
}

const formulario = document.querySelector("form")
formulario.addEventListener("submit", (evento) => {
    evento.preventDefault()
    const contenido = document.querySelector("#contenido")
    contenido.value = CKEDITOR?.instances.contenido.getData()
    evento.target.submit()
})

    </script>
</body>

</html>

