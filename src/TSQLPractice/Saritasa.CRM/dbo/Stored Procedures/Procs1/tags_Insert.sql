
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_Insert]
(

	@TagID bigint    OUTPUT,

	@Title varchar (255)  
)
AS


				
				INSERT INTO [dbo].[Tags]
					(
					[Title]
					)
				VALUES
					(
					@Title
					)
				
				-- Get the identity value
				SET @TagID = SCOPE_IDENTITY()