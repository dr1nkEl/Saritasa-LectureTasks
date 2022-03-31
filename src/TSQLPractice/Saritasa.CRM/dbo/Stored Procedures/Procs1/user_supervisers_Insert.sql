
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the user_supervisers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_Insert
(

	@UserID int   ,

	@SuperviserID int   
)
AS


				
				INSERT INTO [dbo].[user_supervisers]
					(
					[userID]
					,[superviserID]
					)
				VALUES
					(
					@UserID
					,@SuperviserID
					)
				
									
							
			


