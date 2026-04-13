WITH UniqueTransactions AS (
    SELECT
        OrderDate,
        ProductKey,
        CustomerKey,
        SalesAmount,
        ROW_NUMBER() OVER (PARTITION BY OrderDate, ProductKey, CustomerKey ORDER BY SalesAmount) as rn
    FROM FactInternetSales
)
SELECT
    OrderDate,
    ProductKey,
    CustomerKey,
    SalesAmount
FROM UniqueTransactions
WHERE rn = 1; -- Wybiera tylko unikalne rekordy (pierwszy z każdej grupy duplikatów)
