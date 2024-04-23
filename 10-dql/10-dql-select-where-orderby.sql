# Consulta base
SELECT * FROM nombre_tabla;

# SELECT
SELECT * 
FROM movies;

SELECT title, rating 
FROM movies;

SELECT first_name, last_name
FROM actors;

# WHERE
SELECT * 
FROM genres
WHERE name = "comedia";

SELECT title, rating, awards
FROM movies
WHERE rating > 8
AND awards > 5;

SELECT title, rating, awards
FROM movies
WHERE rating > 8
OR awards > 5;

SELECT title, rating, number
FROM episodes
WHERE number != 1;

SELECT title, length, genre_id
FROM movies
WHERE length IS NULL
OR genre_id IS NULL;

# ORDER BY
SELECT *
FROM movies
ORDER BY title;

SELECT title, release_date
FROM movies
WHERE release_date > "2000-01-01";

SELECT title, rating
FROM movies
WHERE rating > 7
ORDER BY rating DESC;

SELECT title, release_date
FROM movies
ORDER BY release_date;

# BETWEEN
SELECT first_name, last_name, rating
FROM actors
WHERE rating BETWEEN 5 AND 8
ORDER BY rating;

SELECT title, release_date, rating
FROM episodes
WHERE release_date 
BETWEEN "2000-01-01" 
AND NOW();

SELECT first_name, last_name
FROM actors
WHERE first_name 
BETWEEN "eMmA" 
AND "JoHnY"
ORDER BY first_name;

# LIKE 
SELECT id, first_name
FROM actors
WHERE first_name LIKE "E%";

SELECT id, first_name, last_name
FROM actors
WHERE first_name LIKE "___a%";
































