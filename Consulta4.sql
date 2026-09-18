-- ============================================================
-- Consulta 4: Desempeño de empleados
-- ============================================================

SELECT
    per.NOMBRE_PER || ' ' || per.APELLIDO_PER AS Empleado,
    car.NOMBRE_CAR AS Cargo,
    t.NOMBRE_TI AS Tienda,
    COUNT(DISTINCT v.ID_VEN) AS Cantidad_Ventas_Atendidas,
    SUM(dv.SUBTOTAL_DES_VEN) AS Total_Facturado
FROM EMPLEADO e
JOIN PERSONA per ON e.ID_PER = per.ID_PER
JOIN CARGO car ON e.ID_CAR = car.ID_CAR
JOIN TIENDA t ON e.ID_TI = t.ID_TI
JOIN VENTA v ON e.ID_EMP = v.ID_EMP
JOIN DESGLOSE_VENTA dv ON v.ID_VEN = dv.ID_VEN
WHERE v.ID_ES_VEN != (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'ANULADA')
GROUP BY per.NOMBRE_PER, per.APELLIDO_PER, car.NOMBRE_CAR, t.NOMBRE_TI
ORDER BY Total_Facturado DESC;