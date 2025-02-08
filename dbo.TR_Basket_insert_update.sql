USE productdb;
GO

DECLARE @ID INT
DECLARE @ID_SKU INT
DECLARE @ID_Family INT
DECLARE @Quantity INT
DECLARE @Value INT
DECLARE @PurchaseDate DATETIME
DECLARE @DiscountValue INT


CREATE TRIGGER dbo.TR_Basket_insert_update
    ON dbo.Basket
    AFTER INSERT
    AS
    DECLARE my_cur CURSOR FOR SELECT top(@@ROWCOUNT)  ID, ID_SKU, ID_Family, Quantity, Value, PurchaseDate,DiscountValue FROM dbo.Basket
                              where ID_SKU=(SELECT top(@@ROWCOUNT)  ID_SKU FROM dbo.Basket)
    IF (@@ROWCOUNT >= 2 )


    WHILE @@FETCH_STATUS = 0

        BEGIN
            OPEN my_cur
            FETCH NEXT FROM my_cur INTO @ID, @ID_SKU, @ID_Family,@Quantity,@Value,@PurchaseDate,@DiscountValue
            INSERT INTO dbo.Basket ( ID_SKU, ID_Family, Quantity, Value, PurchaseDate, DiscountValue)VALUES ( @ID_SKU, @ID_Family, @Quantity, @Value, @PurchaseDate, @Value * 0.05)
             FETCH NEXT FROM my_cur INTO @ID, @ID_SKU, @ID_Family,@Quantity,@Value,@PurchaseDate,@DiscountValue
        END
else
    DECLARE my_cur CURSOR FOR SELECT top(@@ROWCOUNT)  ID, ID_SKU, ID_Family, Quantity, Value, PurchaseDate,DiscountValue FROM dbo.Basket

WHILE @@FETCH_STATUS = 0
    BEGIN
        OPEN my_cur
        FETCH NEXT FROM my_cur INTO @ID, @ID_SKU, @ID_Family,@Quantity,@Value,@PurchaseDate,@DiscountValue
        INSERT INTO dbo.Basket ( ID_SKU, ID_Family, Quantity, Value, PurchaseDate, DiscountValue)VALUES ( @ID_SKU, @ID_Family, @Quantity, @Value, @PurchaseDate, 0)
        FETCH NEXT FROM my_cur INTO @ID, @ID_SKU, @ID_Family,@Quantity,@Value,@PurchaseDate,@DiscountValue
    END





