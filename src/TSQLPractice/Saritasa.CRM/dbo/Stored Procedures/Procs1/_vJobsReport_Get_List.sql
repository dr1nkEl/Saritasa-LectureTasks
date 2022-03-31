
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vJobsReport view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsReport_Get_List

AS


				
				SELECT
					[jobID],
					[targetID],
					[duration],
					[description],
					[billable],
					[jobDate],
					[workType],
					[clientID],
					[clientName],
					[projectID],
					[projectName],
					[projectBillingType],
					[projectFrequency],
					[projectUtilization],
					[projectPriority],
					[projectPriotityColor],
					[targName],
					[targDocTypeId],
					[targetObjectId],
					[overtime],
					[isError],
					[errorBy],
					[errorReason],
					[errorCreatorName],
					[errorCreatorPhoto],
					[creatorID],
					[creatorName],
					[creatorEmail],
					[creatorUtilization],
					[creatorBrancID],
					[departmentID],
					[jobType],
					[WorklogType],
					[creatorCreated],
					[creatorTaskDuration],
					[creatorTaskLimit],
					[taskStatusID],
					[outsorserClientID],
					[outsorserName],
					[projectBillable],
					[featureName],
					[sprintName]
				FROM
					[dbo].[_vJobsReport]
					
				SELECT @@ROWCOUNT