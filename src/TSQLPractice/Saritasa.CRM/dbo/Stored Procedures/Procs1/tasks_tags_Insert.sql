/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the tasks_tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[tasks_tags_Insert]
(

	@Task_tagID bigint    OUTPUT,

	@TagID bigint   ,

	@TaskID bigint   
)
AS


				
				INSERT INTO [dbo].[tasks_tags]
					(
					[tagID]
					,[taskID]
					)
				VALUES
					(
					@TagID
					,@TaskID
					)
				
				-- Get the identity value
				SET @Task_tagID = SCOPE_IDENTITY()
