-- ============================================================
-- Consulta 6: Facturación por categoría y marca
-- ============================================================

SELECT
    c.NOMBRE_CAT AS Categoria,
    m.NOMBRE_MAR AS Marca,
    SUM(dv.CANTIDAD_DES_VEN) AS Unidades_Vendidas,
    SUM(dv.SUBTOTAL_DES_VEN) AS Total_Facturado
FROM CATEGORIA c
JOIN PRODUCTO p ON c.ID_CAT = p.ID_CAT
JOIN MARCA m ON p.ID_MAR = m.ID_MAR
JOIN DESGLOSE_VENTA dv ON p.ID_PRO = dv.ID_PRO
JOIN VENTA v ON dv.ID_VEN = v.ID_VEN
WHERE v.ID_ES_VEN != (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'ANULADA')
GROUP BY c.NOMBRE_CAT, m.NOMBRE_MAR
ORDER BY Total_Facturado DESC;