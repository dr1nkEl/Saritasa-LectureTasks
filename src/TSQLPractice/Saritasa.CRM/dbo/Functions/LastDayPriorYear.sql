create function [dbo].[LastDayPriorYear]()
-- returns the # monday of the current week
returns datetime
as
    begin
    return dateadd(ms,-3,DATEADD(yy, DATEDIFF(yy,0,getdate()  ), 0))
    end
