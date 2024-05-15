/*
Where
Mostrar el nombre, peso y altura 
de los pokémon cuyo peso sea mayor 
a 150.
Tablas: pokemon
Campos: nombre, peso, altura
*/

SELECT nombre, peso, altura
FROM pokemon
WHERE peso > 150;



/*Muestra los nombres y potencias de 
los movimientos que tienen una precisión 
mayor 90.
Tablas: movimiento
Campos: nombre, potencia*/

SELECT nombre, potencia , precision_mov
FROM movimiento
WHERE precision_mov > 90;

/*
Operadores & joins
Mostrar tipo, nombre y potencia de 
los movimientos que tienen una potencia 
mayor igual que 120.
Tablas: movimiento, tipo
Campos: t.nombre, m.nombre, m.potencia

*/
SELECT t.nombre AS tipo, 
	   m.nombre AS movimiento, 
	   m.potencia
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo
WHERE potencia >= 120;
/*Muestra los nombres movimientos y 
el tipo junto con sus tipos de ataque 
correspondientes de aquellos cuya potencia 
sea igual a 0.
Tablas: tipo, tipo_ataque, movimiento
Campos: t.nombre ta.tipo m.potencia*/
SELECT m.nombre AS movimiento, 
	   t.nombre AS tipo, 
       ta.tipo AS tipo_ataque, 
       m.potencia 
FROM tipo AS t
INNER JOIN tipo_ataque AS ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
INNER JOIN movimiento AS m 
ON t.id_tipo = m.id_tipo
WHERE potencia = 0;

/*
Order by
Muestra los nombres y números de Pokédex 
de los primeros 10 Pokémon en orden 
alfabético.
Tablas: pokemon
Campos: numero_pokedex, nombre
*/
SELECT numero_pokedex, nombre
FROM pokemon
ORDER BY nombre
LIMIT 10;

/*Muestra los nombres y alturas de los 
Pokémon de tipo "Eléctrico", ordenados 
por altura de forma descendente.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, altura
*/
SELECT p.nombre AS pokemon, 
	   t.nombre AS tipo, 
       p.altura 
FROM pokemon AS p
INNER JOIN pokemon_tipo AS pt
ON p.numero_pokedex = pt.numero_pokedex
INNER JOIN tipo AS t
ON t.id_tipo = pt.id_tipo
WHERE t.nombre = "Electrico"
ORDER BY altura DESC;

/*
Funciones de agregación
¿Cuál es la suma total de los valores
 de "Defensa" en todas las estadísticas base?
Tablas: estadisticas_base
Campos: defensa
*/
SELECT SUM(defensa) AS sum_total_defensa
FROM estadisticas_base;



/*
¿Cuántos Pokémon tienen el tipo "Fuego"?
	Tablas: pokemon_tipo, tipo
Campos: * */
SELECT t.nombre AS tipo, COUNT(*) AS total_pokemon
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt 
ON t.id_tipo = pt.id_tipo
GROUP BY t.nombre;

SELECT SUM(total_pokemon) , (214 - 151) AS pokemon_doble_tipo FROM (SELECT t.nombre AS tipo, COUNT(*) AS total_pokemon FROM tipo AS t INNER JOIN pokemon_tipo AS pt ON t.id_tipo = pt.id_tipo GROUP BY t.nombre) AS la_mejor_tabla;

# GROUP BY
/*
Muestra los nombres de los tipos de Pokémon 
junto con la cantidad de Pokémon de cada tipo.
Tablas: pokemon_tipo, tipo
Campos: nombre, numero_pokedex
*/

SELECT nombre AS tipo, COUNT(*) AS cantidad
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
GROUP BY tipo;
-- 😀😀

/*
Muestra los nombres de los tipos de Pokémon junto
con el promedio de peso de los Pokémon de cada tipo. 
Ordena los resultados de manera descendente según el 
promedio de peso.
Tablas: pokemon, pokemon_tipo, tipo
Campos: t.nombre, p.peso
*/
SELECT t.nombre AS tipo, AVG(peso) AS promedio_peso
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON pt.id_tipo = t.id_tipo
INNER JOIN pokemon AS p 
ON pt.numero_pokedex = p.numero_pokedex
GROUP BY tipo
ORDER BY promedio_peso DESC;
-- 😎😎

# HAVING 
/*
Muestra los nombres de los Pokémon que tienen más 
de un tipo.
Tablas: pokemon, pokemon_tipo
Campos: nombre */

SELECT nombre AS pokemon 
FROM pokemon AS p
INNER JOIN pokemon_tipo AS pt
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY pokemon
HAVING COUNT(id_tipo) > 1;

-- subquery para contar cuantos pokémon con mas de dos tipos hay
SELECT COUNT(*) FROM (SELECT nombre AS pokemon 
FROM pokemon AS p
INNER JOIN pokemon_tipo AS pt
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY pokemon
HAVING COUNT(id_tipo) > 1) AS pokemon;

/*
Muestra los nombres de los tipos de Pokémon junto 
con la cantidad de Pokémon de cada tipo que tienen 
un peso promedio mayor a 50.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, numero_pokedex */

SELECT t.nombre AS tipo , 
	   COUNT(*) AS total_pokemon,
       AVG(peso) AS promedio_peso
FROM tipo AS t
INNER JOIN pokemon_tipo AS pt
ON t.id_tipo = pt.id_tipo
INNER JOIN pokemon AS p
ON p.numero_pokedex = pt.numero_pokedex
GROUP BY tipo
HAVING promedio_peso > 50;

# REGISTROS
/*
Muestra los nombres de los movimientos de tipo "Agua" 
junto con los nombres de los Pokémon que pueden 
aprenderlos y el peso de estos Pokémon.
	Tablas: movimiento, tipo_ataque, 
    pokemon_tipo, tipo, pokemon
Campos: m.nombre, p.nombre, peso */

SELECT m.nombre AS moviemiento, 
	   p.nombre AS pokemon,
       peso,
       t.nombre AS tipo
FROM movimiento AS m
INNER JOIN tipo AS t
ON t.id_tipo = m.id_tipo
INNER JOIN pokemon_tipo pt
ON m.id_tipo = pt.id_tipo
INNER JOIN pokemon AS p
ON p.numero_pokedex = pt.numero_pokedex
WHERE t.nombre = "Agua";

/*
FUNCIONES DE ALTERACION
Muestra los nombres de los movimientos 
de tipo de ataque "Especial" con una 
potencia superior a 10 y una descripción 
que contenga al menos 20 palabras.
Tablas: movimiento, tipo_ataque
Campos: nombre, potencia, tipo, descripcion
*/

SELECT m.nombre AS movimiento, 
	   m.potencia,
       m.descripcion,
       ta.tipo AS tipo_ataque
FROM movimiento AS m
INNER JOIN tipo AS t
ON m.id_tipo = t.id_tipo
INNER JOIN tipo_ataque AS ta
ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE ta.tipo = "Especial"
AND potencia > 10 
AND length(m.descripcion) > 20;










/*
	0. Generar el diagrama de relación
	1. Empezar con la consulta "BASE" (SELECT * FROM tabla);
	2. Hacer la relaciones con JOIN
	3. Filtrar las columnas requeridas en el SELECT
	4. Agregar las condiciones en el WHERE
	5. Ordenar la consulta por alguna tabla especifica
	6. Agrupar por un campo especifico
    6,5. Agregar al SELECT el campo agrupado
    7. Aplicar las funciones de agregación y/o alteración
*/