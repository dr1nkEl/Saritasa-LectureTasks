
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectManagers view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vProjectManagers_Get_List

AS


				
				SELECT
					[managerID],
					[projectID],
					[roleID],
					[userID],
					[lastName],
					[firstName],
					[fullName],
					[documentID],
					[typeID],
					[emailID],
					[email],
					[birthday],
					[timeZone],
					[generalStatusID],
					[ProjectTitle],
					[title]
				FROM
					[dbo].[_vProjectManagers]
					
				SELECT @@ROWCOUNT			
			


