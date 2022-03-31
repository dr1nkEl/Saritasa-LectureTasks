/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vAllRelatedTo view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vAllRelatedTo_Get_List]

AS


				
				SELECT
					[documentID],
					[objectID],
					[typeID],
					[statusID],
					[name],
					[taskDocID],
					[taskName],
					[taskID],
					[projectID],
					[projDocID],
					[projName],
					[clientID],
					[clientDocID],
					[clientName],
					[billable],
					[taskBillable],
					[projectBillable],
					[clientBillable],
					[isContainer],
					[mayAddJobs],
					[ParentTaskID],
					[ParentName],
					[projectShowClient],
					[makeJobsBillable],
					[startDate],
					[finishDate],
					[subTaskLimit],
					[taskLimit],
					[projectOverbudget],
					[sprintID],
					[featureID]
				FROM
					[dbo].[_vAllRelatedTo]
					
				SELECT @@ROWCOUNT
