
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Contacts table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_GetByContactID]
(

	@ContactID int   
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
					[contactID] = @ContactID
				SELECT @@ROWCOUNT