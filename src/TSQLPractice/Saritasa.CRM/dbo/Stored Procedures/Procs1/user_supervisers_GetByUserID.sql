
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the user_supervisers table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_GetByUserID
(

	@UserID int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[userID],
					[superviserID]
				FROM
					[dbo].[user_supervisers]
				WHERE
					[userID] = @UserID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


