
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the EmailTaskTargets table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_Find]
(

	@SearchUsingOR bit   = null ,

	@Id uniqueidentifier   = null ,

	@TaskId bigint   = null ,

	@TargetId bigint   = null ,

	@SprintId int   = null ,

	@FeatureId int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [TaskId]
	, [TargetId]
	, [SprintId]
	, [FeatureId]
    FROM
	[dbo].[EmailTaskTargets]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([TaskId] = @TaskId OR @TaskId IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([SprintId] = @SprintId OR @SprintId IS NULL)
	AND ([FeatureId] = @FeatureId OR @FeatureId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [TaskId]
	, [TargetId]
	, [SprintId]
	, [FeatureId]
    FROM
	[dbo].[EmailTaskTargets]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([TaskId] = @TaskId AND @TaskId is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([SprintId] = @SprintId AND @SprintId is not null)
	OR ([FeatureId] = @FeatureId AND @FeatureId is not null)
	SELECT @@ROWCOUNT			
  END