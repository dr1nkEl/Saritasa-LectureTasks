CREATE FUNCTION [dbo].[GetWorkingWeekDaysThisMonth]
(
	@monthStart DATE, 
	@monthEnd DATE, 
	@monday DATE
)
-- Returns the number of days since Monday inside the specified month.
RETURNS INT AS 
BEGIN
	-- We assume that all planner weeks start at mondays.
	-- {days after start} = {week len} - {days before start}
	DECLARE @daysAfterStartOfMonth INT = 5 - DATEDIFF(DAY, @monday, @monthStart) 
	DECLARE @daysBeforeEndOfMonth INT = DATEDIFF(DAY, @monday, @monthEnd) + 1

	IF @daysAfterStartOfMonth < 5
		RETURN @daysAfterStartOfMonth

	IF @daysBeforeEndOfMonth < 5
		RETURN @daysBeforeEndOfMonth
	
	RETURN 5	
END