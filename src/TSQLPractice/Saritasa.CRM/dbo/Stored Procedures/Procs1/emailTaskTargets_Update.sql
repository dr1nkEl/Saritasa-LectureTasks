
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the EmailTaskTargets table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_Update]
(

	@Id uniqueidentifier   ,

	@OriginalId uniqueidentifier   ,

	@TaskId bigint   ,

	@TargetId bigint   ,

	@SprintId int   ,

	@FeatureId int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[EmailTaskTargets]
				SET
					[Id] = @Id
					,[TaskId] = @TaskId
					,[TargetId] = @TargetId
					,[SprintId] = @SprintId
					,[FeatureId] = @FeatureId
				WHERE
[Id] = @OriginalId