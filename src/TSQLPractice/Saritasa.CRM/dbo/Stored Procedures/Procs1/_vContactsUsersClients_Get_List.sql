
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vContactsUsersClients view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vContactsUsersClients_Get_List

AS


				
				SELECT
					[contactID],
					[userID],
					[clientID],
					[firstName],
					[lastName],
					[title],
					[UserDocID],
					[clientName],
					[clientDocID],
					[notes],
					[parentClientID],
					[website],
					[clientNote],
					[billable],
					[typeID],
					[generalStatusID],
					[created],
					[createdBy],
					[updated],
					[updatedBy],
					[deleted],
					[fullName],
					[birthday],
					[timeZone],
					[emailID],
					[email],
					[timeZoneCode]
				FROM
					[dbo].[_vContactsUsersClients]
					
				SELECT @@ROWCOUNT			
			


