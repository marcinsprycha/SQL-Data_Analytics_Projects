SELECT
    OrderDate,
    SalesAmount,
    SUM(SalesAmount) OVER (ORDER BY OrderDate) AS RunningTotalSales
FROM FactInternetSales
ORDER BY OrderDate;
