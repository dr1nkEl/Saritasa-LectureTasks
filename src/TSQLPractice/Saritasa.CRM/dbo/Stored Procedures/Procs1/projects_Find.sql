
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Projects table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_Find]
(

	@SearchUsingOR bit   = null ,

	@ProjectID int   = null ,

	@StartDate datetime   = null ,

	@ProposedFinishDate datetime   = null ,

	@DevSite varchar (255)  = null ,

	@ActualSite varchar (255)  = null ,

	@ActualFinishDate datetime   = null ,

	@Description varchar (3000)  = null ,

	@Title varchar (100)  = null ,

	@ParentProjectId int   = null ,

	@Notes varchar (MAX)  = null ,

	@CompleteLine tinyint   = null ,

	@DocumentId bigint   = null ,

	@DiscountId int   = null ,

	@UserId int   = null ,

	@ClientId int   = null ,

	@Billable bit   = null ,

	@DurationLimit int   = null ,

	@MailMan varchar (100)  = null ,

	@ShowClient bit   = null ,

	@Priority char (1)  = null ,

	@HasHosting bit   = null ,

	@HostingFee decimal (9, 2)  = null ,

	@BillingType char (1)  = null ,

	@Frequency varchar (3)  = null ,

	@PriorityId int   = null ,

	@HostingStart datetime   = null ,

	@HostingFrequency varchar (3)  = null ,

	@LimitHistory varchar (3000)  = null ,

	@Send75Limit bit   = null ,

	@SendLimitExceed bit   = null ,

	@Send125Limit bit   = null ,

	@Send150Limit bit   = null ,

	@MobileAleas varchar (50)  = null ,

	@MinHoursPerMonth int   = null ,

	@BillableMenHours int   = null ,

	@NonBillableMenHours int   = null ,

	@Utilization bit   = null ,

	@BillingVariable bit   = null ,

	@Overbudget bit   = null ,

	@DevelopmentStartDate datetime   = null ,

	@Launched bit   = null ,

	@DevelopmentStarted bit   = null ,

	@JiraAllowAddJobs bit   = null ,

	@IsMidProjectSurvey bit   = null ,

	@MenHours int   = null ,

	@ZohoPotentialId bigint   = null ,

	@EnvironmentCode varchar (50)  = null ,

	@Nickname varchar (100)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [projectID]
	, [StartDate]
	, [ProposedFinishDate]
	, [DevSite]
	, [ActualSite]
	, [ActualFinishDate]
	, [Description]
	, [Title]
	, [ParentProjectId]
	, [Notes]
	, [CompleteLine]
	, [DocumentId]
	, [DiscountId]
	, [UserId]
	, [ClientId]
	, [Billable]
	, [DurationLimit]
	, [MailMan]
	, [ShowClient]
	, [Priority]
	, [HasHosting]
	, [HostingFee]
	, [BillingType]
	, [Frequency]
	, [PriorityId]
	, [HostingStart]
	, [HostingFrequency]
	, [LimitHistory]
	, [Send75Limit]
	, [SendLimitExceed]
	, [Send125Limit]
	, [Send150Limit]
	, [MobileAleas]
	, [MinHoursPerMonth]
	, [BillableMenHours]
	, [NonBillableMenHours]
	, [Utilization]
	, [BillingVariable]
	, [Overbudget]
	, [DevelopmentStartDate]
	, [Launched]
	, [DevelopmentStarted]
	, [JiraAllowAddJobs]
	, [IsMidProjectSurvey]
	, [MenHours]
	, [ZohoPotentialId]
	, [EnvironmentCode]
	, [Nickname]
    FROM
	[dbo].[Projects]
    WHERE 
	 ([projectID] = @ProjectID OR @ProjectID IS NULL)
	AND ([StartDate] = @StartDate OR @StartDate IS NULL)
	AND ([ProposedFinishDate] = @ProposedFinishDate OR @ProposedFinishDate IS NULL)
	AND ([DevSite] = @DevSite OR @DevSite IS NULL)
	AND ([ActualSite] = @ActualSite OR @ActualSite IS NULL)
	AND ([ActualFinishDate] = @ActualFinishDate OR @ActualFinishDate IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([Title] = @Title OR @Title IS NULL)
	AND ([ParentProjectId] = @ParentProjectId OR @ParentProjectId IS NULL)
	AND ([Notes] = @Notes OR @Notes IS NULL)
	AND ([CompleteLine] = @CompleteLine OR @CompleteLine IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([DiscountId] = @DiscountId OR @DiscountId IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([ClientId] = @ClientId OR @ClientId IS NULL)
	AND ([Billable] = @Billable OR @Billable IS NULL)
	AND ([DurationLimit] = @DurationLimit OR @DurationLimit IS NULL)
	AND ([MailMan] = @MailMan OR @MailMan IS NULL)
	AND ([ShowClient] = @ShowClient OR @ShowClient IS NULL)
	AND ([Priority] = @Priority OR @Priority IS NULL)
	AND ([HasHosting] = @HasHosting OR @HasHosting IS NULL)
	AND ([HostingFee] = @HostingFee OR @HostingFee IS NULL)
	AND ([BillingType] = @BillingType OR @BillingType IS NULL)
	AND ([Frequency] = @Frequency OR @Frequency IS NULL)
	AND ([PriorityId] = @PriorityId OR @PriorityId IS NULL)
	AND ([HostingStart] = @HostingStart OR @HostingStart IS NULL)
	AND ([HostingFrequency] = @HostingFrequency OR @HostingFrequency IS NULL)
	AND ([LimitHistory] = @LimitHistory OR @LimitHistory IS NULL)
	AND ([Send75Limit] = @Send75Limit OR @Send75Limit IS NULL)
	AND ([SendLimitExceed] = @SendLimitExceed OR @SendLimitExceed IS NULL)
	AND ([Send125Limit] = @Send125Limit OR @Send125Limit IS NULL)
	AND ([Send150Limit] = @Send150Limit OR @Send150Limit IS NULL)
	AND ([MobileAleas] = @MobileAleas OR @MobileAleas IS NULL)
	AND ([MinHoursPerMonth] = @MinHoursPerMonth OR @MinHoursPerMonth IS NULL)
	AND ([BillableMenHours] = @BillableMenHours OR @BillableMenHours IS NULL)
	AND ([NonBillableMenHours] = @NonBillableMenHours OR @NonBillableMenHours IS NULL)
	AND ([Utilization] = @Utilization OR @Utilization IS NULL)
	AND ([BillingVariable] = @BillingVariable OR @BillingVariable IS NULL)
	AND ([Overbudget] = @Overbudget OR @Overbudget IS NULL)
	AND ([DevelopmentStartDate] = @DevelopmentStartDate OR @DevelopmentStartDate IS NULL)
	AND ([Launched] = @Launched OR @Launched IS NULL)
	AND ([DevelopmentStarted] = @DevelopmentStarted OR @DevelopmentStarted IS NULL)
	AND ([JiraAllowAddJobs] = @JiraAllowAddJobs OR @JiraAllowAddJobs IS NULL)
	AND ([IsMidProjectSurvey] = @IsMidProjectSurvey OR @IsMidProjectSurvey IS NULL)
	AND ([MenHours] = @MenHours OR @MenHours IS NULL)
	AND ([ZohoPotentialId] = @ZohoPotentialId OR @ZohoPotentialId IS NULL)
	AND ([EnvironmentCode] = @EnvironmentCode OR @EnvironmentCode IS NULL)
	AND ([Nickname] = @Nickname OR @Nickname IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [projectID]
	, [StartDate]
	, [ProposedFinishDate]
	, [DevSite]
	, [ActualSite]
	, [ActualFinishDate]
	, [Description]
	, [Title]
	, [ParentProjectId]
	, [Notes]
	, [CompleteLine]
	, [DocumentId]
	, [DiscountId]
	, [UserId]
	, [ClientId]
	, [Billable]
	, [DurationLimit]
	, [MailMan]
	, [ShowClient]
	, [Priority]
	, [HasHosting]
	, [HostingFee]
	, [BillingType]
	, [Frequency]
	, [PriorityId]
	, [HostingStart]
	, [HostingFrequency]
	, [LimitHistory]
	, [Send75Limit]
	, [SendLimitExceed]
	, [Send125Limit]
	, [Send150Limit]
	, [MobileAleas]
	, [MinHoursPerMonth]
	, [BillableMenHours]
	, [NonBillableMenHours]
	, [Utilization]
	, [BillingVariable]
	, [Overbudget]
	, [DevelopmentStartDate]
	, [Launched]
	, [DevelopmentStarted]
	, [JiraAllowAddJobs]
	, [IsMidProjectSurvey]
	, [MenHours]
	, [ZohoPotentialId]
	, [EnvironmentCode]
	, [Nickname]
    FROM
	[dbo].[Projects]
    WHERE 
	 ([projectID] = @ProjectID AND @ProjectID is not null)
	OR ([StartDate] = @StartDate AND @StartDate is not null)
	OR ([ProposedFinishDate] = @ProposedFinishDate AND @ProposedFinishDate is not null)
	OR ([DevSite] = @DevSite AND @DevSite is not null)
	OR ([ActualSite] = @ActualSite AND @ActualSite is not null)
	OR ([ActualFinishDate] = @ActualFinishDate AND @ActualFinishDate is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([Title] = @Title AND @Title is not null)
	OR ([ParentProjectId] = @ParentProjectId AND @ParentProjectId is not null)
	OR ([Notes] = @Notes AND @Notes is not null)
	OR ([CompleteLine] = @CompleteLine AND @CompleteLine is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([DiscountId] = @DiscountId AND @DiscountId is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([ClientId] = @ClientId AND @ClientId is not null)
	OR ([Billable] = @Billable AND @Billable is not null)
	OR ([DurationLimit] = @DurationLimit AND @DurationLimit is not null)
	OR ([MailMan] = @MailMan AND @MailMan is not null)
	OR ([ShowClient] = @ShowClient AND @ShowClient is not null)
	OR ([Priority] = @Priority AND @Priority is not null)
	OR ([HasHosting] = @HasHosting AND @HasHosting is not null)
	OR ([HostingFee] = @HostingFee AND @HostingFee is not null)
	OR ([BillingType] = @BillingType AND @BillingType is not null)
	OR ([Frequency] = @Frequency AND @Frequency is not null)
	OR ([PriorityId] = @PriorityId AND @PriorityId is not null)
	OR ([HostingStart] = @HostingStart AND @HostingStart is not null)
	OR ([HostingFrequency] = @HostingFrequency AND @HostingFrequency is not null)
	OR ([LimitHistory] = @LimitHistory AND @LimitHistory is not null)
	OR ([Send75Limit] = @Send75Limit AND @Send75Limit is not null)
	OR ([SendLimitExceed] = @SendLimitExceed AND @SendLimitExceed is not null)
	OR ([Send125Limit] = @Send125Limit AND @Send125Limit is not null)
	OR ([Send150Limit] = @Send150Limit AND @Send150Limit is not null)
	OR ([MobileAleas] = @MobileAleas AND @MobileAleas is not null)
	OR ([MinHoursPerMonth] = @MinHoursPerMonth AND @MinHoursPerMonth is not null)
	OR ([BillableMenHours] = @BillableMenHours AND @BillableMenHours is not null)
	OR ([NonBillableMenHours] = @NonBillableMenHours AND @NonBillableMenHours is not null)
	OR ([Utilization] = @Utilization AND @Utilization is not null)
	OR ([BillingVariable] = @BillingVariable AND @BillingVariable is not null)
	OR ([Overbudget] = @Overbudget AND @Overbudget is not null)
	OR ([DevelopmentStartDate] = @DevelopmentStartDate AND @DevelopmentStartDate is not null)
	OR ([Launched] = @Launched AND @Launched is not null)
	OR ([DevelopmentStarted] = @DevelopmentStarted AND @DevelopmentStarted is not null)
	OR ([JiraAllowAddJobs] = @JiraAllowAddJobs AND @JiraAllowAddJobs is not null)
	OR ([IsMidProjectSurvey] = @IsMidProjectSurvey AND @IsMidProjectSurvey is not null)
	OR ([MenHours] = @MenHours AND @MenHours is not null)
	OR ([ZohoPotentialId] = @ZohoPotentialId AND @ZohoPotentialId is not null)
	OR ([EnvironmentCode] = @EnvironmentCode AND @EnvironmentCode is not null)
	OR ([Nickname] = @Nickname AND @Nickname is not null)
	SELECT @@ROWCOUNT			
  END