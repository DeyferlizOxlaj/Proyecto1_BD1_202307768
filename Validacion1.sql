-- ============================================================
-- Validación 1: Empleado que atiende la venta debe pertenecer
-- ============================================================

SELECT 
    v.ID_VEN,
    v.ID_TI AS Tienda_Venta,
    e.ID_TI AS Tienda_Empleado,
    per.NOMBRE_PER || ' ' || per.APELLIDO_PER AS Empleado
FROM VENTA v
JOIN EMPLEADO e ON v.ID_EMP = e.ID_EMP
JOIN PERSONA per ON e.ID_PER = per.ID_PER
WHERE v.ID_TI != e.ID_TI;