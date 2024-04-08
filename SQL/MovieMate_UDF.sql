--- UDF to calculate Tax

use MovieMate3;

CREATE FUNCTION CalculateAmountWithTax (
    @Amount DECIMAL(10, 2) -- Specify appropriate precision
)
RETURNS DECIMAL(10, 2) 
AS
BEGIN
    DECLARE @TotalAmount DECIMAL(10, 2)
	DECLARE @TaxRate DECIMAL(5,2) = 0.07 
 
    SET @TotalAmount = @Amount + (@Amount * @TaxRate)
 
    RETURN @TotalAmount
END

select * from Payment;

-- drop Function CalculateAmountWithTax;

SELECT *, dbo.CalculateAmountWithTax(p.Amount) as Total_Payable from Payment p;


