
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTaskAssignedUsers view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vTaskAssignedUsers_Get_List

AS


				
				SELECT
					[taskAssignmentID],
					[userID],
					[taskID],
					[firstName],
					[lastName],
					[fullName],
					[documentID],
					[email],
					[emailID],
					[typeID],
					[assigned],
					[accepted],
					[started],
					[deleted],
					[assignedBy],
					[finishedWork],
					[birthday],
					[timeZone],
					[durationLimit],
					[madeother],
					[isBugFixing],
					[timeZoneCode]
				FROM
					[dbo].[_vTaskAssignedUsers]
					
				SELECT @@ROWCOUNT			
			


