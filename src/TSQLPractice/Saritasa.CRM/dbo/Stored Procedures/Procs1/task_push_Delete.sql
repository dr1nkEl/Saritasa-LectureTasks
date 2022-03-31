
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the task_push table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_Delete
(

	@PushID bigint   
)
AS


				DELETE FROM [dbo].[task_push] WITH (ROWLOCK) 
				WHERE
					[pushID] = @PushID
					
			


