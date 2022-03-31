
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Projects table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_Get_List]

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
					
				SELECT @@ROWCOUNT