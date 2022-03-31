
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the JiraMapping table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.JiraMapping_Get_List

AS


				
				SELECT
					[Id],
					[TypeId],
					[SourceId],
					[DestinationId],
					[Instance],
					[LastUpdateTimestamp]
				FROM
					[dbo].[JiraMapping]
					
				SELECT @@ROWCOUNT