
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the task_departments table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_departments_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@DepartmentId int   = null ,

	@TaskId bigint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [departmentId]
	, [taskId]
    FROM
	[dbo].[task_departments]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([departmentId] = @DepartmentId OR @DepartmentId IS NULL)
	AND ([taskId] = @TaskId OR @TaskId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [departmentId]
	, [taskId]
    FROM
	[dbo].[task_departments]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([departmentId] = @DepartmentId AND @DepartmentId is not null)
	OR ([taskId] = @TaskId AND @TaskId is not null)
	SELECT @@ROWCOUNT			
  END
				


