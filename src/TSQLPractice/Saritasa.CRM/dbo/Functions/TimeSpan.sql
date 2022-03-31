create function [dbo].[TimeSpan](@Days int, @Hours int, @Minutes int, @Seconds int)
-- returns a datetime the specified # of days/hours/minutes/seconds from the "base" date of 1/1/1900 (a "TimeSpan")
returns datetime
as
    begin
    return dbo.Time(@Hours,@Minutes,@Seconds) + @Days
    end
