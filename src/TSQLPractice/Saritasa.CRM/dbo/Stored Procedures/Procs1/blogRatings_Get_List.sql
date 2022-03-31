
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the BlogRatings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_Get_List]

AS


				
				SELECT
					[RatingId],
					[BlogId],
					[UserId],
					[Point]
				FROM
					[dbo].[BlogRatings]
					
				SELECT @@ROWCOUNT