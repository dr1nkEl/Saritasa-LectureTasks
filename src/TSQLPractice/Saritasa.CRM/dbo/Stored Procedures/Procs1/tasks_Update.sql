
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Tasks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_Update]
(

	@TaskID bigint   ,

	@Title nvarchar (255)  ,

	@TaskText nvarchar (MAX)  ,

	@StartDate datetime   ,

	@FinishDate datetime   ,

	@TypeId char (2)  ,

	@DocumentId bigint   ,

	@TargetId bigint   ,

	@Billable bit   ,

	@DurationLimit int   ,

	@ClientId int   ,

	@ProjectId int   ,

	@TesterId int   ,

	@IsContainer bit   ,

	@MayAddJobs bit   ,

	@WorkType int   ,

	@MakeJobsBillable bit   ,

	@BillableMenHours int   ,

	@NonBillableMenHours int   ,

	@EmailMessageId varchar (200)  ,

	@CurrentPushId bigint   ,

	@TechnicalManagerId int   ,

	@TaskVerifyId bigint   ,

	@DepartmentId int   ,

	@Priority int   ,

	@LastestReestimationId bigint   ,

	@LastestReestimationLimitType int   ,

	@LastestReestimationDueDateType int   ,

	@SprintId int   ,

	@FeatureId int   ,

	@LastestReestimationDateTime datetime   ,

	@MenHours int    OUTPUT
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Tasks]
				SET
					[Title] = @Title
					,[TaskText] = @TaskText
					,[StartDate] = @StartDate
					,[FinishDate] = @FinishDate
					,[TypeId] = @TypeId
					,[DocumentId] = @DocumentId
					,[TargetId] = @TargetId
					,[Billable] = @Billable
					,[DurationLimit] = @DurationLimit
					,[ClientId] = @ClientId
					,[ProjectId] = @ProjectId
					,[TesterId] = @TesterId
					,[IsContainer] = @IsContainer
					,[MayAddJobs] = @MayAddJobs
					,[WorkType] = @WorkType
					,[MakeJobsBillable] = @MakeJobsBillable
					,[BillableMenHours] = @BillableMenHours
					,[NonBillableMenHours] = @NonBillableMenHours
					,[EmailMessageId] = @EmailMessageId
					,[CurrentPushId] = @CurrentPushId
					,[TechnicalManagerId] = @TechnicalManagerId
					,[TaskVerifyId] = @TaskVerifyId
					,[DepartmentId] = @DepartmentId
					,[Priority] = @Priority
					,[LastestReestimationId] = @LastestReestimationId
					,[LastestReestimationLimitType] = @LastestReestimationLimitType
					,[LastestReestimationDueDateType] = @LastestReestimationDueDateType
					,[SprintId] = @SprintId
					,[FeatureId] = @FeatureId
					,[LastestReestimationDateTime] = @LastestReestimationDateTime
				WHERE
[taskID] = @TaskID 
				
				
				-- Select computed columns into output parameters
				SELECT
 @MenHours = [MenHours]
				FROM
					[dbo].[Tasks]
				WHERE
[taskID] = @TaskID