
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the task_departments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[task_departments] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id
					
			


