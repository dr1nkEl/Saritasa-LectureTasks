
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vUsers view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vUsers_Get_List

AS


				
				SELECT
					[Id],
					[firstName],
					[lastName],
					[title],
					[typeID],
					[documentID],
					[fullName],
					[emailID],
					[email],
					[birthday],
					[timeZone],
					[timeZoneCode],
					[generalStatusID],
					[utilization],
					[departmentID]
				FROM
					[dbo].[_vUsers]
					
				SELECT @@ROWCOUNT