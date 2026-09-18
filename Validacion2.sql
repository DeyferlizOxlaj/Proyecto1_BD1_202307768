-- ============================================================
-- Validación 2: Las ventas PAGADAS deben tener pagos cuya suma
-- ============================================================

SELECT
    v.ID_VEN,
    SUM(dv.SUBTOTAL_DES_VEN) AS Total_Venta,
    NVL(SUM(p.MONTO_PAG), 0) AS Total_Pagado,
    SUM(dv.SUBTOTAL_DES_VEN) - NVL(SUM(p.MONTO_PAG), 0) AS Diferencia
FROM VENTA v
JOIN DESGLOSE_VENTA dv ON v.ID_VEN = dv.ID_VEN
LEFT JOIN PAGO p ON v.ID_VEN = p.ID_VEN
WHERE v.ID_ES_VEN = (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'PAGADA')
GROUP BY v.ID_VEN
HAVING ABS(SUM(dv.SUBTOTAL_DES_VEN) - NVL(SUM(p.MONTO_PAG), 0)) > 0.01;

-- ============================================================
-- Los valores negativos indican que los pagos suman MÁS que el total de la venta. En un sistema real esto sería imposible, pero es común en datasets de prueba generados aleatoriamente.
-- ============================================================