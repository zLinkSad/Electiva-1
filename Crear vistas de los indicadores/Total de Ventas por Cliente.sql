
--Total de Ventas por Cliente

CREATE VIEW vw_TotalVentasPorCliente AS
SELECT 
    C.CustomerID,
    C.CompanyName AS Cliente,
    SUM(OD.UnitPrice * OD.Quantity) AS VentasTotales
FROM 
    Orders O
JOIN 
    Customers C ON O.CustomerID = C.CustomerID
JOIN 
    [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY 
    C.CustomerID, C.CompanyName;

	select * from vw_TotalVentasPorCliente