
create function [dbo].[LastDayWeek] (@DateTime DateTime)
-- Returns last day of week of @DateTime;
returns datetime
as
begin
    return dateadd(day, -datepart(weekday, @DateTime)+7, @DateTime);
end