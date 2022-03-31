
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Contacts table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_Delete]
(

	@ContactID int   
)
AS


				DELETE FROM [dbo].[Contacts] WITH (ROWLOCK) 
				WHERE
					[contactID] = @ContactID