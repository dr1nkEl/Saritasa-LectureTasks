/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the tasks_tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[tasks_tags_Delete]
(

	@Task_tagID bigint   
)
AS


				DELETE FROM [dbo].[tasks_tags] WITH (ROWLOCK) 
				WHERE
					[task_tagID] = @Task_tagID
