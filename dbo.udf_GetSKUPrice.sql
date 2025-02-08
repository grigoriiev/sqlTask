USE productsdb;
GO
CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU int)
    RETURNS decimal(18, 2)
(
    SELECT dbo.Basket.Value / dbo.Basket.Quantity AS GetSKUPrice
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU

)