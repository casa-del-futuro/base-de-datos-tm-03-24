# LIMIT 
SELECT * FROM productos
LIMIT 20;

SELECT * FROM productos
WHERE PrecioUnitario > 20
LIMIT 5;

SELECT * FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;


# OFFSET 
SELECT * FROM productos
LIMIT 20
OFFSET 9;

SELECT * FROM productos
WHERE PrecioUnitario > 20
LIMIT 5
OFFSET 5;



# ALIAS AS
SELECT productoid AS id, 
ProductoNombre AS producto,
PrecioUnitario * UnidadesStock AS Total
FROM productos
ORDER BY total DESC;

SELECT productoid AS id, 
ProductoNombre AS producto,
PrecioUnitario * UnidadesStock AS Total
FROM productos
WHERE (PrecioUnitario * UnidadesStock) > 0
ORDER BY total ;

# ALIAS
SELECT ProductoID id, ProductoNombre nombre
FROM productos;

# ALIAS SPOILER
SELECT COUNT(*) AS cantidad_productos
FROM productos;

# ALIAS EN TABLAS SPOILER
SELECT p.CategoriaID , 
c.CategoriaID, 
ProductoNombre
FROM productos AS p, categorias AS c
WHERE p.CategoriaID = c.CategoriaID;

SELECT ProductoNombre AS producto, CategoriaNombre AS categoria
FROM productos AS p, categorias AS c
WHERE p.CategoriaID = c.CategoriaID;




















