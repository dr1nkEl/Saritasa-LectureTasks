
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the user_supervisers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_Delete
(

	@UserID int   ,

	@SuperviserID int   
)
AS


				DELETE FROM [dbo].[user_supervisers] WITH (ROWLOCK) 
				WHERE
					[userID] = @UserID
					AND [superviserID] = @SuperviserID
					
			


