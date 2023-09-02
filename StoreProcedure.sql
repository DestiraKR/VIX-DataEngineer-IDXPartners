CREATE PROCEDURE summary_order_status
(
@StatusID int
)
AS
BEGIN 
	SELECT
		fso.OrderID,
		dc.CustomerName,
		dp.ProductName,
		fso.Quantity,
		dso.StatusOrder
	FROM FactSalesOrder AS fso
	JOIN DimStatusOrder AS dso ON fso.StatusID = dso.StatusID
	JOIN DimProduct AS dp ON fso.ProductID = dp.ProductID
	JOIN DimCustomer As dc ON fso.CustomerID = dc.CustomerID
	WHERE fso.StatusID = @StatusID
END;

EXEC summary_order_status 
@StatusID = 2;