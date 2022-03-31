
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_Update]
(

	@TagID bigint   ,

	@Title varchar (255)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Tags]
				SET
					[Title] = @Title
				WHERE
[tagID] = @TagID