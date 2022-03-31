
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the user_supervisers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_Update
(

	@UserID int   ,

	@OriginalUserID int   ,

	@SuperviserID int   ,

	@OriginalSuperviserID int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[user_supervisers]
				SET
					[userID] = @UserID
					,[superviserID] = @SuperviserID
				WHERE
[userID] = @OriginalUserID 
AND [superviserID] = @OriginalSuperviserID 
				
			


