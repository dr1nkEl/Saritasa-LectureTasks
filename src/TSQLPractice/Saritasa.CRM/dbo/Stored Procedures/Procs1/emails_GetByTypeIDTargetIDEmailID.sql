
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Emails table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_GetByTypeIDTargetIDEmailID]
(

	@TypeId char (2)  ,

	@TargetId bigint   ,

	@EmailID int   
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
					AND [emailID] = @EmailID
				SELECT @@ROWCOUNT