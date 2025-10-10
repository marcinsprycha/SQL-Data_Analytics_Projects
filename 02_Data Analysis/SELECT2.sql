SELECT
    EnglishProductName,
    dp.ProductKey,
    COUNT(fis.ProductKey) NumberOfSold,
    fis.UnitPrice,
    SUM(fis.salesamount) AmountSold
FROM DimProduct dp 
LEFT JOIN FactInternetSales fis on dp.ProductKey = fis.ProductKey
GROUP BY EnglishProductName,dp.ProductKey, fis.UnitPrice
ORDER BY NumberOfSold DESC
