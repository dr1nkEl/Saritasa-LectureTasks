
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Tasks table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_Find]
(

	@SearchUsingOR bit   = null ,

	@TaskID bigint   = null ,

	@Title nvarchar (255)  = null ,

	@TaskText nvarchar (MAX)  = null ,

	@StartDate datetime   = null ,

	@FinishDate datetime   = null ,

	@TypeId char (2)  = null ,

	@DocumentId bigint   = null ,

	@TargetId bigint   = null ,

	@Billable bit   = null ,

	@DurationLimit int   = null ,

	@ClientId int   = null ,

	@ProjectId int   = null ,

	@TesterId int   = null ,

	@IsContainer bit   = null ,

	@MayAddJobs bit   = null ,

	@WorkType int   = null ,

	@MakeJobsBillable bit   = null ,

	@BillableMenHours int   = null ,

	@NonBillableMenHours int   = null ,

	@EmailMessageId varchar (200)  = null ,

	@CurrentPushId bigint   = null ,

	@TechnicalManagerId int   = null ,

	@TaskVerifyId bigint   = null ,

	@DepartmentId int   = null ,

	@Priority int   = null ,

	@LastestReestimationId bigint   = null ,

	@LastestReestimationLimitType int   = null ,

	@LastestReestimationDueDateType int   = null ,

	@SprintId int   = null ,

	@FeatureId int   = null ,

	@LastestReestimationDateTime datetime   = null ,

	@MenHours int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [taskID]
	, [Title]
	, [TaskText]
	, [StartDate]
	, [FinishDate]
	, [TypeId]
	, [DocumentId]
	, [TargetId]
	, [Billable]
	, [DurationLimit]
	, [ClientId]
	, [ProjectId]
	, [TesterId]
	, [IsContainer]
	, [MayAddJobs]
	, [WorkType]
	, [MakeJobsBillable]
	, [BillableMenHours]
	, [NonBillableMenHours]
	, [EmailMessageId]
	, [CurrentPushId]
	, [TechnicalManagerId]
	, [TaskVerifyId]
	, [DepartmentId]
	, [Priority]
	, [LastestReestimationId]
	, [LastestReestimationLimitType]
	, [LastestReestimationDueDateType]
	, [SprintId]
	, [FeatureId]
	, [LastestReestimationDateTime]
	, [MenHours]
    FROM
	[dbo].[Tasks]
    WHERE 
	 ([taskID] = @TaskID OR @TaskID IS NULL)
	AND ([Title] = @Title OR @Title IS NULL)
	AND ([TaskText] = @TaskText OR @TaskText IS NULL)
	AND ([StartDate] = @StartDate OR @StartDate IS NULL)
	AND ([FinishDate] = @FinishDate OR @FinishDate IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([Billable] = @Billable OR @Billable IS NULL)
	AND ([DurationLimit] = @DurationLimit OR @DurationLimit IS NULL)
	AND ([ClientId] = @ClientId OR @ClientId IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([TesterId] = @TesterId OR @TesterId IS NULL)
	AND ([IsContainer] = @IsContainer OR @IsContainer IS NULL)
	AND ([MayAddJobs] = @MayAddJobs OR @MayAddJobs IS NULL)
	AND ([WorkType] = @WorkType OR @WorkType IS NULL)
	AND ([MakeJobsBillable] = @MakeJobsBillable OR @MakeJobsBillable IS NULL)
	AND ([BillableMenHours] = @BillableMenHours OR @BillableMenHours IS NULL)
	AND ([NonBillableMenHours] = @NonBillableMenHours OR @NonBillableMenHours IS NULL)
	AND ([EmailMessageId] = @EmailMessageId OR @EmailMessageId IS NULL)
	AND ([CurrentPushId] = @CurrentPushId OR @CurrentPushId IS NULL)
	AND ([TechnicalManagerId] = @TechnicalManagerId OR @TechnicalManagerId IS NULL)
	AND ([TaskVerifyId] = @TaskVerifyId OR @TaskVerifyId IS NULL)
	AND ([DepartmentId] = @DepartmentId OR @DepartmentId IS NULL)
	AND ([Priority] = @Priority OR @Priority IS NULL)
	AND ([LastestReestimationId] = @LastestReestimationId OR @LastestReestimationId IS NULL)
	AND ([LastestReestimationLimitType] = @LastestReestimationLimitType OR @LastestReestimationLimitType IS NULL)
	AND ([LastestReestimationDueDateType] = @LastestReestimationDueDateType OR @LastestReestimationDueDateType IS NULL)
	AND ([SprintId] = @SprintId OR @SprintId IS NULL)
	AND ([FeatureId] = @FeatureId OR @FeatureId IS NULL)
	AND ([LastestReestimationDateTime] = @LastestReestimationDateTime OR @LastestReestimationDateTime IS NULL)
	AND ([MenHours] = @MenHours OR @MenHours IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [taskID]
	, [Title]
	, [TaskText]
	, [StartDate]
	, [FinishDate]
	, [TypeId]
	, [DocumentId]
	, [TargetId]
	, [Billable]
	, [DurationLimit]
	, [ClientId]
	, [ProjectId]
	, [TesterId]
	, [IsContainer]
	, [MayAddJobs]
	, [WorkType]
	, [MakeJobsBillable]
	, [BillableMenHours]
	, [NonBillableMenHours]
	, [EmailMessageId]
	, [CurrentPushId]
	, [TechnicalManagerId]
	, [TaskVerifyId]
	, [DepartmentId]
	, [Priority]
	, [LastestReestimationId]
	, [LastestReestimationLimitType]
	, [LastestReestimationDueDateType]
	, [SprintId]
	, [FeatureId]
	, [LastestReestimationDateTime]
	, [MenHours]
    FROM
	[dbo].[Tasks]
    WHERE 
	 ([taskID] = @TaskID AND @TaskID is not null)
	OR ([Title] = @Title AND @Title is not null)
	OR ([TaskText] = @TaskText AND @TaskText is not null)
	OR ([StartDate] = @StartDate AND @StartDate is not null)
	OR ([FinishDate] = @FinishDate AND @FinishDate is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([Billable] = @Billable AND @Billable is not null)
	OR ([DurationLimit] = @DurationLimit AND @DurationLimit is not null)
	OR ([ClientId] = @ClientId AND @ClientId is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([TesterId] = @TesterId AND @TesterId is not null)
	OR ([IsContainer] = @IsContainer AND @IsContainer is not null)
	OR ([MayAddJobs] = @MayAddJobs AND @MayAddJobs is not null)
	OR ([WorkType] = @WorkType AND @WorkType is not null)
	OR ([MakeJobsBillable] = @MakeJobsBillable AND @MakeJobsBillable is not null)
	OR ([BillableMenHours] = @BillableMenHours AND @BillableMenHours is not null)
	OR ([NonBillableMenHours] = @NonBillableMenHours AND @NonBillableMenHours is not null)
	OR ([EmailMessageId] = @EmailMessageId AND @EmailMessageId is not null)
	OR ([CurrentPushId] = @CurrentPushId AND @CurrentPushId is not null)
	OR ([TechnicalManagerId] = @TechnicalManagerId AND @TechnicalManagerId is not null)
	OR ([TaskVerifyId] = @TaskVerifyId AND @TaskVerifyId is not null)
	OR ([DepartmentId] = @DepartmentId AND @DepartmentId is not null)
	OR ([Priority] = @Priority AND @Priority is not null)
	OR ([LastestReestimationId] = @LastestReestimationId AND @LastestReestimationId is not null)
	OR ([LastestReestimationLimitType] = @LastestReestimationLimitType AND @LastestReestimationLimitType is not null)
	OR ([LastestReestimationDueDateType] = @LastestReestimationDueDateType AND @LastestReestimationDueDateType is not null)
	OR ([SprintId] = @SprintId AND @SprintId is not null)
	OR ([FeatureId] = @FeatureId AND @FeatureId is not null)
	OR ([LastestReestimationDateTime] = @LastestReestimationDateTime AND @LastestReestimationDateTime is not null)
	OR ([MenHours] = @MenHours AND @MenHours is not null)
	SELECT @@ROWCOUNT			
  END