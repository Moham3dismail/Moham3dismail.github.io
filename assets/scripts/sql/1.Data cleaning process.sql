/*

#DATA CLEANING STEPS
1.Remove the unnecessary columns by only selecting the ones we need
2.Extract the youtube channel names from first column 
3.Rename the columns 
*/



SELECT 
  NOMBRE,
  total_subscribers,
  total_views,
  total_videos
FROM 
  top_uk_youtuber_2024

--CHARINDEX
SELECT CHARINDEX('@', NOMBRE), NOMBRE FROM top_uk_youtuber_2024

--SUBSRING 

--CREATE VIEW view_uk_youtubers_2024 AS 
SELECT 
  CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@', NOMBRE)-1) AS VARCHAR(100)) AS channel_name,
  total_subscribers,
  total_views,
  total_videos
FROM 
  top_uk_youtuber_2024
