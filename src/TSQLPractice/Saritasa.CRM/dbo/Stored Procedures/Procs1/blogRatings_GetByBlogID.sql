
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the BlogRatings table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_GetByBlogID]
(

	@BlogId int   
)
AS


				SELECT
					[RatingId],
					[BlogId],
					[UserId],
					[Point]
				FROM
					[dbo].[BlogRatings]
				WHERE
					[BlogId] = @BlogId
				SELECT @@ROWCOUNT