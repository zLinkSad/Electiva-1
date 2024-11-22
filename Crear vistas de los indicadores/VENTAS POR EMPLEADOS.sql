
--VENTAS POR EMPLEADOS
CREATE VIEW VW_PRODUCTIVIDADPOREMPLEADO AS
SELECT
E.EmployeeID,
E.FirstName + ' ' + E.LastName AS EMPLEADO,
SUM(OD.UnitPrice * OD.Quantity) AS VENTASTOTALES
FROM 
Orders O
JOIN
Employees E ON O.EmployeeID = E.EmployeeID
JOIN
[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY
E.EmployeeID, E.FirstName, E.LastName
select * from VW_PRODUCTIVIDADPOREMPLEADO