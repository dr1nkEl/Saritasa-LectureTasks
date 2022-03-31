
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the task_reestimations table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_Delete
(

	@ID bigint   
)
AS


				DELETE FROM [dbo].[task_reestimations] WITH (ROWLOCK) 
				WHERE
					[ID] = @ID
					
			


