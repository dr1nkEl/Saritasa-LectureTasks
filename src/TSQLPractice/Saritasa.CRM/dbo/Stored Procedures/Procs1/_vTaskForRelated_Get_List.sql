/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTaskForRelated view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vTaskForRelated_Get_List]

AS


				
				SELECT
					[documentID],
					[objectID],
					[typeID],
					[statusID],
					[name],
					[billable],
					[showClient],
					[taskDocID],
					[taskName],
					[taskID],
					[taskBillable],
					[isContainer],
					[mayAddJobs],
					[makeJobsBillable],
					[projectID],
					[projDocID],
					[projName],
					[projectBillable],
					[ParentTaskID],
					[ParentName],
					[clientID],
					[startDate],
					[finishDate],
					[projectOverbudget],
					[sprintID],
					[featureID]
				FROM
					[dbo].[_vTaskForRelated]
					
				SELECT @@ROWCOUNT
