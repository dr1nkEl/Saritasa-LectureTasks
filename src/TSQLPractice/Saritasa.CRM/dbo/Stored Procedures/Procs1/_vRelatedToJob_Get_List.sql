/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vRelatedToJob view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vRelatedToJob_Get_List]

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
					[projectStatusID],
					[projectBillable],
					[ParentTaskID],
					[ParentName],
					[clientID],
					[startDate],
					[finishDate],
					[projectOverbudget]
				FROM
					[dbo].[_vRelatedToJob]
					
				SELECT @@ROWCOUNT
