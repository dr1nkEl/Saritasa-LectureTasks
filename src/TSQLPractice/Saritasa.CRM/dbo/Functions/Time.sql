﻿create function [dbo].[Time](@Hour int, @Minute int, @Second int)
-- Returns a datetime value for the specified time at the "base" date (1/1/1900)
-- Many thanks to MVJ for providing this formula (see comments).
returns datetime
as
    begin
    return dateadd(ss,(@Hour*3600)+(@Minute*60)+@Second,0)
    end
