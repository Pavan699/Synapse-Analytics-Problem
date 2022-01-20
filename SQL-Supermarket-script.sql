-- This is auto-generated code
SELECT
    Gender,SUM(Total) as TotalMoney
FROM
    OPENROWSET(
        BULK 'https://pavan0699.dfs.core.windows.net/synapsedemo/supermarket_sales - Sheet1.csv',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'
        ) AS [result]
GROUP BY Gender