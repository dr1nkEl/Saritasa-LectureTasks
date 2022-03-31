
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Favorites table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_Find]
(

	@SearchUsingOR bit   = null ,

	@FavoriteID bigint   = null ,

	@DocumentId bigint   = null ,

	@UserId int   = null ,

	@Created datetime   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [favoriteID]
	, [DocumentId]
	, [UserId]
	, [Created]
    FROM
	[dbo].[Favorites]
    WHERE 
	 ([favoriteID] = @FavoriteID OR @FavoriteID IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Created] = @Created OR @Created IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [favoriteID]
	, [DocumentId]
	, [UserId]
	, [Created]
    FROM
	[dbo].[Favorites]
    WHERE 
	 ([favoriteID] = @FavoriteID AND @FavoriteID is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Created] = @Created AND @Created is not null)
	SELECT @@ROWCOUNT			
  END