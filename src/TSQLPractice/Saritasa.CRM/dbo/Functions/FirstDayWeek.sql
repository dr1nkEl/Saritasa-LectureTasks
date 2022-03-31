
create function [dbo].[FirstDayWeek] (@DateTime DateTime)
-- Returns first day of week of @DateTime;
returns datetime
as
begin
    return dateadd(day, -datepart(weekday, @DateTime)+1, @DateTime);
end

