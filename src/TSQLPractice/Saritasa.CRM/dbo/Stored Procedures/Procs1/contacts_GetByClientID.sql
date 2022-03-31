
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Contacts table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_GetByClientID]
(

	@ClientId int   
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
					[ClientId] = @ClientId
				SELECT @@ROWCOUNT