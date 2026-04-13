UPDATE DimProducts
SET ProductEnglishName = COALESCE(ProductEnglishNam, 'DefaultValue')
WHERE ProductEnglishName IS NULL;