# Función COUNT()
SELECT COUNT(*) 
FROM facturas
WHERE EmpleadoID = 12;

# Función AVG()
SELECT  ROUND(AVG(PrecioUnitario),1) AS promedio_precio_total 
FROM productos
WHERE CategoriaID = 6;

# Función SUM()
SELECT SUM(UnidadesStock) 
FROM productos
WHERE PrecioUnitario > 10
AND CategoriaID = 3;

# Funciones MAX() y MIN()
SELECT MAX(precioUnitario), 
AVG(precioUnitario),
MIN(precioUnitario)
FROM productos;

# GROUP BY
SELECT ProveedorID, COUNT(*) AS cantidad_productos
FROM productos
GROUP BY proveedorid;

SELECT categoriaid categoria, COUNT(*) AS cantidad_productos
FROM productos
GROUP BY categoriaid;


# HAVING
SELECT paisenvio pais,
COUNT(*) cantidad_pedidos
FROM facturas
GROUP BY paisenvio
HAVING cantidad_pedidos > 50;

SELECT ProveedorID, COUNT(*) 
AS cantidad_productos
FROM productos
GROUP BY proveedorid
HAVING cantidad_productos >= 4
ORDER BY cantidad_productos;

SELECT categoriaid categoria, 
COUNT(*) AS cantidad_productos
FROM productos
GROUP BY categoriaid;