/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vEmployeesUsersRoles view
----------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE dbo._vEmployeesUsersRoles_Get_List

AS


				
				SELECT
					[UserId],
					[firstName],
					[lastName],
					[title],
					[email],
					[typeID],
					[documentID],
					[userRoleID],
					[roleID],
					[roleCreated],
					[roleName],
					[fullName]
				FROM
					[dbo].[_vEmployeesUsersRoles]
					
				SELECT @@ROWCOUNT