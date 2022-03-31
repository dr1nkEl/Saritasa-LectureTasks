

CREATE function [dbo].[FirstDayMonth](@date datetime)
-- returns a datetime value for the specified year, month and day
-- Thank you to Michael Valentine Jones for this formula (see comments).
returns datetime
as
    begin
		return dateadd(month,((Year(@date)-1900)*12)+month(@date)-1,0)	
    end


