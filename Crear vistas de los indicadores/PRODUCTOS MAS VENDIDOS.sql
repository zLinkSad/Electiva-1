
--PRODUCTOS MAS VENDIDOS
CREATE VIEW vw_ProductosMasVendidos AS
SELECT 
    P.ProductID,
    P.ProductName AS Producto,
    SUM(OD.Quantity) AS UnidadesVendidas
FROM 
    [Order Details] OD
JOIN 
    Products P ON OD.ProductID = P.ProductID
GROUP BY 
    P.ProductID, P.ProductName;

	select * from vw_ProductosMasVendidos