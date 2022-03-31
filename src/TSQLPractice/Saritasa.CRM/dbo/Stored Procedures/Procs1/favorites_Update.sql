
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Favorites table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_Update]
(

	@FavoriteID bigint   ,

	@DocumentId bigint   ,

	@UserId int   ,

	@Created datetime   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Favorites]
				SET
					[DocumentId] = @DocumentId
					,[UserId] = @UserId
					,[Created] = @Created
				WHERE
[favoriteID] = @FavoriteID