
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Favorites table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_GetByUserID]
(

	@UserId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[favoriteID],
					[DocumentId],
					[UserId],
					[Created]
				FROM
					[dbo].[Favorites]
				WHERE
					[UserId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON