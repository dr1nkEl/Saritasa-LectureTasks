
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Emails table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_GetByEmailID]
(

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
					[emailID] = @EmailID
				SELECT @@ROWCOUNT