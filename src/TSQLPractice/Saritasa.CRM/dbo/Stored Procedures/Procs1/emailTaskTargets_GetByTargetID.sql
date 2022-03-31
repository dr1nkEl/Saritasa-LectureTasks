
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the EmailTaskTargets table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_GetByTargetID]
(

	@TargetId bigint   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[TaskId],
					[TargetId],
					[SprintId],
					[FeatureId]
				FROM
					[dbo].[EmailTaskTargets]
				WHERE
					[TargetId] = @TargetId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON