


ALTER TABLE [YoutubeSchema].[dbo].[EsportChannelsDataFull]
ALTER COLUMN publishedAt datetimeoffset;

ALTER TABLE [YoutubeSchema].[dbo].[EsportChannelsDataFull]
ALTER COLUMN [Download Date] date;


SELECT  
      [channelId]
      ,[channelName]
      ,[title]
      ,[publishedAt]
      ,[viewCount]
      ,[likeCount]
	  ,[Download Date]
FROM [YoutubeSchema].[dbo].[EsportChannelsDataFull];

--drop table [YoutubeSchema].[dbo].[EsportChannelsDataFull];
--drop table [YoutubeSchema].[dbo].[EsportChannelsDataLastDay];


 
SELECT 
      [channelId]
      ,[channelName]
      ,[title]
      ,[publishedAt]
      ,[viewCount]
      ,[likeCount]
	  ,[Download Date]
 FROM [YoutubeSchema].[dbo].[EsportChannelsDataLastDay];

'drop table [YoutubeSchema].[dbo].[EsportChannelsDataLastDay];'



--Inserting last day


insert into [YoutubeSchema].[dbo].[EsportChannelsDataFull] select  
		[index]
      ,[channelId]
      ,[channelName]
      ,[title]
      ,cast([publishedAt] as datetimeoffset) 
      ,[viewCount]
      ,[likeCount]
	  ,cast([Download Date] as date)
	   from [YoutubeSchema].[dbo].[EsportChannelsDataLastDay];


--Creal table last day

truncate table [YoutubeSchema].[dbo].[EsportChannelsDataLastDay];




select * from [YoutubeSchema].[dbo].[EsportChannelsDataLastDay];





--Table to insert into full data

insert into [YoutubeSchema].[dbo].[EsportChannelsDataFull] select  
      [channelId]
      ,[channelName]
      ,[title]
      ,cast([publishedAt] as datetimeoffset) 
      ,[viewCount]
      ,[likeCount]
	  ,cast([Download Date] as date)
	   from [YoutubeSchema].[dbo].[EsportChannelsDataToFull];


select * from [YoutubeSchema].[dbo].[EsportChannelsDataToFull]
where substring(publishedAt,1,4) = '2023' and title = 'How to play HECARIM jungle in Season 13 League of Legends!'

where title = 'New season, same League of Legends'
