'Company Data'
'Converted permanetly to datetimeoffset on final table'

'
ALTER TABLE [YoutubeSchema].[dbo].[BBCChannelsDataFull]
ALTER COLUMN publishedAt datetimeoffset;
'

'
ALTER TABLE [YoutubeSchema].[dbo].[BBCChannelsDataFull]
ALTER COLUMN [Download Date] date;
'

'Selecting full data'
SELECT 
      *
FROM [YoutubeSchema].[dbo].[BBCChannelsDataFull]
where title in ('Ukraine counter-offensive has begun, says President Zelensky - BBC News')
order by 4;
'drop table [YoutubeSchema].[dbo].[BBCChannelsDataFull];'
 
'Selecting Last day data'
SELECT  
      [channelId]
      ,[channelName]
      ,[title]
      ,[publishedAt]
      ,[viewCount]
      ,[likeCount]
FROM [YoutubeSchema].[dbo].[BBCChannelsDataLastDay];

drop table [YoutubeSchema].[dbo].[BBCChannelsDataLastDay];


'drop table [YoutubeSchema].[dbo].[BBCChannelsDataLastDay];'


'To insert it to full data'
insert into [YoutubeSchema].[dbo].[BBCChannelsDataFull] select
      [channelId]
      ,[channelName]
      ,[title]
      ,cast([publishedAt] as datetimeoffset) 
      ,[viewCount]
      ,[likeCount]
	  ,[Download date] from [YoutubeSchema].[dbo].[BBCChannelsDataLastDay];


 'And TGruncate last day data for the next data'
truncate table [YoutubeSchema].[dbo].[BBCChannelsDataLastDay];


'Checking if empty to find no duplicates in full data after inserting from last day'
select * from [YoutubeSchema].[dbo].[BBCChannelsDataLastDay]
order by 7;



SELECT distinct 
      *
FROM [YoutubeSchema].[dbo].[BBCChannelsDataToFull]
where channelName = 'BBC News'
and title in (select top 10 title from [YoutubeSchema].[dbo].[BBCChannelsDataToFull]  order by viewCount desc  );


select * from [YoutubeSchema].[dbo].[BBCChannelsDataToFull]
where title = N'Inside the Taliban's war on drugs - BBC News'
order by 5;



truncate table [YoutubeSchema].[dbo].[BBCChannelsDataToFull];