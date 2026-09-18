-- ============================================================
-- Consulta 8: Ventas pendientes de pago
-- ============================================================

SELECT
    v.ID_VEN AS Venta,
    TO_CHAR(v.FECHA_VEN, 'YYYY-MM-DD') AS Fecha,
    SUM(dv.SUBTOTAL_DES_VEN) AS Total_Venta,
    NVL(SUM(p.MONTO_PAG), 0) AS Total_Pagado,
    SUM(dv.SUBTOTAL_DES_VEN) - NVL(SUM(p.MONTO_PAG), 0) AS Diferencia_Pendiente
FROM VENTA v
JOIN DESGLOSE_VENTA dv ON v.ID_VEN = dv.ID_VEN
LEFT JOIN PAGO p ON v.ID_VEN = p.ID_VEN
WHERE v.ID_ES_VEN = (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'REGISTRADA')
GROUP BY v.ID_VEN, v.FECHA_VEN
ORDER BY Diferencia_Pendiente DESC;