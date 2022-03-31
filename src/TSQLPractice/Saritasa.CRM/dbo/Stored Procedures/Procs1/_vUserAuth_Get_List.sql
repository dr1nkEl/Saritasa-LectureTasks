/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vUserAuth view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vUserAuth_Get_List]

AS


				
				SELECT
					[authID],
					[userID],
					[login],
					[password],
					[email],
					[securityQuestion],
					[securityAnswer],
					[lastActivity],
					[isApproved],
					[isLocked],
					[isOnline],
					[ldapLogin],
					[title],
					[typeID],
					[documentID],
					[firstName],
					[lastName],
					[fullName],
					[birthday],
					[timeZone],
					[wrongPassword],
					[timeZoneCode]
				FROM
					[dbo].[_vUserAuth]
					
				SELECT @@ROWCOUNT
