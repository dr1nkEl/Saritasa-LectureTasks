create function [dbo].[LastDayPriorMonth]()
-- returns the # monday of the current week
returns datetime
as
    begin
    return dateadd(ms,-3,DATEADD(mm, DATEDIFF(mm,0,getdate()  ), 0))
    end
