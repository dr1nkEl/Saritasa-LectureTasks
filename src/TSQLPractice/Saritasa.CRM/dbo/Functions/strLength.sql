
-- =============================================
-- Author:		Alexander Farashutdinov
-- Create date: 
-- Description:	
-- =============================================
create FUNCTION strLength 
(
	-- Add the parameters for the function here
	@s varchar(max)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = DATALENGTH(ltrim(rtrim(@s)))

	-- Return the result of the function
	RETURN @Result

END
