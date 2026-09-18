-- ============================================================
-- Consulta 5: Clientes con mayor compra
-- ============================================================

SELECT
    per.NOMBRE_PER || ' ' || per.APELLIDO_PER AS Cliente,
    m.NOMBRE_MUN AS Municipio_Residencia,
    COUNT(DISTINCT v.ID_VEN) AS Cantidad_Ventas_Pagadas,
    SUM(dv.SUBTOTAL_DES_VEN) AS Monto_Total_Comprado
FROM CLIENTE cl
JOIN PERSONA per ON cl.ID_PER = per.ID_PER
LEFT JOIN MUNICIPIO m ON per.ID_MUN = m.ID_MUN
JOIN VENTA v ON cl.ID_CLI = v.ID_CLI
JOIN DESGLOSE_VENTA dv ON v.ID_VEN = dv.ID_VEN
WHERE v.ID_ES_VEN = (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'PAGADA')
GROUP BY per.NOMBRE_PER, per.APELLIDO_PER, m.NOMBRE_MUN
ORDER BY Monto_Total_Comprado DESC
FETCH FIRST 20 ROWS ONLY;