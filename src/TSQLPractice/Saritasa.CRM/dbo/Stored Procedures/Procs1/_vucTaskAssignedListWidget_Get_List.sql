
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucTaskAssignedListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucTaskAssignedListWidget_Get_List

AS


				
				SELECT
					[taskAssignmentID],
					[assigned],
					[taskID],
					[userID],
					[assignedBy],
					[firstName],
					[fullName],
					[lastName],
					[email],
					[AssignerEmail],
					[AssignerFirstName],
					[AssignerLastName],
					[AssignerFullName],
					[UserDocID],
					[AssignDocID],
					[accepted],
					[startedWork],
					[started],
					[finishedWork],
					[duration],
					[durationLimit],
					[taskLimit],
					[subTaskLimit],
					[menHours],
					[madeother],
					[isBugFixing],
					[employeeID]
				FROM
					[dbo].[_vucTaskAssignedListWidget]
					
				SELECT @@ROWCOUNT			
			


