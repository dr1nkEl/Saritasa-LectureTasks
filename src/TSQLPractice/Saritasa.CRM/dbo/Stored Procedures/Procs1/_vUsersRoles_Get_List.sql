
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vUsersRoles view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vUsersRoles_Get_List

AS


				
				SELECT
					[userID],
					[firstName],
					[lastName],
					[title],
					[generalStatusId],
					[typeID],
					[documentID],
					[userRoleID],
					[roleID],
					[roleName],
					[login],
					[password],
					[email],
					[securityAnswer],
					[securityQuestion],
					[lastActivity],
					[isApproved],
					[isLocked],
					[isOnline],
					[authID],
					[fullName],
					[birthday],
					[timeZone],
					[timeZoneCode]
				FROM
					[dbo].[_vUsersRoles]
					
				SELECT @@ROWCOUNT			
			


