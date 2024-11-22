
--Total de Ventas por Transportista
CREATE VIEW vw_TotalVentasPorTransportista AS
SELECT 
    S.ShipperID,
    S.CompanyName AS Transportista,
    SUM(OD.UnitPrice * OD.Quantity) AS VentasTotales
FROM 
    Orders O
JOIN 
    Shippers S ON O.ShipVia = S.ShipperID
JOIN 
    [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY 
    S.ShipperID, S.CompanyName;

	select * from vw_TotalVentasPorTransportista