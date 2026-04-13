SELECT
    OrderDate,
    SalesAmount,
    AVG(SalesAmount) OVER (
        ORDER BY OrderDate
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS SevenDayMovingAverageSales
FROM FactInternetSales
ORDER BY OrderDate;
