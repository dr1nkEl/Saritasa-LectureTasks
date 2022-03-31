
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Emails table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_GetByTypeID]
(

	@TypeId char (2)  
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
				SELECT @@ROWCOUNT