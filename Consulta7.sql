-- ============================================================
-- Consulta 7: Uso de métodos de pago
-- ============================================================

SELECT
    mp.NOMBRE_MET_PAG AS Metodo_Pago,
    COUNT(p.ID_PAG) AS Cantidad_Pagos,
    SUM(p.MONTO_PAG) AS Monto_Total_Recibido
FROM METODO_PAGO mp
JOIN PAGO p ON mp.ID_MET_PAG = p.ID_MET_PAG
GROUP BY mp.NOMBRE_MET_PAG
ORDER BY Monto_Total_Recibido DESC;