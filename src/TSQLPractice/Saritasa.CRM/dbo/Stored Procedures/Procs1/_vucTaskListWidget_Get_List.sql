/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucTaskListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucTaskListWidget_Get_List]

AS


				
				SELECT
					[documentID],
					[taskPriority],
					[created],
					[deleted],
					[lastestReestimationId],
					[lastestReestimationLimitType],
					[lastestReestimationDueDateType],
					[lastestReestimationLimit],
					[lastestReestimationDueDate],
					[lastestReestimationStatus],
					[lastestReestimationUserId],
					[createdBy],
					[taskID],
					[CreateFullName],
					[statusName],
					[colorCode],
					[priority],
					[title],
					[targName],
					[targDocTypeID],
					[targGenStatuc],
					[createrLastName],
					[createrFirstName],
					[createrFillName],
					[svLastName],
					[svFirstName],
					[svFillName],
					[createrUserTypeID],
					[svUserTypeID],
					[trackType],
					[Overdue],
					[taskText],
					[finishDate],
					[svDocID],
					[CreaterDocID],
					[startDate],
					[datePushed],
					[targetObjectID],
					[TargDocId],
					[updated],
					[durationLimit],
					[generalStatusID],
					[billable],
					[clientID],
					[projectID],
					[projDocID],
					[menHours],
					[locationName],
					[locationUrl],
					[projectName],
					[testerID],
					[isContainer],
					[statusChanged],
					[taskLimit],
					[subTaskLimit],
					[skype],
					[email],
					[createrPhoto],
					[TaskTypeID],
					[developerUserID],
					[developerPhone],
					[developerEmail],
					[developerPhoto],
					[subTasksLimitOrTaskLimit],
					[technicalManagerID],
					[overtime],
					[sprintID],
					[featureID]
				FROM
					[dbo].[_vucTaskListWidget]
					
				SELECT @@ROWCOUNT
