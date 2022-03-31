
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Projects table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_Insert]
(

	@ProjectID int    OUTPUT,

	@StartDate datetime   ,

	@ProposedFinishDate datetime   ,

	@DevSite varchar (255)  ,

	@ActualSite varchar (255)  ,

	@ActualFinishDate datetime   ,

	@Description varchar (3000)  ,

	@Title varchar (100)  ,

	@ParentProjectId int   ,

	@Notes varchar (MAX)  ,

	@CompleteLine tinyint   ,

	@DocumentId bigint   ,

	@DiscountId int   ,

	@UserId int   ,

	@ClientId int   ,

	@Billable bit   ,

	@DurationLimit int   ,

	@MailMan varchar (100)  ,

	@ShowClient bit   ,

	@Priority char (1)  ,

	@HasHosting bit   ,

	@HostingFee decimal (9, 2)  ,

	@BillingType char (1)  ,

	@Frequency varchar (3)  ,

	@PriorityId int   ,

	@HostingStart datetime   ,

	@HostingFrequency varchar (3)  ,

	@LimitHistory varchar (3000)  ,

	@Send75Limit bit   ,

	@SendLimitExceed bit   ,

	@Send125Limit bit   ,

	@Send150Limit bit   ,

	@MobileAleas varchar (50)  ,

	@MinHoursPerMonth int   ,

	@BillableMenHours int   ,

	@NonBillableMenHours int   ,

	@Utilization bit   ,

	@BillingVariable bit   ,

	@Overbudget bit   ,

	@DevelopmentStartDate datetime   ,

	@Launched bit   ,

	@DevelopmentStarted bit   ,

	@JiraAllowAddJobs bit   ,

	@IsMidProjectSurvey bit   ,

	@MenHours int    OUTPUT,

	@ZohoPotentialId bigint   ,

	@EnvironmentCode varchar (50)  ,

	@Nickname varchar (100)  
)
AS


				
				INSERT INTO [dbo].[Projects]
					(
					[StartDate]
					,[ProposedFinishDate]
					,[DevSite]
					,[ActualSite]
					,[ActualFinishDate]
					,[Description]
					,[Title]
					,[ParentProjectId]
					,[Notes]
					,[CompleteLine]
					,[DocumentId]
					,[DiscountId]
					,[UserId]
					,[ClientId]
					,[Billable]
					,[DurationLimit]
					,[MailMan]
					,[ShowClient]
					,[Priority]
					,[HasHosting]
					,[HostingFee]
					,[BillingType]
					,[Frequency]
					,[PriorityId]
					,[HostingStart]
					,[HostingFrequency]
					,[LimitHistory]
					,[Send75Limit]
					,[SendLimitExceed]
					,[Send125Limit]
					,[Send150Limit]
					,[MobileAleas]
					,[MinHoursPerMonth]
					,[BillableMenHours]
					,[NonBillableMenHours]
					,[Utilization]
					,[BillingVariable]
					,[Overbudget]
					,[DevelopmentStartDate]
					,[Launched]
					,[DevelopmentStarted]
					,[JiraAllowAddJobs]
					,[IsMidProjectSurvey]
					,[ZohoPotentialId]
					,[EnvironmentCode]
					,[Nickname]
					)
				VALUES
					(
					@StartDate
					,@ProposedFinishDate
					,@DevSite
					,@ActualSite
					,@ActualFinishDate
					,@Description
					,@Title
					,@ParentProjectId
					,@Notes
					,@CompleteLine
					,@DocumentId
					,@DiscountId
					,@UserId
					,@ClientId
					,@Billable
					,@DurationLimit
					,@MailMan
					,@ShowClient
					,@Priority
					,@HasHosting
					,@HostingFee
					,@BillingType
					,@Frequency
					,@PriorityId
					,@HostingStart
					,@HostingFrequency
					,@LimitHistory
					,@Send75Limit
					,@SendLimitExceed
					,@Send125Limit
					,@Send150Limit
					,@MobileAleas
					,@MinHoursPerMonth
					,@BillableMenHours
					,@NonBillableMenHours
					,@Utilization
					,@BillingVariable
					,@Overbudget
					,@DevelopmentStartDate
					,@Launched
					,@DevelopmentStarted
					,@JiraAllowAddJobs
					,@IsMidProjectSurvey
					,@ZohoPotentialId
					,@EnvironmentCode
					,@Nickname
					)
				
				-- Get the identity value
				SET @ProjectID = SCOPE_IDENTITY()
									
				-- Select computed columns into output parameters
				SELECT
 @MenHours = [MenHours]
				FROM
					[dbo].[Projects]
				WHERE
[projectID] = @ProjectID