
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Contacts table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_Get_List]

AS


				
				SELECT
					[contactID],
					[UserId],
					[ClientId],
					[Notes]
				FROM
					[dbo].[Contacts]
					
				SELECT @@ROWCOUNT