--Productos mas vendidos por categoria

CREATE VIEW vw_ProductosMasVendidosPorCategoria AS
SELECT 
    C.CategoryName AS Categoria,
    P.ProductName AS Producto,
    SUM(OD.Quantity) AS UnidadesVendidas
FROM 
    [Order Details] OD
JOIN 
    Products P ON OD.ProductID = P.ProductID
JOIN 
    Categories C ON P.CategoryID = C.CategoryID
GROUP BY 
    C.CategoryName, P.ProductName;

	select * from vw_ProductosMasVendidosPorCategoria