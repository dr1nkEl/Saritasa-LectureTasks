
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Tasks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_Insert]
(

	@TaskID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[Tasks]
					(
					[Title]
					,[TaskText]
					,[StartDate]
					,[FinishDate]
					,[TypeId]
					,[DocumentId]
					,[TargetId]
					,[Billable]
					,[DurationLimit]
					,[ClientId]
					,[ProjectId]
					,[TesterId]
					,[IsContainer]
					,[MayAddJobs]
					,[WorkType]
					,[MakeJobsBillable]
					,[BillableMenHours]
					,[NonBillableMenHours]
					,[EmailMessageId]
					,[CurrentPushId]
					,[TechnicalManagerId]
					,[TaskVerifyId]
					,[DepartmentId]
					,[Priority]
					,[LastestReestimationId]
					,[LastestReestimationLimitType]
					,[LastestReestimationDueDateType]
					,[SprintId]
					,[FeatureId]
					,[LastestReestimationDateTime]
					)
				VALUES
					(
					@Title
					,@TaskText
					,@StartDate
					,@FinishDate
					,@TypeId
					,@DocumentId
					,@TargetId
					,@Billable
					,@DurationLimit
					,@ClientId
					,@ProjectId
					,@TesterId
					,@IsContainer
					,@MayAddJobs
					,@WorkType
					,@MakeJobsBillable
					,@BillableMenHours
					,@NonBillableMenHours
					,@EmailMessageId
					,@CurrentPushId
					,@TechnicalManagerId
					,@TaskVerifyId
					,@DepartmentId
					,@Priority
					,@LastestReestimationId
					,@LastestReestimationLimitType
					,@LastestReestimationDueDateType
					,@SprintId
					,@FeatureId
					,@LastestReestimationDateTime
					)
				
				-- Get the identity value
				SET @TaskID = SCOPE_IDENTITY()
									
				-- Select computed columns into output parameters
				SELECT
 @MenHours = [MenHours]
				FROM
					[dbo].[Tasks]
				WHERE
[taskID] = @TaskID