-- Define the temporary table structure
CREATE  TABLE #temp_mtn_table (
    column1 varchar(80)
);

BULK INSERT #temp_mtn_table
FROM 'C:\FxM\Dev\myansible\SQL\mnts.txt.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


-- Optional: Query the temp table to check the imported data
SELECT * FROM #temp_mtn_table;