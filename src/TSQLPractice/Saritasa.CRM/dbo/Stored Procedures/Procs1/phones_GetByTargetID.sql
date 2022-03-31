
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Phones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_GetByTargetID]
(

	@TargetId bigint   
)
AS


				SELECT
					[phoneID],
					[Phone],
					[TargetId],
					[TypeId]
				FROM
					[dbo].[Phones]
				WHERE
					[TargetId] = @TargetId
				SELECT @@ROWCOUNT