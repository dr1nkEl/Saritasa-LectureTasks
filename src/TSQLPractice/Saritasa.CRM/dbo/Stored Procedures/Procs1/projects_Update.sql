
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Projects table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_Update]
(

	@ProjectID int   ,

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


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Projects]
				SET
					[StartDate] = @StartDate
					,[ProposedFinishDate] = @ProposedFinishDate
					,[DevSite] = @DevSite
					,[ActualSite] = @ActualSite
					,[ActualFinishDate] = @ActualFinishDate
					,[Description] = @Description
					,[Title] = @Title
					,[ParentProjectId] = @ParentProjectId
					,[Notes] = @Notes
					,[CompleteLine] = @CompleteLine
					,[DocumentId] = @DocumentId
					,[DiscountId] = @DiscountId
					,[UserId] = @UserId
					,[ClientId] = @ClientId
					,[Billable] = @Billable
					,[DurationLimit] = @DurationLimit
					,[MailMan] = @MailMan
					,[ShowClient] = @ShowClient
					,[Priority] = @Priority
					,[HasHosting] = @HasHosting
					,[HostingFee] = @HostingFee
					,[BillingType] = @BillingType
					,[Frequency] = @Frequency
					,[PriorityId] = @PriorityId
					,[HostingStart] = @HostingStart
					,[HostingFrequency] = @HostingFrequency
					,[LimitHistory] = @LimitHistory
					,[Send75Limit] = @Send75Limit
					,[SendLimitExceed] = @SendLimitExceed
					,[Send125Limit] = @Send125Limit
					,[Send150Limit] = @Send150Limit
					,[MobileAleas] = @MobileAleas
					,[MinHoursPerMonth] = @MinHoursPerMonth
					,[BillableMenHours] = @BillableMenHours
					,[NonBillableMenHours] = @NonBillableMenHours
					,[Utilization] = @Utilization
					,[BillingVariable] = @BillingVariable
					,[Overbudget] = @Overbudget
					,[DevelopmentStartDate] = @DevelopmentStartDate
					,[Launched] = @Launched
					,[DevelopmentStarted] = @DevelopmentStarted
					,[JiraAllowAddJobs] = @JiraAllowAddJobs
					,[IsMidProjectSurvey] = @IsMidProjectSurvey
					,[ZohoPotentialId] = @ZohoPotentialId
					,[EnvironmentCode] = @EnvironmentCode
					,[Nickname] = @Nickname
				WHERE
[projectID] = @ProjectID 
				
				
				-- Select computed columns into output parameters
				SELECT
 @MenHours = [MenHours]
				FROM
					[dbo].[Projects]
				WHERE
[projectID] = @ProjectID