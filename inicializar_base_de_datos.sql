CREATE database IF NOT EXISTS proyectob;
use proyectob;
CREATE TABLE IF NOT EXISTS publicaciones(
	id int primary key auto_increment,
    titulo text,
    contenido text,
    imagen text,
    ubicacion text,
    fecha datetime default CURRENT_TIMESTAMP
);