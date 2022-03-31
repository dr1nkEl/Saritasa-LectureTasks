
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Contacts table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_GetByUserID]
(

	@UserId int   
)
AS


				SELECT
					[contactID],
					[UserId],
					[ClientId],
					[Notes]
				FROM
					[dbo].[Contacts]
				WHERE
					[UserId] = @UserId
				SELECT @@ROWCOUNT