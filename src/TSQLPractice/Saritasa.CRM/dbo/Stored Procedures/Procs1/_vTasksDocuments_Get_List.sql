/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTasksDocuments view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vTasksDocuments_Get_List]

AS


				
				SELECT
					[taskID],
					[typeID],
					[documentID],
					[taskText],
					[targetID],
					[created],
					[lastestReestimationId],
					[lastestReestimationLimitType],
					[lastestReestimationDueDateType],
					[lastestReestimationLimit],
					[lastestReestimationDueDate],
					[lastestReestimationStatus],
					[lastestReestimationUserId],
					[updated],
					[deleted],
					[generalStatusID],
					[createdBy],
					[name],
					[priority],
					[updatedBy],
					[statusName],
					[title],
					[finishDate],
					[startDate],
					[colorCode],
					[trackType],
					[billable],
					[clientID],
					[projectID],
					[durationLimit],
					[menHours],
					[projectName],
					[testerID],
					[isContainer],
					[mayAddJobs],
					[departmentID],
					[departmentName],
					[ownerID],
					[typeName],
					[technicalManagerID],
					[taskPriority],
					[sprintID],
					[featureID],
					[currentPushID],
					[taskPushDate]
				FROM
					[dbo].[_vTasksDocuments]
					
				SELECT @@ROWCOUNT
