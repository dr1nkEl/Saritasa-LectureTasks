
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vJobsTarget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsTarget_Get_List

AS


				
				SELECT
					[clientID],
					[clientName],
					[clientDocID],
					[projectID],
					[projName],
					[projDocID],
					[jobID],
					[billable],
					[description],
					[JobType],
					[duration],
					[targetID],
					[createdBy],
					[targName],
					[targDocTypeId],
					[targetobjectId],
					[userID],
					[fullName],
					[userDocID],
					[date],
					[JobDate],
					[birthday],
					[timeZone],
					[taskID],
					[TaskTargetID],
					[isError],
					[errorBy],
					[errorReason],
					[EmployeeId],
					[hasHosting],
					[hostingFee],
					[hostingStart],
					[hostingFrequency],
					[workTypeID],
					[workTypeName],
					[projectBillable],
					[taskBillable],
					[clientBillable],
					[makeJobsBillable],
					[DepartmentId],
					[featureID],
					[sprintID],
					[featureName],
					[sprintName],
					[DedicatedResource],
					[TaskTagName]
				FROM
					[dbo].[_vJobsTarget]
					
				SELECT @@ROWCOUNT