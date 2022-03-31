create function [dbo].[MondayCurrentWeek]()
-- returns the # monday of the current week
returns datetime
as
    begin
    return DATEADD(wk, DATEDIFF(wk,0,getdate()), 0)
    end
