
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the BlogRatings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_Delete]
(

	@RatingId int   
)
AS


				DELETE FROM [dbo].[BlogRatings] WITH (ROWLOCK) 
				WHERE
					[RatingId] = @RatingId