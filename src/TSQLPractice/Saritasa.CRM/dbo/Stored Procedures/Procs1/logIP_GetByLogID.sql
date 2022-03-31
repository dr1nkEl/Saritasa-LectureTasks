
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LogIP table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_GetByLogID]
(

	@LogID bigint   
)
AS


				SELECT
					[logID],
					[IP],
					[Date],
					[Login],
					[UserId],
					[Reason],
					[Clear],
					[ApplicationId]
				FROM
					[dbo].[LogIP]
				WHERE
					[logID] = @LogID
				SELECT @@ROWCOUNT