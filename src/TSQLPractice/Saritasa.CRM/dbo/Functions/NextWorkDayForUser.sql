
-- =============================================
-- Author:		Alexander Farashutdinov
-- Create date: 
-- Description:	
-- =============================================
create FUNCTION NextWorkDayForUser
(
	-- Add the parameters for the function here
	@userID int,
	@date datetime,
	@day int
)
RETURNS datetime
AS
BEGIN
	DECLARE @Result datetime
	select top(@day) @Result = date
		FROM _vCalendarPersonal
		WHERE (userID =@userID)  and date>@date and dayType in ('SW','PW')
		order by date
	if(@Result	is null) set @Result =  dateadd(day,@day, datediff(day,0,@date))
	RETURN @Result
END
