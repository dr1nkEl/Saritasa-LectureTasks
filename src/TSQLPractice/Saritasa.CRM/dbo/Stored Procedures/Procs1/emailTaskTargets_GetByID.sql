
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the EmailTaskTargets table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_GetByID]
(

	@Id uniqueidentifier   
)
AS


				SELECT
					[Id],
					[TaskId],
					[TargetId],
					[SprintId],
					[FeatureId]
				FROM
					[dbo].[EmailTaskTargets]
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT