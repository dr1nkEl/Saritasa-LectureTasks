
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tasks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetByCurrentPushIDTaskIDDocumentIDTypeIDFinishDate]
(

	@CurrentPushId bigint   ,

	@TaskID bigint   ,

	@DocumentId bigint   ,

	@TypeId char (2)  ,

	@FinishDate datetime   
)
AS


				SELECT
					[taskID],
					[Title],
					[TaskText],
					[StartDate],
					[FinishDate],
					[TypeId],
					[DocumentId],
					[TargetId],
					[Billable],
					[DurationLimit],
					[ClientId],
					[ProjectId],
					[TesterId],
					[IsContainer],
					[MayAddJobs],
					[WorkType],
					[MakeJobsBillable],
					[BillableMenHours],
					[NonBillableMenHours],
					[EmailMessageId],
					[CurrentPushId],
					[TechnicalManagerId],
					[TaskVerifyId],
					[DepartmentId],
					[Priority],
					[LastestReestimationId],
					[LastestReestimationLimitType],
					[LastestReestimationDueDateType],
					[SprintId],
					[FeatureId],
					[LastestReestimationDateTime],
					[MenHours]
				FROM
					[dbo].[Tasks]
				WHERE
					[CurrentPushId] = @CurrentPushId
					AND [taskID] = @TaskID
					AND [DocumentId] = @DocumentId
					AND [TypeId] = @TypeId
					AND [FinishDate] = @FinishDate
				SELECT @@ROWCOUNT