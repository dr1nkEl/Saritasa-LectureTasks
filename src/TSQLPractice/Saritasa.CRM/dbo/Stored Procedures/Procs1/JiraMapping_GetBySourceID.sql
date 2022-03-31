
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the JiraMapping table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[JiraMapping_GetBySourceID]
(

	@SourceId bigint   
)
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
				WHERE
					[SourceId] = @SourceId
				SELECT @@ROWCOUNT