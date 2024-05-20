/*

1.Define variables
2.Create CTE that round the average views per video 
3.Selec column that are required for the analysis 
4.Filter results youtube channel with the highest subscriber base
5.Order by net_profit (from highest to lowerst)



*/

--1.Define variables
DECLARE @conversionRate FLOAT=0.02;  -- The conversion rate @ 2%
DECLARE @productCost MONEY=5.0;      -- The product cost @ $5
DECLARE @campaignCost MONEY= 50000;  --The campaign cost @ $50,000


--2. Create CTE that rounds the avarage views per video
WITH ChannelData AS (
SELECT
      channel_name,
	  total_views,
	  total_videos,
	  ROUND((CAST(total_views as FLOAT) / total_videos), -4) as rounded_avg_views_per_video
	  
  FROM
    youtube_db.dbo.view_uk_youtubers_2024

)


-- 3.Selec column that are required for the analysis
SELECT
    channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video * @conversionRate) AS potential_unit_sales_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) AS Potential_revenue_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost - @campaignCost) AS net_profit
FROM
  ChannelData

--4.Filter results youtube channel with the highest subscriber base
WHERE
   channel_name IN ('NoCopyrightSounds', 'DanTDM', 'Dan Rhodes', 'Miss Katy')


--5.Order by net_profit (from highest to lowerst)
ORDER BY
      net_profit DESC