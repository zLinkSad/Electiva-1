
--Numero de ordenes Enviadas por Transportista
CREATE VIEW vw_OrdenesPorTransportista AS
SELECT 
    S.ShipperID,
    S.CompanyName AS Transportista,
    COUNT(O.OrderID) AS NumeroDeOrdenes
FROM 
    Orders O
JOIN 
    Shippers S ON O.ShipVia = S.ShipperID
GROUP BY 
    S.ShipperID, S.CompanyName;


	select * from vw_OrdenesPorTransportista