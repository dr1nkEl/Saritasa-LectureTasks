
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Tasks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_Delete]
(

	@TaskID bigint   
)
AS


				DELETE FROM [dbo].[Tasks] WITH (ROWLOCK) 
				WHERE
					[taskID] = @TaskID