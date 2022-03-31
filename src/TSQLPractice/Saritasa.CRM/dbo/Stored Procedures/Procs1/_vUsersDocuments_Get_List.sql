
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vUsersDocuments view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vUsersDocuments_Get_List

AS


				
				SELECT
					[Id],
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
					[timeZoneCode],
					[notes],
					[utilization]
				FROM
					[dbo].[_vUsersDocuments]
					
				SELECT @@ROWCOUNT