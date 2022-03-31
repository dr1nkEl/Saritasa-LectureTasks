
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the task_assigned table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_Delete
(

	@TaskAssignmentID int   
)
AS


				DELETE FROM [dbo].[task_assigned] WITH (ROWLOCK) 
				WHERE
					[taskAssignmentID] = @TaskAssignmentID
					
			


