
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the EmailTaskTargets table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_Insert]
(

	@Id uniqueidentifier   ,

	@TaskId bigint   ,

	@TargetId bigint   ,

	@SprintId int   ,

	@FeatureId int   
)
AS


				
				INSERT INTO [dbo].[EmailTaskTargets]
					(
					[Id]
					,[TaskId]
					,[TargetId]
					,[SprintId]
					,[FeatureId]
					)
				VALUES
					(
					@Id
					,@TaskId
					,@TargetId
					,@SprintId
					,@FeatureId
					)