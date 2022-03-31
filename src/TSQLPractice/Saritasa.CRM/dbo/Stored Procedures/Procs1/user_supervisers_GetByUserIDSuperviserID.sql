
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the user_supervisers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_GetByUserIDSuperviserID
(

	@UserID int   ,

	@SuperviserID int   
)
AS


				SELECT
					[userID],
					[superviserID]
				FROM
					[dbo].[user_supervisers]
				WHERE
					[userID] = @UserID
					AND [superviserID] = @SuperviserID
				SELECT @@ROWCOUNT
					
			


