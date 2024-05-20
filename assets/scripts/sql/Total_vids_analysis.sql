/*

1.Define variables
2.Create CTE that round the average views per video 
3.Selec column that are required for the analysis 
4.Filter results by YouTube channels
5.Order by net_profit (from highest to lowerst)



*/

--1.Define variables
DECLARE @conversionRate FLOAT = 0.02;           -- The conversion rate @ 2%
DECLARE @productCost FLOAT = 5.0;               -- The product cost @ $5
DECLARE @campaignCostPerVideo FLOAT = 5000.0;   -- The campaign cost per video @ $5,000
DECLARE @numberOfVideos INT = 11;               -- The number of videos (11)


--2.Create CTE that round the average views per video 
WITH ChannelData AS (
    SELECT
        channel_name,
        total_views,
        total_videos,
        ROUND((CAST(total_views AS FLOAT) / total_videos), -4) AS rounded_avg_views_per_video
    FROM
        youtube_db.dbo.view_uk_youtubers_2024
)


--3.Select column that are required for the analysis 
SELECT 
    Channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video *  @conversionRate) AS potential_units_sold_per_video,
	(rounded_avg_views_per_video *  @conversionRate * @productCost) AS potential_revenue_per_video,
	(rounded_avg_views_per_video *  @conversionRate * @productCost) - (@campaignCostPerVideo * @numberOfVideos) AS net_profit
FROM
   ChannelData


--4.Filter results by YouTube channels
WHERE
    channel_name IN ('GRM Daily', 'Man City', 'YOGSCAST Lewis & Simon ')

--Order by net_profit (from highest to lowerst)
ORDER BY
    net_profit DESC;