
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_departments table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_GetById
(

	@Id int   
)
AS


				SELECT
					[Id],
					[departmentId],
					[taskId]
				FROM
					[dbo].[task_departments]
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT
					
			


