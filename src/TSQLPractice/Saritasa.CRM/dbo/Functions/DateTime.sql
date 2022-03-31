
CREATE function [dbo].[DateTime](@Year int, @Month int, @Day int, @Hour int, @Minute int, @Second int)
-- returns a dateTime value for the date and time specified.
returns datetime
as
    begin
    return dbo.Date(@Year,@Month,@Day) + dbo.Time(@Hour, @Minute,@Second)
    end

