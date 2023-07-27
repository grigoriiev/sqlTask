USE productsdb;
GO
CREATE PROCEDURE ProductSummary (@FamilySurName varchar(255))  AS
BEGIN
    BEGIN TRY
        if
      (@FamilySurName IS NULL)
            THROW;
        UPDATE dbo.Family
        SET  BudgetValue=dbo.Family.BudgetValue - sum(dbo.Basket.Value)
        from dbo.Family u
                 inner join dbo.Basket s on
                u.id = s.udid
        WHERE SurName =@FamilySurName;
    END TRY
    BEGIN CATCH
        PRINT N'Ошибка  такой семьи нет'
    END CATCH
END;