create function [dbo].[FirstDayYear]()
-- returns the # monday of the current week
returns datetime
as
    begin
    return DATEADD(yy, DATEDIFF(yy,0,getdate()), 0)
    end
