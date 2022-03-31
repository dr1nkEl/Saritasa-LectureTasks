
CREATE FUNCTION [dbo].[getLateTime] 
(
 @date datetime,
 @startTimeWorkDay int
)
RETURNS int
AS
BEGIN
     declare @hours int;
     declare @minutes int;
     set @hours=datepart(hour, @date)-(@startTimeWorkDay);
  set @minutes=datepart(minute,@date);
  return @hours*60+@minutes
END
