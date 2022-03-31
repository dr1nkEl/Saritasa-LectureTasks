
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the task_departments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_Insert
(

	@Id int    OUTPUT,

	@DepartmentId int   ,

	@TaskId bigint   
)
AS


				
				INSERT INTO [dbo].[task_departments]
					(
					[departmentId]
					,[taskId]
					)
				VALUES
					(
					@DepartmentId
					,@TaskId
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()
									
							
			


