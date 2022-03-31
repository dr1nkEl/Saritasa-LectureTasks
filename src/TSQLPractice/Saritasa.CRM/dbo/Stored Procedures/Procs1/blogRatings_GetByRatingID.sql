
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the BlogRatings table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_GetByRatingID]
(

	@RatingId int   
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
					[RatingId] = @RatingId
				SELECT @@ROWCOUNT