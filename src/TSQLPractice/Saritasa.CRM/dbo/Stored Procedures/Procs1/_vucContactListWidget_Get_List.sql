
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucContactListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucContactListWidget_Get_List

AS


				
				SELECT
					[contactID],
					[userID],
					[clientID],
					[firstName],
					[lastName],
					[title],
					[documentID],
					[phone],
					[fullName],
					[parentClientID],
					[clientName],
					[email]
				FROM
					[dbo].[_vucContactListWidget]
					
				SELECT @@ROWCOUNT			
			


