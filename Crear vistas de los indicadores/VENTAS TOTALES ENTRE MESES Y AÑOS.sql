--VENTAS TOTALES ENTRE MESES Y AÑOS
CREATE VIEW VW_VentasTotalPorPeriodo AS
SELECT
YEAR(o.OrderDate) AS [YEAR],
MONTH(o.OrderDate) AS [MONTH],
SUM(OD.UnitPrice * OD.Quantity) AS VentasTotales
FROM
Orders o
JOIN  
[Order Details] OD ON o.OrderID = OD.OrderID
GROUP BY 
YEAR(o.OrderDate),MONTH(o.OrderDate);

select * from VW_VentasTotalPorPeriodo;