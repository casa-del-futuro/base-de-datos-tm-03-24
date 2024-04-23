# PRUEBA

CREATE DATABASE misql;
USE misql;

CREATE TABLE sentencias(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(40),
    dificultad VARCHAR(40)
);

# agregar una columna a una tabla existente
ALTER TABLE sentencias
ADD is_deprecated TINYINT;

# modificar una columna existente
ALTER TABLE sentencias
MODIFY nombre VARCHAR(50) NOT NULL;

# eliminar una columna de una tabla
ALTER TABLE sentencias 
DROP dificultad;


INSERT INTO sentencias (nombre,is_deprecated)
VALUES ("SELECT", 0);

# modifico un registro existente
UPDATE sentencias
SET nombre = "CREATE", dificultad = "facil"
WHERE id = 1;

# eliminar un registro de una tabla
DELETE FROM sentencias
WHERE id = 1;




