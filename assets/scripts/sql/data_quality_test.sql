/*

#DATA QUALITY CHECK 

1.Data has to be 100 records of YouTube channels (row count test)                                   ---(PASSED!!!)
2.Data need 4 fields (column count test)                                                            ---(PASSED!!!)
3.Column name must be string format and other column must be numerical data types (data type check) ---(PASSED!!!)
4.Each record must be unique in the dataset (dublicate count check)                                 ---(PASSED!!!)


row count = 100
column count = 4

Data types

1.channel_name = VARCHAR
2.total_subscribers = intger
3.total_view = intger
4.total_videos = intger



*/
-- 1.Row count check

SELECT 
    COUNT(*) as no_rows
FROM 
    view_uk_youtubers_2024


-- 2.Column Count check

SELECT 
    COUNT(*) AS column_count
FROM 
   INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'view_uk_youtubers_2024'

   
-- 3. Data type check 

SELECT 
    COLUMN_NAME,
	DATA_TYPE
FROM 
   INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'view_uk_youtubers_2024'



-- 4.Dublicate check 
SELECT 
    channel_name,
	COUNT(*) AS dublicate_counts
FROM 
   view_uk_youtubers_2024
  
GROUP BY 
      channel_name
HAVING 
    COUNT(*) > 1
