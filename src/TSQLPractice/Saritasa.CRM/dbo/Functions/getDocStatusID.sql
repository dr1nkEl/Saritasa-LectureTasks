
-- =============================================
-- Author:		Alexander Far.
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getDocStatusID] 
(
	-- Add the parameters for the function here
	@StatusName varchar(60),
	@DocType char(3)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = -1
	select top 1 @Result = statusid from lookup_document_statuses
	where statusname = @StatusName 
	and trackID = (select top 1 trackID from document_tracks 
					where upper(typeID) = upper(@DocType) and trackTypeID='GEN')

	-- Return the result of the function
	RETURN @Result

END
