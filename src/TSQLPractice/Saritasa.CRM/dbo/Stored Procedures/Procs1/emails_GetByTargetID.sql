
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Emails table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_GetByTargetID]
(

	@TargetId bigint   
)
AS


				SELECT
					[emailID],
					[Email],
					[TargetId],
					[TypeId]
				FROM
					[dbo].[Emails]
				WHERE
					[TargetId] = @TargetId
				SELECT @@ROWCOUNT