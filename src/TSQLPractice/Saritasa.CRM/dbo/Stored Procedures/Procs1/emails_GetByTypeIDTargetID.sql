
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Emails table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_GetByTypeIDTargetID]
(

	@TypeId char (2)  ,

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
					[TypeId] = @TypeId
					AND [TargetId] = @TargetId
				SELECT @@ROWCOUNT