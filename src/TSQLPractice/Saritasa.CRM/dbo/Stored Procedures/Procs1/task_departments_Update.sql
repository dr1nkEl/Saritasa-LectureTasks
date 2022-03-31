
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the task_departments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_Update
(

	@Id int   ,

	@DepartmentId int   ,

	@TaskId bigint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[task_departments]
				SET
					[departmentId] = @DepartmentId
					,[taskId] = @TaskId
				WHERE
[Id] = @Id 
				
			


