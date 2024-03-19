 
 --Nowe wideo 
'Company Data'
'Converted permanetly to datetimeoffset on final table'


ALTER TABLE [YoutubeSchema].[dbo].[CyclingChannelsDataFull]
ALTER COLUMN publishedAt datetimeoffset;


ALTER TABLE [YoutubeSchema].[dbo].[CyclingChannelsDataFull]
ALTER COLUMN [Download Date] date;



'Selecting full data'
SELECT
      [channelId]
      ,[channelName]
      ,[title]
      ,[publishedAt]
      ,[viewCount]
      ,[likeCount]
	  ,[Download Date]
FROM [YoutubeSchema].[dbo].[CyclingChannelsDataFull];
 

'Selecting Last day data'
SELECT  
      *
FROM [YoutubeSchema].[dbo].[CyclingChannelsDataLastDay];




'To insert it to full data'
insert into [YoutubeSchema].[dbo].[CyclingChannelsDataFull] select 
      [channelId]
      ,[channelName]
      ,[title]
      ,cast([publishedAt] as datetimeoffset) 
      ,[viewCount]
      ,[likeCount],
	  [Download Date]
	   from [YoutubeSchema].[dbo].[CyclingChannelsDataLastDay];

 'And TGruncate last day data for the next data'
truncate table [YoutubeSchema].[dbo].[CyclingChannelsDataLastDay];


'Checking if empty to find no duplicates in full data after inserting from last day'
select * from [YoutubeSchema].[dbo].[CyclingChannelsDataLastDay];

--Table to insert into full data

insert into [YoutubeSchema].[dbo].[CyclingChannelsDataFull] select  
      [channelId]
      ,[channelName]
      ,[title]
      ,cast([publishedAt] as datetimeoffset) 
      ,[viewCount]
      ,[likeCount]
	  ,cast([Download Date] as date)
	   from [YoutubeSchema].[dbo].[CyclingChannelsDataToFull];


select distinct * from [YoutubeSchema].[dbo].[CyclingChannelsDataToFull]
where title = 'GCN Vs Monte Zoncolan ??????'








select * from [YoutubeSchema].[dbo].[CyclingChannelsDataToFull] order by title;


select * from [YoutubeSchema].[dbo].[CyclingChannelsDataToFull]
where title = '10 Easy Ways To Improve Your Mountain Biking | Progress Your Riding';






drop table [YoutubeSchema].[dbo].[CyclingChannelsDataLastDay];

drop table [YoutubeSchema].[dbo].[CyclingChannelsDataFull];

drop table [YoutubeSchema].[dbo].[CyclingChannelsDataToFull];