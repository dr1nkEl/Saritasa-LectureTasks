
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_departments table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_GetByTaskId
(

	@TaskId bigint   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[departmentId],
					[taskId]
				FROM
					[dbo].[task_departments]
				WHERE
					[taskId] = @TaskId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


