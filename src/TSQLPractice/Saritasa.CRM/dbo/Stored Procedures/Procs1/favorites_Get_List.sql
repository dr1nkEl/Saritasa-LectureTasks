
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Favorites table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_Get_List]

AS


				
				SELECT
					[favoriteID],
					[DocumentId],
					[UserId],
					[Created]
				FROM
					[dbo].[Favorites]
					
				SELECT @@ROWCOUNT