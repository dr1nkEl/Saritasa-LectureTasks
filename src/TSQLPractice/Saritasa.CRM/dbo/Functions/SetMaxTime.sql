
create function [dbo].[SetMaxTime] (@DateTime DateTime)
-- Returns last day of month of @DateTime;
returns datetime
as
begin
    return dateadd(second, -1, dateadd(day, 1, dbo.DateOnly(@DateTime)));
end