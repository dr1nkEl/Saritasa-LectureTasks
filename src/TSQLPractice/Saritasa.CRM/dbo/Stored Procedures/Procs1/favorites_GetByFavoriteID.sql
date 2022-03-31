
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Favorites table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_GetByFavoriteID]
(

	@FavoriteID bigint   
)
AS


				SELECT
					[favoriteID],
					[DocumentId],
					[UserId],
					[Created]
				FROM
					[dbo].[Favorites]
				WHERE
					[favoriteID] = @FavoriteID
				SELECT @@ROWCOUNT