-- ============================================================
-- Consulta 3: Productos más vendidos
-- ============================================================

SELECT
    p.ID_PRO AS Codigo,
    p.NOMBRE_PRO AS Producto,
    c.NOMBRE_CAT AS Categoria,
    m.NOMBRE_MAR AS Marca,
    SUM(dv.CANTIDAD_DES_VEN) AS Unidades_Vendidas,
    SUM(dv.SUBTOTAL_DES_VEN) AS Monto_Generado
FROM PRODUCTO p
JOIN CATEGORIA c ON p.ID_CAT = c.ID_CAT
JOIN MARCA m ON p.ID_MAR = m.ID_MAR
JOIN DESGLOSE_VENTA dv ON p.ID_PRO = dv.ID_PRO
JOIN VENTA v ON dv.ID_VEN = v.ID_VEN
WHERE v.ID_ES_VEN != (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'ANULADA')
GROUP BY p.ID_PRO, p.NOMBRE_PRO, c.NOMBRE_CAT, m.NOMBRE_MAR
ORDER BY Unidades_Vendidas DESC
FETCH FIRST 20 ROWS ONLY;