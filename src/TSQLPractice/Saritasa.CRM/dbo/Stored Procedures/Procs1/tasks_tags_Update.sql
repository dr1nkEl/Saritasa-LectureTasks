/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the tasks_tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[tasks_tags_Update]
(

	@Task_tagID bigint   ,

	@TagID bigint   ,

	@TaskID bigint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[tasks_tags]
				SET
					[tagID] = @TagID
					,[taskID] = @TaskID
				WHERE
[task_tagID] = @Task_tagID
