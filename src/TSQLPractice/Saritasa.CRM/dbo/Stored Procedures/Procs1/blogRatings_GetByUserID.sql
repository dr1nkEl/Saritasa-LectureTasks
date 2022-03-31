
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the BlogRatings table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_GetByUserID]
(

	@UserId int   
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
					[UserId] = @UserId
				SELECT @@ROWCOUNT