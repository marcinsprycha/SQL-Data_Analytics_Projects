SELECT
    dc.EnglishEducation AS EducationLevel,
    dc.MaritalStatus,
    COUNT(DISTINCT dc.CustomerKey) AS NumberOfCustomers,
    AVG(fis.SalesAmount) AS AverageOrderValue
FROM DimCustomer dc
JOIN FactInternetSales fis ON dc.CustomerKey = fis.CustomerKey
GROUP BY dc.EnglishEducation, dc.MaritalStatus
ORDER BY NumberOfCustomers DESC;
