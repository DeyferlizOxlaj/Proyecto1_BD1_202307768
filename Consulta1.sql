-- ============================================================
-- Consulta 1: Ventas por tienda y ubicación
-- ============================================================

SELECT
    t.NOMBRE_TI AS Tienda,
    m.NOMBRE_MUN AS Municipio,
    d.NOMBRE_DEP AS Departamento,
    p.NOMBRE_PA AS Pais,
    COUNT(DISTINCT v.ID_VEN) AS Cantidad_Ventas,
    SUM(dv.SUBTOTAL_DES_VEN) AS Total_Facturado
FROM VENTA v
JOIN TIENDA t ON v.ID_TI = t.ID_TI
JOIN MUNICIPIO m ON t.ID_MUN = m.ID_MUN
JOIN DEPARTAMENTO d ON m.ID_DEP = d.ID_DEP
JOIN PAIS p ON d.ID_PA = p.ID_PA
JOIN DESGLOSE_VENTA dv ON v.ID_VEN = dv.ID_VEN
WHERE v.ID_ES_VEN != (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'ANULADA')
GROUP BY t.NOMBRE_TI, m.NOMBRE_MUN, d.NOMBRE_DEP, p.NOMBRE_PA
ORDER BY Total_Facturado DESC;