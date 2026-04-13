SELECT
    dp.EnglishProductCategoryName,
    SUM(fis.SalesAmount) AS TotalSales,
    COUNT(DISTINCT fis.ProductKey) AS NumberOfUniqueProductsSold
FROM DimProduct dp
JOIN FactInternetSales fis ON dp.ProductKey = fis.ProductKey
GROUP BY dp.EnglishProductCategoryName
ORDER BY TotalSales DESC;
