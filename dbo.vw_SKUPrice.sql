
CREATE VIEW dbo.vw_SKUPrice AS
SELECT dbo.SKU.ID, dbo.SKU.Name, dbo.SKU.Code, dbo.udf_GetSKUPrice(@ID_SKU) as getSKUPrice
FROM dbo.SKU;