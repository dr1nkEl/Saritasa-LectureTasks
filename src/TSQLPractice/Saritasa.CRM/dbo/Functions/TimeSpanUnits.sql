create function [dbo].[TimeSpanUnits](@Unit char(1), @TimeSpan datetime)
-- returns the # of units specified in the TimeSpan.
-- The Unit parameter can be: "d" = days, "h" = hours, "m" = minutes, "s" = seconds
returns int
as
    begin
    return case @Unit
        when 'd' then datediff(day, 0, @TimeSpan)
        when 'h' then datediff(hour, 0, @TimeSpan)
        when 'm' then datediff(minute, 0, @TimeSpan)
        when 's' then datediff(second, 0, @TimeSpan)
        else Null end
    end