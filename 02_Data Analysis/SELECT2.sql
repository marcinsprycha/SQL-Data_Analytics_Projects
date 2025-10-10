SELECT
    EnglishProductName,
    dp.ProductKey,
    COUNT(fis.ProductKey) NumberOfSold,
    fis.UnitPrice,
    CAST(SUM(fis.salesamount)AS int) TotalIncome
FROM DimProduct dp 
LEFT JOIN FactInternetSales fis on dp.ProductKey = fis.ProductKey
GROUP BY EnglishProductName,dp.ProductKey, fis.UnitPrice
ORDER BY 5 DESC
