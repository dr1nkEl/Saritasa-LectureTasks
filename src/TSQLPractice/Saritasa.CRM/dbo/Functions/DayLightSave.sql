CREATE FUNCTION [dbo].[DayLightSave]
(
 @loggedDate date
)
RETURNS bit
AS
BEGIN
 declare @date datetime
 set @date=GETDATE()
 declare @thisYear int
 set @thisYear=YEAR(@date)

 declare @startSaveLight int
  --calculate last sunday of october
 set @startSaveLight=31 - (5 * @thisYear/4 + 4) % 7
  --calculate last sunday of march
 declare @finishSaveLigth int
 set @finishSaveLigth=31 - (5 * @thisYear/4 + 1) % 7
 declare @dayMinusMart int
 set @dayMinusMart=@startSaveLight-31
    
     --calculating dates that hour change
 declare @startSaveLightDate date
 set @startSaveLightDate=DATEADD(day, @dayMinusMart, '03.31.'+cast(@thisYear as varchar(4))) 
 declare @finishSaveLightDate date
 set @finishSaveLightDate=DATEADD(day, @finishSaveLigth, '09.30.'+cast(@thisYear as varchar(4)))
     
    declare @result bit
    if(@loggedDate>@startSaveLightDate and @loggedDate<@finishSaveLightDate)
       set @result='true'
    else
    set @result='false'
 return @result
END
