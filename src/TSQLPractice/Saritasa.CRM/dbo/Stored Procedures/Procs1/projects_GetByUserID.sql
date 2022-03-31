
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Projects table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_GetByUserID]
(

	@UserId int   
)
AS


				SELECT
					[projectID],
					[StartDate],
					[ProposedFinishDate],
					[DevSite],
					[ActualSite],
					[ActualFinishDate],
					[Description],
					[Title],
					[ParentProjectId],
					[Notes],
					[CompleteLine],
					[DocumentId],
					[DiscountId],
					[UserId],
					[ClientId],
					[Billable],
					[DurationLimit],
					[MailMan],
					[ShowClient],
					[Priority],
					[HasHosting],
					[HostingFee],
					[BillingType],
					[Frequency],
					[PriorityId],
					[HostingStart],
					[HostingFrequency],
					[LimitHistory],
					[Send75Limit],
					[SendLimitExceed],
					[Send125Limit],
					[Send150Limit],
					[MobileAleas],
					[MinHoursPerMonth],
					[BillableMenHours],
					[NonBillableMenHours],
					[Utilization],
					[BillingVariable],
					[Overbudget],
					[DevelopmentStartDate],
					[Launched],
					[DevelopmentStarted],
					[JiraAllowAddJobs],
					[IsMidProjectSurvey],
					[MenHours],
					[ZohoPotentialId],
					[EnvironmentCode],
					[Nickname]
				FROM
					[dbo].[Projects]
				WHERE
					[UserId] = @UserId
				SELECT @@ROWCOUNT