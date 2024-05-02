# SUBQUERY
SELECT (SELECT first_name 
		FROM actors AS a
        WHERE a.id = am.actor_id ) AS nombre,
        (SELECT last_name 
		FROM actors AS a
        WHERE a.id = am.actor_id ) AS apellido,
        (SELECT title
         FROM movies AS m
         WHERE m.id = am.movie_id) AS pelicula
FROM actor_movie AS am;

# TABLE REFERENCE
SELECT m.id, m.title, g.name 
FROM movies AS m, genres AS g
WHERE g.id = m.genre_id
AND name = "Musical";

# JOIN
SELECT m.id, m.title, m.rating ,g.name 
FROM movies AS m
INNER JOIN genres AS g
ON g.id = m.genre_id
WHERE name = "Ciencia Ficcion"
AND rating > 8;

SELECT g.name, 
	   COUNT(*) AS totalPelis, 
       AVG(rating) promRating
FROM movies AS m
INNER JOIN genres AS g
ON g.id = m.genre_id
GROUP BY name;


# JOINS CON MAS DE DOS TABLAS
SELECT m.title, a.first_name, a.last_name 
FROM movies AS m
INNER JOIN actor_movie AS am
ON m.id = am.movie_id
INNER JOIN actors AS a
ON am.actor_id = a.id;

# DISTINCT
SELECT DISTINCT a.first_name, a.last_name 
FROM movies AS m
INNER JOIN actor_movie AS am
ON m.id = am.movie_id
INNER JOIN actors AS a
ON am.actor_id = a.id
WHERE title LIKE "Harry%";


