create function [dbo].[LastDayCurrentMonth]()
-- returns the # monday of the current week
returns datetime
as
    begin
    return dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,getdate()  )+1, 0))
    end
