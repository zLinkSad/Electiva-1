
--Numero de ordenes por Cliente
CREATE VIEW vw_OrdenesPorCliente AS
SELECT 
    C.CustomerID,
    C.CompanyName AS Cliente,
    COUNT(O.OrderID) AS NumeroDeOrdenes
FROM 
    Orders O
JOIN 
    Customers C ON O.CustomerID = C.CustomerID
GROUP BY 
    C.CustomerID, C.CompanyName;


	select * from vw_OrdenesPorCliente