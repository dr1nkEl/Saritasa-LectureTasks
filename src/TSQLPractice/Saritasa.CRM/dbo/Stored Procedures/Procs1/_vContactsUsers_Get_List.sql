
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vContactsUsers view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vContactsUsers_Get_List

AS


				
				SELECT
					[contactID],
					[userID],
					[clientID],
					[notes],
					[firstName],
					[lastName],
					[title],
					[typeID],
					[documentID],
					[created],
					[updated],
					[generalStatusID],
					[createdBy],
					[deleted],
					[name],
					[fullName],
					[updatedBy],
					[birthday],
					[timeZone],
					[emailID],
					[email],
					[timeZoneCode]
				FROM
					[dbo].[_vContactsUsers]
					
				SELECT @@ROWCOUNT			
			


