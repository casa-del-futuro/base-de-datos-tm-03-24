# CADENA DE CARACTERES
## CONCAT
USE pokemonbd;
SELECT CONCAT("BASE"," ","DE"," ","DATOS") AS BASE_DE_DATOS;
SELECT CONCAT("pokémon: ", nombre) from pokemon;

USE emarket;
SELECT empleadoid, CONCAT(Apellido, " " ,Nombre) AS full_name FROM Empleados; 

## COALESCE
USE movies_db;
SELECT title AS pelicula, COALESCE(length, "No tiene duración") AS duracion , COALESCE(genre_id, "No tiene genero") AS genero
FROM movies;

## REPLACE REVERSE
SELECT id, REVERSE(title) titleReverse, REPLACE(title, "Harry", "Valeria" ) AS titleEdit 
FROM movies;

## TRIM 
SELECT TRIM("       BASE DE DATOS      ") AS textTrim;

## LOWER UPPER
SELECT LOWER(title) AS titleMinus, UPPER(title) AS titleMayus 
FROM movies
WHERE LOWER(title) = UPPER(title);

# NUMERICOS
## ABS
SELECT ABS(-25) AS valorAbsoluto;

##  COUNT MAX MIN 
SELECT COALESCE(genre_id, "sin genero") AS genero,
	   COUNT(id) AS totalMovies, 
	   MAX(rating) AS maximoRating,  
       MIN(length) AS duracionMinima
FROM movies
GROUP BY genre_id;

## PI ROUND TRUNCATE
SELECT PI() AS π, ROUND(PI(),3) AS πRound , TRUNCATE(PI(),3) AS πTruncate;

## RAND
SELECT ROUND(RAND()*100) AS numeroAleatorio;

## SQRT
SELECT SQRT(25), SQRT(100);

# FECHA 
/*PARA PASAR LAS FECHAS AL ESPAÑOL*/
SET lc_time_names = 'en_EN';
## DATEDIFF NOW YEAR MOUNTH WEEK DAY HOUR SECOND MINUTE
SELECT title, 
	   release_date, 
       NOW(), 
       ABS(DATEDIFF(release_date , NOW())),
       DATEDIFF(NOW(),release_date)
FROM movies;

SELECT title, YEAR(NOW()) - YEAR(release_date) AS añosDeEstreno
FROM movies;

SELECT title, ABS(YEAR(NOW()) - YEAR(release_date) * 12 * 24) AS diasDeEstreno
FROM movies;

## EXTRACT 
SELECT EXTRACT(SECOND FROM release_date)  AS segundos
FROM movies;

SELECT EXTRACT(YEAR FROM release_date) AS años
FROM episodes;

## DATE_FORMAT
SELECT DATE_FORMAT(release_date, '%W, %e de %M de %Y') AS fechaFormateada
FROM movies;

SELECT DATE_FORMAT(release_date, '%M , %a %d de %Y') AS fechaFormateada
FROM movies;

SELECT DATE_ADD("1999-07-01", INTERVAL "5" MONTH ) AS naciEnVerano;
SELECT DATE_SUB("1999-07-01", INTERVAL "6" MONTH ) AS naciEnVerano;

# FUNCIONES AVANZADAS
## BIN 
SELECT BIN(0), BIN(1), BIN(2), BIN(3), BIN(4);

# IF
USE pokemondb;
SELECT nombre, altura, IF(altura > 1, "es alto","tas chiquito") AS medicion
FROM pokemon;

SELECT nombre, 
	   altura, 
	   CASE
		  WHEN altura < 0.5 THEN "tas chiquitisimo"
		  WHEN altura BETWEEN 0.5 AND 1 THEN "tas chiquito"
          WHEN altura BETWEEN 1 AND 1.5 THEN "tas promedio"
          WHEN altura BETWEEN 1.5 AND 2 THEN "tas alto"
          ELSE "tas grandotote"
       END AS medicion
FROM pokemon;

SELECT DATABASE(), USER(), VERSION();