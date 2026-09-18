-- ============================================================
-- Consulta 2: Ventas por tipo de tienda
-- ============================================================

SELECT
    tt.NOMBRE_TIP_TIE AS Tipo_Tienda,
    COUNT(DISTINCT t.ID_TI) AS Cantidad_Tiendas,
    COUNT(DISTINCT v.ID_VEN) AS Cantidad_Ventas,
    SUM(dv.SUBTOTAL_DES_VEN) AS Monto_Facturado
FROM TIPO_TIENDA tt
JOIN TIENDA t ON tt.ID_TIP_TIE = t.ID_TIP_TIE
JOIN VENTA v ON t.ID_TI = v.ID_TI
JOIN DESGLOSE_VENTA dv ON v.ID_VEN = dv.ID_VEN
WHERE v.ID_ES_VEN != (SELECT ID_ES_VEN FROM ESTADO_VENTA WHERE NOMBRE_ES_VEN = 'ANULADA')
GROUP BY tt.NOMBRE_TIP_TIE
ORDER BY Monto_Facturado DESC;