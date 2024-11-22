
--VENTAS POR REGION/PAIS
CREATE VIEW VW_VentasPorRegionPais AS
SELECT
C.Country AS PAIS,
SUM(OD.UnitPrice * OD.Quantity) AS VENTASTOTALES
FROM
Orders O
JOIN 
Customers C ON O.CustomerID = C.CustomerID
JOIN
[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY 
C.Country

select * from VW_VentasPorRegionPais