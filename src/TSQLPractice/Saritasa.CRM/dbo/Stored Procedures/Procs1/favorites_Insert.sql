
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Favorites table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_Insert]
(

	@FavoriteID bigint    OUTPUT,

	@DocumentId bigint   ,

	@UserId int   ,

	@Created datetime   
)
AS


				
				INSERT INTO [dbo].[Favorites]
					(
					[DocumentId]
					,[UserId]
					,[Created]
					)
				VALUES
					(
					@DocumentId
					,@UserId
					,@Created
					)
				
				-- Get the identity value
				SET @FavoriteID = SCOPE_IDENTITY()