SELECT
    FORMAT(fis.OrderDate, 'yyyy-MM') AS SalesMonth,
    SUM(fis.SalesAmount) AS MonthlySales
FROM FactInternetSales fis
GROUP BY FORMAT(fis.OrderDate, 'yyyy-MM')
ORDER BY SalesMonth;
