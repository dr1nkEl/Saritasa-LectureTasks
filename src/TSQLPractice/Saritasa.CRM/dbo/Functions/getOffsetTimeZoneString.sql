
CREATE FUNCTION [dbo].[getOffsetTimeZoneString] (@intHours int) 
RETURNS varchar(6)
AS BEGIN  
    declare @hoursInchar varchar(6);
    if(@intHours>=0 and @intHours<10)
             set @hoursInchar=(select '+0'+CAST(@intHours as varchar)+':00')
    if(@intHours>=10)         
    set @hoursInchar=(select '+'+CAST(@intHours as varchar)+':00')
    if(@intHours<0 and @intHours>-10)
             set @hoursInchar=(select '-0'+CAST((@intHours)*(-1) as varchar)+':00')
    if(@intHours<=-10) 
           set @hoursInchar=(select '-'+CAST((@intHours)*(-1) as varchar)+':00')
    RETURN @hoursInchar
END
