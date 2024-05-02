# SUBQUERY SELECT 
SELECT ProductoNombre, 
       (SELECT CategoriaNombre 
        FROM categorias AS c
        WHERE c.CategoriaID = p.CategoriaID) AS categoria
FROM productos AS p;

# SUBQUERY SELECT + WHERE
SELECT ProductoID, 
	   SUM(cantidad) AS totalVendido,
	   (SELECT productoNombre 
        FROM productos AS p
        WHERE p.ProductoID = fd.ProductoID) AS producto,
	   (SUM(Cantidad) * (SELECT PrecioUnitario 
        FROM productos AS p
        WHERE p.ProductoID = fd.ProductoID)) AS TotalRecaudado
FROM facturadetalle AS fd
WHERE(SELECT PrecioUnitario 
	  FROM productos AS p
      WHERE p.ProductoID = fd.ProductoID) > 50
GROUP BY ProductoID;

# SUBQUERY FROM 
SELECT producto, SUM(totalVendido) AS finTotalVendidos,SUM(totalRecaudado) AS finTotalRecaudado FROM (SELECT ProductoID, PrecioUnitario, SUM(cantidad) AS totalVendido, (SELECT productoNombre  FROM productos AS p WHERE p.ProductoID = fd.ProductoID) AS producto, (SUM(Cantidad) * PrecioUnitario) AS TotalRecaudado FROM facturadetalle AS fd GROUP BY ProductoID, PrecioUnitario ) AS reporte
GROUP BY producto
ORDER BY finTotalVendidos DESC
LIMIT 5;

# TABLE REFERENCE
SELECT CategoriaNombre AS categoria, SUM(PrecioUnitario)
FROM productos AS p, 
	 proveedores AS pee,
     categorias AS c
WHERE p.ProveedorID = pee.ProveedorID
AND p.CategoriaID = c.CategoriaID
GROUP BY categoria;











