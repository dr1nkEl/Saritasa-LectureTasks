
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the user_supervisers table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_Find
(

	@SearchUsingOR bit   = null ,

	@UserID int   = null ,

	@SuperviserID int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [userID]
	, [superviserID]
    FROM
	[dbo].[user_supervisers]
    WHERE 
	 ([userID] = @UserID OR @UserID IS NULL)
	AND ([superviserID] = @SuperviserID OR @SuperviserID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [userID]
	, [superviserID]
    FROM
	[dbo].[user_supervisers]
    WHERE 
	 ([userID] = @UserID AND @UserID is not null)
	OR ([superviserID] = @SuperviserID AND @SuperviserID is not null)
	SELECT @@ROWCOUNT			
  END
				


