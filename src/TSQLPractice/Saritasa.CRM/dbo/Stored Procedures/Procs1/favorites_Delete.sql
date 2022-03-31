
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Favorites table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_Delete]
(

	@FavoriteID bigint   
)
AS


				DELETE FROM [dbo].[Favorites] WITH (ROWLOCK) 
				WHERE
					[favoriteID] = @FavoriteID