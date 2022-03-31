
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the task_departments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_Get_List

AS


				
				SELECT
					[Id],
					[departmentId],
					[taskId]
				FROM
					[dbo].[task_departments]
					
				SELECT @@ROWCOUNT
			


