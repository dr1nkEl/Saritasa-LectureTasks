
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the BlogRatings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogRatings_Insert]
(

	@RatingId int    OUTPUT,

	@BlogId int   ,

	@UserId int   ,

	@Point int   
)
AS


				
				INSERT INTO [dbo].[BlogRatings]
					(
					[BlogId]
					,[UserId]
					,[Point]
					)
				VALUES
					(
					@BlogId
					,@UserId
					,@Point
					)
				
				-- Get the identity value
				SET @RatingId = SCOPE_IDENTITY()