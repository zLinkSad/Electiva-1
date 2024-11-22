
--VENTAS POR CATEGORIA DE PRODUCTOS
CREATE VIEW VW_VentasPorCategoria AS
SELECT 
c.CategoryName AS CATEGORIA,
SUM(OD.UnitPrice * OD.Quantity) AS VENTASTOTALES
FROM
[Order Details] OD

JOIN
[Products] p ON OD.ProductID = P.ProductID

JOIN 
[Categories] c ON P.CategoryID = c.CategoryID

GROUP BY
c.CategoryName;

select * from CW_VentasPorCategoria