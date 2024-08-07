<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/espn.css">
</head>

<body> 
    <section> 
        <aside> 
            <ul>
                <li>
                    <img src="https://a.espncdn.com/redesign/assets/img/logos/espnplus/ESPN+.svg" alt="">
                </li>
            </ul>
        </aside>
        <main>
            <?php
            
            $conexion = new mysqli("localhost", "root", "", "proyectob");
            $sql = "SELECT titulo, contenido, imagen, fecha, ubicacion FROM publicaciones";
            $respuesta = $conexion->query($sql);
            while ($fila = $respuesta->fetch_assoc()) {
                echo "<article>
                <div>
                    <img src='{$fila["imagen"]}' alt=''>
                </div>
                <div class='contenido'>
                    <h3>
                    {$fila["titulo"]}
                    </h3>
                    <p>{$fila["contenido"]}</p>
                    <span>{$fila["ubicacion"]}</span>
                </div>
            </article>";
            }

            ?>
            
        </main>
        <div class="bloques"></div>
    </section>
</body>

</html>