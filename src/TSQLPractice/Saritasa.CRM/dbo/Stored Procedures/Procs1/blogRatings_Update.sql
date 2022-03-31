
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the BlogRatings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_Update]
(

	@RatingId int   ,

	@BlogId int   ,

	@UserId int   ,

	@Point int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[BlogRatings]
				SET
					[BlogId] = @BlogId
					,[UserId] = @UserId
					,[Point] = @Point
				WHERE
[RatingId] = @RatingId