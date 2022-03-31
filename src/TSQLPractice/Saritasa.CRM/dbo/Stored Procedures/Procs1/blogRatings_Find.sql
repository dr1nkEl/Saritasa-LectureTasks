
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the BlogRatings table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_Find]
(

	@SearchUsingOR bit   = null ,

	@RatingId int   = null ,

	@BlogId int   = null ,

	@UserId int   = null ,

	@Point int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [RatingId]
	, [BlogId]
	, [UserId]
	, [Point]
    FROM
	[dbo].[BlogRatings]
    WHERE 
	 ([RatingId] = @RatingId OR @RatingId IS NULL)
	AND ([BlogId] = @BlogId OR @BlogId IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Point] = @Point OR @Point IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [RatingId]
	, [BlogId]
	, [UserId]
	, [Point]
    FROM
	[dbo].[BlogRatings]
    WHERE 
	 ([RatingId] = @RatingId AND @RatingId is not null)
	OR ([BlogId] = @BlogId AND @BlogId is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Point] = @Point AND @Point is not null)
	SELECT @@ROWCOUNT			
  END