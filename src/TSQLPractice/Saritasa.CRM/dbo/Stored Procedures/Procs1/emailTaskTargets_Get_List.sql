
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the EmailTaskTargets table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_Get_List]

AS


				
				SELECT
					[Id],
					[TaskId],
					[TargetId],
					[SprintId],
					[FeatureId]
				FROM
					[dbo].[EmailTaskTargets]
					
				SELECT @@ROWCOUNT