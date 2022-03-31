/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucProjectListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucProjectListWidget_Get_List]

AS


				
				SELECT
					[projectID],
					[title],
					[durationLimit],
					[MinHoursPerMonth],
					[proposedFinishDate],
					[startDate],
					[menHours],
					[billableMenHours],
					[nonbillableMenHours],
					[clientDocID],
					[clientID],
					[clientName],
					[parentClientID],
					[contactUserID],
					[contactFullName],
					[contactDocID],
					[documentID],
					[generalStatusID],
					[created],
					[createdBy],
					[colorCode],
					[statusName],
					[TManagerUserID],
					[SManagerUserID],
					[tasks],
					[pManagersUserIdList],
					[pMmanagersDocIdList],
					[utilization],
					[TotalJobsForMonth],
					[TotalJobsForPrevMonth],
					[TotalJobsForNextMonth],
					[WorkAllocationCurrentMonth],
					[WorkAllocationPrevMonth],
					[WorkAllocationNextMonth],
					[currentDate],
					[developmentStartDate],
					[developmentStarted],
					[reviewName],
					[reviewRating],
					[reviewDate],
					[reviewerName],
					[reviewerUserID],
					[lastReviewName],
					[lastReviewRating],
					[lastReviewDate],
					[lastReviewerName],
					[lastReviewerUserID],
					[CurrentMonthAmplification],
					[PreviousMonthAmplification]
				FROM
					[dbo].[_vucProjectListWidget]
					
				SELECT @@ROWCOUNT
