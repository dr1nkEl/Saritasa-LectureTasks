
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucProjectStatusReportListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucProjectStatusReportListWidget_Get_List

AS


				
				SELECT
					[ProjectId],
					[ProjectName],
					[DurationLimit],
					[MinHoursPerMonth],
					[StartDate],
					[ProposedFinishDate],
					[MenHours],
					[BillableMenHours],
					[NonBillableMenHours],
					[BillingType],
					[PriorityId],
					[Frequency],
					[Notes],
					[ClientDocumentId],
					[ClientId],
					[ClientName],
					[ClientContractTill],
					[ProjectManagersUserIdsList],
					[WorkAllocationCurrentMonth],
					[WorkAllocationNextMonth],
					[TotalMonthJobs],
					[BillibleMonthJobs],
					[StatusId],
					[NotPaidMilestonesCount],
					[AccountManagerName],
					[AccountManagerDocumentID],
					[AccountManagerEmail],
					[AccountManagerSkype],
					[AccountManagerPhoto],
					[DevelopmentStartDate],
					[DevelopmentStarted],
					[ReviewName],
					[ReviewRating],
					[ReviewDate],
					[ReviewerName],
					[ReviewerUserId],
					[LastReviewName],
					[LastReviewRating],
					[LastReviewDate],
					[LastReviewerName],
					[LastReviewerUserId],
					[IsMidProjectSurvey],
					[LastMilestoneId],
					[LastMilestoneActualReleaseDate],
					[LastMilestoneName],
					[LastMilestoneReleaseVersion],
					[NextMilestoneId],
					[NextMilestoneActualReleaseDate],
					[NextMilestoneName],
					[NextMilestoneReleaseVersion]
				FROM
					[dbo].[_vucProjectStatusReportListWidget]
					
				SELECT @@ROWCOUNT