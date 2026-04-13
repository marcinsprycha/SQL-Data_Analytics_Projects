WITH CustomerFirstPurchase AS (
    SELECT
        CustomerKey,
        MIN(OrderDate) AS FirstPurchaseDate
    FROM FactInternetSales
    GROUP BY CustomerKey
),
CohortSales AS (
    SELECT
        YEAR(cfp.FirstPurchaseDate) AS CohortYear,
        DATEDIFF(month, cfp.FirstPurchaseDate, fis.OrderDate) AS MonthsSinceFirstPurchase,
        COUNT(DISTINCT cfp.CustomerKey) AS NumberOfCustomers,
        SUM(fis.SalesAmount) AS TotalSales
    FROM CustomerFirstPurchase cfp
    JOIN FactInternetSales fis ON cfp.CustomerKey = fis.CustomerKey
    GROUP BY YEAR(cfp.FirstPurchaseDate), DATEDIFF(month, cfp.FirstPurchaseDate, fis.OrderDate)
)
SELECT
    CohortYear,
    MonthsSinceFirstPurchase,
    NumberOfCustomers,
    TotalSales
FROM CohortSales
ORDER BY CohortYear, MonthsSinceFirstPurchase;
