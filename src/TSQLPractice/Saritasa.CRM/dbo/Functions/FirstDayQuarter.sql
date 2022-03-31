create function [dbo].[FirstDayQuarter]()
-- returns the # monday of the current week
returns datetime
as
    begin
    return DATEADD(qq, DATEDIFF(qq,0,getdate()), 0)
    end
